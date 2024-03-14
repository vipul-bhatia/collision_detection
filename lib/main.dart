
import 'dart:convert';

import 'package:flutter/material.dart';
import './Home/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import './Authentication/AuthDecider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  // Notification system implement here 
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // Initialize the local notifications plugin.
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Request permission to show notifications
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  // Get the token for this device and print it.
  String? token = await messaging.getToken();
  print('FCM Token: $token');

  // sending fcm to server 

    final String serverUrl = "http://10.0.2.2:8000/user"; // Replace with your FastAPI server's URL
  final Map<String, dynamic> data = {
    "fcm": token.toString(),
  };

  final response = await http.post(
    Uri.parse(serverUrl),
    headers: {
      'Content-Type': 'application/json', // Set the content type to JSON
    },
    body: jsonEncode(data), // Serialize the data as JSON
  );

  if (response.statusCode == 200) {
    print("FCM token sent successfully.");
    SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                                   prefs.setString(  
                                  "userid", response.body.toString());
  } else {
    print("Failed to send location data. Status code: ${response.statusCode}");
  }

  // TODO: send the token to your server so it can be associated with this device.

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
      showNotification(flutterLocalNotificationsPlugin, message);
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
      showNotification(flutterLocalNotificationsPlugin, message);
    }
  });
  // till here notification system implement here

  runApp(const MyApp());
  listenForLocationRequest();
}

  void startBackgroundLocator() async {
    bool isRunning = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isRunning = prefs.getBool("isRunning") ?? false;

    if (isRunning) {
      final locationStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      ).listen((Position position) {
        if (position != null) {
          sendLocationDataToServer(position.latitude, position.longitude);
        }
      });

      prefs.setBool("isRunning", true); // Set isRunning to true when you start the locator
    }
  }

void stopBackgroundLocator() async {
  // If you have stored the stream subscription, cancel it
  // positionStream.cancel();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isRunning", false); // Set isRunning to false when you stop the locator
}

void sendLocationDataToServer(double latitude, double longitude) async {
  final String serverUrl = "http://10.0.2.2:8000/location"; // Replace with your FastAPI server's URL
  final Map<String, dynamic> data = {
    "latitude": latitude,
    "longitude": longitude,
  };

  final response = await http.post(
    Uri.parse(serverUrl),
    headers: {
      'Content-Type': 'application/json', // Set the content type to JSON
    },
    body: jsonEncode(data), // Serialize the data as JSON
  );

  if (response.statusCode == 200) {
    print("Location data sent successfully.");
  } else {
    print("Failed to send location data. Status code: ${response.statusCode}");
  }
}


    void listenForLocationRequest() async {
    final serverUrl = "http://10.0.2.2:8000/request-location"; // Replace with your FastAPI server's URL

    while (true) {
      final response = await http.get(Uri.parse(serverUrl));

      if (response.statusCode == 200) {
        final responseMessage = response.body;

        // if (responseMessage == '{"message":"give location"}') {
        //   startBackgroundLocator();
        // }
      }

      // You can adjust the interval of checking for requests if needed.
      await Future.delayed(const Duration(seconds: 10)); // Check every 60 seconds
    }
  }

void showNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, RemoteMessage message) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_ID', 
    'channel name', 
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false
  );
  const IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails();
  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics
  );
  await flutterLocalNotificationsPlugin.show(
    0, 
    message.notification?.title, 
    message.notification?.body, 
    platformChannelSpecifics, 
    payload: 'Default_Sound'
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
      '/':(context)=>  authDecider(),
        // '/': (context) => HomePage(),
      },
    );
  }
}


