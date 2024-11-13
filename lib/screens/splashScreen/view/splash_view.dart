// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   bool _showBlueScreen = true;

//   @override
//   void initState() {
//     super.initState();
//     // Delay for 3 seconds, then hide the blue screen
//     Future.delayed(Duration(seconds: 3), () {
//       setState(() {
//         _showBlueScreen = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Blue colored screen
//         AnimatedOpacity(
//           opacity: _showBlueScreen ? 1.0 : 0.0,
//           duration: Duration(seconds: 1),
//           curve: Curves.easeInOut,
//           child: Center(
//             child: Image.asset(
//               'assets/images/splash screen (1).png', // Your splash screen image splash screen (1)
//               fit: BoxFit.cover,
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//             ),
//           ),
//         ),
//         // Splash screen image
//         AnimatedOpacity(
//           opacity: _showBlueScreen ? 0.0 : 1.0,
//           duration: Duration(seconds: 1),
//           curve: Curves.easeInOut,
//           child: Center(
//             child: Image.asset(
//               'assets/images/newsplash.png', // Your splash screen image splash screen (1)
//               fit: BoxFit.cover,
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ydcpl_application/screens/auth/view/login_view.dart';
import 'package:ydcpl_application/screens/bottom_navigation/view/bottom_view.dart';
import 'package:ydcpl_application/screens/coc/view/english_coc.dart';
import 'package:ydcpl_application/screens/coc/view/testing_coc.dart';
import 'package:ydcpl_application/screens/home/view/home_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showBlueScreen = true;
  List<bool> _dotIndicators = [
    false,
    false,
    false,
    false,
    false
  ]; // Initial state

  int _currentDotIndex = 0; // Track the index of the currently active dot

  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds, then hide the blue screen
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showBlueScreen = false;
      });
      // After animation completes, navigate to the LoginViewScreen
      Future.delayed(Duration(seconds: 1), () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => LoginViewScreen()),
        // );
        getUserLoggedInState(context);
      });
    });

    // Toggle the active state of dots every 1 second
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dotIndicators[_currentDotIndex] =
            false; // Set the current dot to inactive

        _currentDotIndex = (_currentDotIndex + 1) %
            _dotIndicators.length; // Move to the next dot

        _dotIndicators[_currentDotIndex] = true; // Set the next dot to active
      });
    });
  }

  Future<void> getUserLoggedInState(conte) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("successToken");
    print('//////////////Sharedreferences/////////////////');
    print(token);
    print('//////////////Sharedreferences/////////////////');
    await const Duration(milliseconds: 1500);
    if (token != null) {
      // Check if the user has agreed to the terms and conditions
      bool hasAgreed = pref.getBool("hasAgreedToCOC") ?? false;
      if (hasAgreed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreenView(
              index: 2,
              screenName: HomePageScreenView(),
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EnglishcocScreenView(screenName: ' '),
          ),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginViewScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blue colored screen
        AnimatedOpacity(
          opacity: _showBlueScreen ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Center(
            child: Image.asset(
              'assets/images/splash screen (1).png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
        // Splash screen image
        AnimatedOpacity(
          opacity: _showBlueScreen ? 0.0 : 1.0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/newsplash.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Positioned(
                top: 250, // Adjust position as needed
                left: 0,
                right: 0,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < _dotIndicators.length; i++)
                      _buildDotIndicator(_dotIndicators[i]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDotIndicator(bool isActive) {
    return AnimatedOpacity(
      opacity: isActive ? 1.0 : 0.5,
      duration: Duration(milliseconds: 500),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: isActive ? 10 : 5,
        height: isActive ? 10 : 5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? Colors.blue
              : Colors.red, // Blue if active, red if inactive
        ),
      ),
    );
  }
}
