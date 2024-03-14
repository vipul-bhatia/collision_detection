// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:rive_animation/Contects/contactDetails.dart';
// import '../Authentication/AuthOnboarding.dart';
// import '../Home/crashDetails.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           TextButton(onPressed: (){
//             Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                         builder: (context) => ContactDetails()));
//           }
//           , child: Text('Contact Details', style: TextStyle(color: Colors.black),)),
//           TextButton(child: Text('Logout', style: TextStyle(color: Colors.black  ),), onPressed: (){
//           FirebaseAuth.instance.signOut();
//           Navigator.of(context).pushReplacement(
//                                     MaterialPageRoute(
//                                         builder: (context) => AuthOnboarding()));
//         })
//         ],
//       ),
//     body: Center(
//       child: ListView(
//         children: [
//          // Generated code for this Container Widget...
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Text('Crashes',style: TextStyle(fontSize: 21),),
//          ),
// Padding(
//   padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//   child: Container(
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(
//           blurRadius: 3,
//           color: Color(0x33000000),
//           offset: Offset(0, 1),
//         )
//       ],
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               'https://www.screen.studio/_next/static/media/logo-transparent.681d19be.png',
//               width: 44,
//               height: 44,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Crash 1',
//                     style: TextStyle(
//                           fontFamily: 'Plus Jakarta Sans',
//                           color: Color(0xFF101213),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//                     child: Text(
//                       'Location: Mansarover, Jaipur',
//                       style: TextStyle(
//                             fontFamily: 'Plus Jakarta Sans',
//                             color: Color(0xFF57636C),
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 '24th July 2023',
//                 style: TextStyle(
//                       fontFamily: 'Plus Jakarta Sans',
//                       color: Color(0xFF101213),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                         builder: (context) => crashDetails()));
//                 },
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
//                   child: Container(
//                     height: 32,
//                     decoration: BoxDecoration(
//                       color: Color(0x66249689),
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: Color(0xFF39D2C0),
//                         width: 2,
//                       ),
//                     ),
//                     child: Align(
//                       alignment: AlignmentDirectional(0, 0),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
//                         child: Text(
//                           'See on map',
//                           style:
//                               TextStyle(
//                                     fontFamily: 'Plus Jakarta Sans',
//                                     color: Color(0xFF101213),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   ),
// ),

// Padding(
//   padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//   child: Container(
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(
//           blurRadius: 3,
//           color: Color(0x33000000),
//           offset: Offset(0, 1),
//         )
//       ],
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               'https://www.screen.studio/_next/static/media/logo-transparent.681d19be.png',
//               width: 44,
//               height: 44,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Crash 2',
//                     style: TextStyle(
//                           fontFamily: 'Plus Jakarta Sans',
//                           color: Color(0xFF101213),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//                     child: Text(
//                       'Location: Gunjan Nagar, Vapi',
//                       style: TextStyle(
//                             fontFamily: 'Plus Jakarta Sans',
//                             color: Color(0xFF57636C),
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 '12th March 2022',
//                 style: TextStyle(
//                       fontFamily: 'Plus Jakarta Sans',
//                       color: Color(0xFF101213),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//               ),
//               GestureDetector(
//                   onTap: () {
//                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                         builder: (context) => crashDetails()));
//                 },
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
//                   child: Container(
//                     height: 32,
//                     decoration: BoxDecoration(
//                       color: Color(0x66249689),
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: Color(0xFF39D2C0),
//                         width: 2,
//                       ),
//                     ),
//                     child: Align(
//                       alignment: AlignmentDirectional(0, 0),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
//                         child: Text(
//                           'See on map',
//                           style:
//                               TextStyle(
//                                     fontFamily: 'Plus Jakarta Sans',
//                                     color: Color(0xFF101213),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
// Padding(
//   padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//   child: Container(
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(
//           blurRadius: 3,
//           color: Color(0x33000000),
//           offset: Offset(0, 1),
//         )
//       ],
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               'https://www.screen.studio/_next/static/media/logo-transparent.681d19be.png',
//               width: 44,
//               height: 44,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Crash 3',
//                     style: TextStyle(
//                           fontFamily: 'Plus Jakarta Sans',
//                           color: Color(0xFF101213),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//                     child: Text(
//                       'Location: Hospital Road Baran, Jaipur',
//                       style: TextStyle(
//                             fontFamily: 'Plus Jakarta Sans',
//                             color: Color(0xFF57636C),
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 '26th April 2022',
//                 style: TextStyle(
//                       fontFamily: 'Plus Jakarta Sans',
//                       color: Color(0xFF101213),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//               ),
//               GestureDetector(
//                   onTap: () {
//                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                         builder: (context) => crashDetails()));
//                 },
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
//                   child: Container(
//                     height: 32,
//                     decoration: BoxDecoration(
//                       color: Color(0x66249689),
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: Color(0xFF39D2C0),
//                         width: 2,
//                       ),
//                     ),
//                     child: Align(
//                       alignment: AlignmentDirectional(0, 0),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
//                         child: Text(
//                           'See on map',
//                           style:
//                               TextStyle(
//                                     fontFamily: 'Plus Jakarta Sans',
//                                     color: Color(0xFF101213),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   ),
// ),

//         ],
//     ),
//     ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive_animation/Contects/contactDetails.dart';
import 'package:rive_animation/CrashView/crashDetailPage.dart';
import 'package:rive_animation/Home/crashDetails.dart';
import 'package:rive_animation/profile/profileScreen.dart';

import '../DriverAnalysis/driverAnalysisPage.dart';



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void contactsScreen(BuildContext context) {
  //   Navigator.of(context).pushNamed('/alumini');
  // }


final List<Map<String, dynamic>> _bottomNavBarItems = [
  {
    'activeIcon': SvgPicture.asset('icons_up/Home Screen/home_c.svg', color: Colors.black, width: 24, height: 24),
    'inactiveIcon': SvgPicture.asset('icons_up/Home Screen/home.svg', color: Colors.black,width: 24, height: 24),
    'label': 'Home',
  },
  {
    'activeIcon': SvgPicture.asset('icons_up/Home Screen/analysis_c.svg', color: Colors.black,width: 24, height: 24),
    'inactiveIcon':SvgPicture.asset('icons_up/Home Screen/analysis.svg', color: Color(0xFF120E16),width: 24, height: 24),
    'label': 'Discover',
  },
  {
    'activeIcon': SvgPicture.asset('icons_up/Home Screen/profile_c.svg', color: Colors.black,width: 24, height: 24),
    'inactiveIcon': SvgPicture.asset('icons_up/Home Screen/profile.svg', color: Color(0xFF120E16),width: 24, height: 24),
    'label': 'Write Post',
  },

];

  final List<Map<String, dynamic>> _pages = [
    {
      'Pages': crashDetails(),

    },
    {
      'Pages':AnalysisWidget(),

    },
    {
      'Pages': ProfileWidget(),

    },
  ];
  int _SeletedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _SeletedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
  bool shouldShowAppBar = [0,  ].contains(_SeletedPageIndex);

    return DefaultTabController(
        length: 3,
        // initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xFF613FE5),
            ),
            backgroundColor: Color(0xFFF6F6F7),
            title: // searchbutton with space
                  shouldShowAppBar ?  SizedBox(
                    height: 30,
                    child: TextFormField(
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF606A85),
                        fontSize: 8,  // reduced from 10 to 8
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E7EB),
                          width: 1,  // reduced from 2 to 1
                        ),
                        borderRadius: BorderRadius.circular(8),  // reduced from 12 to 8
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6F61EF),
                          width: 1,  // reduced from 2 to 1
                        ),
                        borderRadius: BorderRadius.circular(8),  // reduced from 12 to 8
                      ),
                      contentPadding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),  // reduced padding from 20 to 15
                      suffixIcon: Icon(
                        Icons.search_rounded,
                        color: Color(0xFF606A85),
                        size: 18,  // optionally, you can adjust this for a smaller icon
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF15161E),
                      fontSize: 12,  // reduced from 14 to 12
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: Color(0xFF6F61EF),
                  ),
                  )
:
           
               Text(''),
            actions: [
                 IconButton(
                   onPressed: () {
                    //  Navigator.of(context).push(
                    //                    MaterialPageRoute(
                    //                        builder: (context) => ContactDetails()));
                   },
                   icon: Icon(Icons.help_outline_sharp),
                   iconSize: 22,
                 ),
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  color: Color(0xFF120E16),
                  child: Text(
                    'ResQ-Notify!',
                    style: TextStyle(
                      color: Color(0xFFF6F6F7),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                ListTile(
                  leading: Icon(Icons.add_ic_call_outlined, color: Color(0xFF613FE5), size: 32),
                  title: Text(
                    'Add Contacts',
                    style: TextStyle(fontSize: 17),
                  ),
                  onTap: () {
                       Navigator.of(context).push(
                                       MaterialPageRoute(
                                           builder: (context) => ContactDetails()));
                  },
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.attribution_outlined,
                    color: Color(0xFF613FE5),
                    size: 32,
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(fontSize: 17),
                  ),
                  onTap: () {
                    // Navigator.of(context).pushNamed('/ourCollege');
                  },
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),

              
                ListTile(
                  leading:
                      Icon(Icons.help_outline_rounded, color: Color(0xFF613FE5), size: 32),
                  title: Text(
                    'Help Center',
                    style: TextStyle(fontSize: 17),
                  ),
                  onTap: () {
                    // Navigator.of(context).pushNamed('/collegeClubs');
                  },
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                ListTile(
                  leading: Icon(Icons.feedback_outlined,
                      color: Color(0xFF613FE5), size: 32),
                  title: Text(
                    'Feedback/Suggestions',
                    style: TextStyle(fontSize: 17),
                  ),
                  onTap: () {
                    // Navigator.of(context).pushNamed('/feedback');
                  },
                ),
              ],
            ),
          ),
          body: _pages[_SeletedPageIndex]['Pages'],
bottomNavigationBar: Container(
  height: 50,
  color: Color(0xFFF6F6F7),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: _bottomNavBarItems.map((item) {
      int index = _bottomNavBarItems.indexOf(item);
      return Expanded(
        child: InkWell(
          onTap: () => _selectPage(index),
          child: Container(
            padding: EdgeInsets.all(0.0), // 5px padding to increase tappable area
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 3,
                  color: _SeletedPageIndex == index ? Color(0xFF613FE5) : Colors.transparent,
                ),
                SizedBox(
                  height: 10,
                ),
                _SeletedPageIndex == index ? item['activeIcon'] : item['inactiveIcon'],
              ],
            ),
          ),
        ),
      );
    }).toList(),
  ),
),




        ));
  }
}