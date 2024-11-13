// // import 'dart:io'; //InternetAddress utility
// // import 'dart:async'; //For StreamController/Stream

// // import 'package:connectivity_plus/connectivity_plus.dart';

// // class ConnectionStatusSingleton {
// //   //This creates the single instance by calling the `_internal` constructor specified below
// //   static final ConnectionStatusSingleton _singleton =
// //       new ConnectionStatusSingleton._internal();
// //   ConnectionStatusSingleton._internal();

// //   //This is what's used to retrieve the instance through the app
// //   static ConnectionStatusSingleton getInstance() => _singleton;

// //   //This tracks the current connection status
// //   bool hasConnection = false;

// //   //This is how we'll allow subscribing to connection changes
// //   StreamController connectionChangeController =
// //       new StreamController.broadcast();

// //   //flutter_connectivity
// //   final Connectivity _connectivity = Connectivity();

// //   //Hook into flutter_connectivity's Stream to listen for changes
// //   //And check the connection status out of the gate
// //   void initialize() {
// //     _connectivity.onConnectivityChanged.listen(_connectionChange);
// //     checkConnection();
// //   }

// //   Stream get connectionChange => connectionChangeController.stream;

// //   //A clean up method to close our StreamController
// //   //   Because this is meant to exist through the entire application life cycle this isn't
// //   //   really an issue
// //   void dispose() {
// //     connectionChangeController.close();
// //   }

// //   //flutter_connectivity's listener
// //   void _connectionChange(ConnectivityResult result) {
// //     checkConnection();
// //   }

// //   //The test to actually see if there is a connection
// //   Future<bool> checkConnection() async {
// //     bool previousConnection = hasConnection;

// //     try {
// //       final result = await InternetAddress.lookup('google.com');
// //       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
// //         hasConnection = true;
// //       } else {
// //         hasConnection = false;
// //       }
// //     } on SocketException catch (_) {
// //       hasConnection = false;
// //     }

// //     //The connection status changed send out an update to all listeners
// //     if (previousConnection != hasConnection) {
// //       connectionChangeController.add(hasConnection);
// //     }

// //     return hasConnection;
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ydcpl_application/widgets/buttons.dart';

// class TestWidget extends StatefulWidget {
//   @override
//   TestWidgetState createState() => new TestWidgetState();
// }

// class TestWidgetState extends State<TestWidget> {
//   bool isOffline = false;

//   @override
//   Widget build(BuildContext ctxt) {
//     return (isOffline)
//         ? Column(
//             children: [
//               Center(
//                   child: new Text(
//                 "Not connected",
//                 style: TextStyle(fontSize: 25.w),
//               )),
//             ],
//           )
//         : Scaffold(
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/noInternet.png',
//                     width: 200.h,
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Text(
//                     "No Internet Connections",
//                     style: GoogleFonts.inter(
//                       textStyle: TextStyle(
//                           color: Colors.black,
//                           // letterSpacing: .5,
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Text(
//                     "Internet connection not found",
//                     style: GoogleFonts.inter(
//                       textStyle: TextStyle(
//                           color: Colors.black,
//                           // letterSpacing: .5,
//                           fontSize: 11.sp,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Text(
//                     "Check the connection",
//                     style: GoogleFonts.inter(
//                       textStyle: TextStyle(
//                           color: Colors.black,
//                           // letterSpacing: .5,
//                           fontSize: 11.sp,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Container(
//                     // padding: EdgeInsets.only(left: 30.w, top: 20.w, right: 37.w),
//                     child: PrimaryButton(
//                       child: Text(
//                         'Retry',
//                         style: GoogleFonts.inter(
//                           textStyle: TextStyle(
//                               color: Colors.white,
//                               // letterSpacing: .5,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       width: 105.w,
//                       height: 35.h,
//                       borderColor: Color(0xff413185),
//                       color: Color(0xff413185),
//                       onTap: () {},
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ydcpl_application/widgets/buttons.dart';

class TestWidget extends StatefulWidget {
  @override
  TestWidgetState createState() => TestWidgetState();
}

class TestWidgetState extends State<TestWidget> {
  bool isOffline = false;
  bool isLoading = false; // Track loading state

  void _retry() {
    setState(() {
      isLoading = true; // Show loader
    });

    // Simulate a 3-second delay before hiding loader
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false; // Hide loader
      });
    });
  }

  @override
  Widget build(BuildContext ctxt) {
    return isOffline
        ? Column(
            children: [
              Center(
                child: Text(
                  "Not connected",
                  style: TextStyle(fontSize: 25.w),
                ),
              ),
            ],
          )
        : Scaffold(
            body: Center(
              child: isLoading
                  ? CircularProgressIndicator() // Show loader
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/noInternet.png',
                          width: 200.h,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "No Internet Connections",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "Internet connection not found",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "Check the connection",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          child: PrimaryButton(
                            child: Text(
                              'Retry',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            width: 105.w,
                            height: 35.h,
                            borderColor: Color(0xff413185),
                            color: Color(0xff413185),
                            onTap: _retry, // Call retry function on tap
                          ),
                        ),
                      ],
                    ),
            ),
          );
  }
}
