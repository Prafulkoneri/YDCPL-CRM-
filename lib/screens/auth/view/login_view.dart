// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/view/bottom_view.dart';
// import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';
// import 'package:ydcpl_application/screens/coc/view/english_coc.dart';
// import 'package:ydcpl_application/screens/home/view/home_view.dart';
// import 'package:ydcpl_application/widgets/buttons.dart';
// import 'package:ydcpl_application/widgets/textfield.dart';

// class LoginViewScreen extends StatefulWidget {
//   const LoginViewScreen({Key? key});

//   @override
//   State<LoginViewScreen> createState() => _LoginViewScreenState();
// }

// class _LoginViewScreenState extends State<LoginViewScreen> {
// @override
// bool passwordVisible = false;

// @override
// void initState() {
//   super.initState();
//   passwordVisible = true;
// }

//   Widget build(BuildContext context) {
//     final watch = context.watch<CocViewController>();
//     final read = context.read<CocViewController>();
//     return Scaffold(
//       backgroundColor: Color(0xffFFFFFF),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image(image: AssetImage("assets/images/Login.png")),
//             SizedBox(
//               height: 15.h,
//             ),
//             Text(
//               'Login',
//               style: GoogleFonts.inter(
//                 textStyle: TextStyle(
//                     color: Color(0xff413185),
//                     letterSpacing: .5,
//                     fontSize: 30.sp,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//             SizedBox(
//               height: 18.h,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 28.w, right: 28.w),
//               child: PrimarySTextFormField(
//                 titleHeader: 'Username',
//                 // controller: watch.ownerNameController,
//                 hintText: "Enter username",
//               ),
//             ),
//             SizedBox(
//               height: 12.h,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 28.w, right: 28.w),
//               child: TextField(
//                 obscureText: passwordVisible,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide:
//                         BorderSide(width: 1.w, color: const Color(0xffDBEEF9)),
//                     borderRadius: BorderRadius.circular(5.w),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 1.w,
//                       color: const Color(0xff8CD4FD),
//                     ),
//                     borderRadius: BorderRadius.circular(5.w),
//                   ),
//                   hintText: "Password",
//                   // labelText: "Password",
//                   // helperText: "Password must contain special character",
//                   // helperStyle: TextStyle(color: Colors.green),
//                   suffixIcon: IconButton(
//                     icon: Icon(passwordVisible
//                         ? Icons.visibility
//                         : Icons.visibility_off),
//                     onPressed: () {
//                       setState(
//                         () {
//                           passwordVisible = !passwordVisible;
//                         },
//                       );
//                     },
//                   ),
//                   alignLabelWithHint: false,
//                   filled: false,
//                 ),
//                 keyboardType: TextInputType.visiblePassword,
//                 textInputAction: TextInputAction.done,
//               ),
//             ),

//             // Container(
//             //   padding: EdgeInsets.only(left: 28.w, right: 28.w),
//             //   child: PrimarySTextFormField(
//             //     suffix: Image(
//             //       image: AssetImage("assets/images/prime_eye.png"),
//             //       height: 1,
//             //     ),
//             //     titleHeader: 'Password',
//             //     hintText: "Enter Password",
//             //   ),
//             // ),
//             SizedBox(
//               height: 38.h,
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const EnglishcocScreenView()),
//                 );

//                 // Navigator.pushReplacement(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //       builder: (context) => const MainScreenView(
//                 //           index: 0,
//                 //           screenName: EnglishcocScreenView(
//                 //               // refreshPage: true,
//                 //               ))),
//                 //   // (Route<dynamic> route) => false,
//                 // );
//               },
//               child: Container(
//                 padding: EdgeInsets.only(left: 28.w, right: 28.w),
//                 child: Image(
//                   image: AssetImage("assets/images/loginbotton.png"),
//                   // height: 1,
//                 ),
//               ),
//             ),
//             // PrimaryButton(
//             //   color: Color(0xff413185),
//             //   // style: style,
//             //   onTap: () async {},
//             //   child: Text(
//             //     'Next',
//             //     style: GoogleFonts.dmSans(
//             //       textStyle: TextStyle(
//             //           color: Colors.white,
//             //           fontSize: 20.sp,
//             //           fontWeight: FontWeight.w700),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/auth/controller/auth_controller.dart';
import 'package:ydcpl_application/screens/bottom_navigation/view/bottom_view.dart';
import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';
import 'package:ydcpl_application/screens/coc/view/english_coc.dart';
import 'package:ydcpl_application/screens/home/view/home_view.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/buttons.dart';
import 'package:ydcpl_application/widgets/textfield.dart';

class LoginViewScreen extends StatefulWidget {
  const LoginViewScreen({Key? key});

  @override
  State<LoginViewScreen> createState() => _LoginViewScreenState();
}

class _LoginViewScreenState extends State<LoginViewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool passwordVisible = true;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<AuthController>().initState(
            context,
          );
    });
    super.initState();

    passwordVisible = true;
    _controller = AnimationController(
      vsync: this,
      duration:
          Duration(seconds: 600), // Adjust the duration as per your preference
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final watch = context.watch<CocViewController>();
    final watch = context.read<AuthController>();
    final read = context.read<AuthController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return isOnline
        ? FadeTransition(
            opacity: _animation,
            child: Scaffold(
              backgroundColor: Color(0xffFFFFFF),
              body: WillPopScope(
                onWillPop: () async {
                  // readMain.onNavigation(
                  //     1, HomePageScreenView(), context, false);
                  // It worked for me instead of above line
                  //            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreenView()),);
                  // Navigator.pop(context);
                  return false;
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image(image: AssetImage("assets/images/Login.png")),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Login',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color(0xff413185),
                              letterSpacing: .5,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 28.w, right: 28.w),
                        child: PrimarySTextFormField(
                          titleHeader: 'Username',
                          controller: watch.emailController,
                          hintText: "Enter username",
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 28.w, right: 28.w),
                        child: TextField(
                          controller: watch.passwordController,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: const Color(0xffDBEEF9)),
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.w,
                                color: const Color(0xff8CD4FD),
                              ),
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff949494)),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(
                                  () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                            alignLabelWithHint: false,
                            filled: false,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          read.onlogin(context);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const EnglishcocScreenView()),
                          // );
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 28.w, right: 28.w),
                          child: Image(
                            image: AssetImage("assets/images/loginbotton.png"),
                            // height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : TestWidget();
  }
}
