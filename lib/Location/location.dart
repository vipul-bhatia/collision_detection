import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
    startBackgroundLocator();
    listenForLocationRequest();
  }

  void startBackgroundLocator() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isRunning = prefs.getBool("isRunning") ?? false;

    if (!isRunning) {
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isRunning", false); // Set isRunning to false when you stop the locator
  }

  void sendLocationDataToServer(double latitude, double longitude) async {
    final String serverUrl = "http://127.0.0.1:8000/location"; // Replace with your FastAPI server's URL
    final response = await http.post(
      Uri.parse(serverUrl),
      body: {
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
      },
    );
    if (response.statusCode == 200) {
      print("Location data sent successfully.");
    } else {
      print("Failed to send location data. Status code: ${response.statusCode}");
    }
  }

  void listenForLocationRequest() async {
    final serverUrl = "http://127.0.0.1:8000/request-location"; // Replace with your FastAPI server's URL

    while (true) {
      final response = await http.get(Uri.parse(serverUrl));

      if (response.statusCode == 200) {
        final responseMessage = response.body;

        if (responseMessage == '{"message": "give location"}') {
          startBackgroundLocator();
        }
      }

      // You can adjust the interval of checking for requests if needed.
      await Future.delayed(const Duration(seconds: 60)); // Check every 60 seconds
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
