// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:ydcpl_application/screens/bottom_navigation/view/bottom_view.dart';
// // import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';
// // import 'package:ydcpl_application/screens/coc/view/hindi_coc.dart';
// // import 'package:ydcpl_application/screens/coc/view/marathi.dart';
// // import 'package:ydcpl_application/screens/home/view/home_view.dart';
// // import 'package:ydcpl_application/utils/utils.dart';
// // import 'package:ydcpl_application/widgets/buttons.dart';
// // import 'package:ydcpl_application/widgets/customebar.dart';

// // class EnglishcocScreenView extends StatefulWidget {
// //   const EnglishcocScreenView({Key? key}) : super(key: key);

// //   @override
// //   State<EnglishcocScreenView> createState() => _EnglishcocScreenViewState();
// // }

// // class _EnglishcocScreenViewState extends State<EnglishcocScreenView> {
// //   @override
// //   void initState() {
// //     SchedulerBinding.instance.addPostFrameCallback((_) {
// //       context.read<CocViewController>().initState(context);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final watch = context.watch<CocViewController>();
// //     final read = context.read<CocViewController>();
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           Stack(
// //             children: [
// //               Image(image: AssetImage("assets/images/appb.png")),
// //               Positioned(
// //                 right: 0.w,
// //                 left: 0,
// //                 bottom: 20.w,
// //                 child: Image(
// //                   image: NetworkImage('${watch.appBar?.imageAppBar ?? ''}'),
// //                   height: 20.h,
// //                   width: 40.h,
// //                 ),
// //               )
// //             ],
// //           ),
// //           Container(
// //             padding: EdgeInsets.all(20.w),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 SvgPicture.asset('assets/icons/backword.svg'),
// //                 Text(
// //                   "English",
// //                   style: GoogleFonts.inter(
// //                     textStyle: TextStyle(
// //                         color: Color(0xff413185),
// //                         letterSpacing: .5,
// //                         fontSize: 15.sp,
// //                         fontWeight: FontWeight.w500),
// //                   ),
// //                 ),
// //                 InkWell(
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => HindicocScreenView(),
// //                       ),
// //                     );
// //                   },
// //                   child: Padding(
// //                     padding: EdgeInsets.only(
// //                         left: 18.0, right: 8.0), // Adjust padding as needed
// //                     child: SvgPicture.asset('assets/icons/forword.svg'),
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //           Divider(
// //             indent: 15.w,
// //             endIndent: 15.w,
// //             thickness: 2,
// //             color: Color(0xffE3F5FF),
// //           ),
// //           Expanded(
// //             child: Padding(
// //               padding: const EdgeInsets.all(15.0),
// //               child: RawScrollbar(
// //                 thickness: 2.w,
// //                 thumbColor: Colors.blue,
// //                 child: SingleChildScrollView(
// //                   scrollDirection: Axis.vertical,
// //                   physics: const BouncingScrollPhysics(),
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Column(
// //                       children: [
// //                         HtmlWidget(watch.htmlContentEnglish),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Container(
// //             padding: EdgeInsets.only(
// //                 left: 19.w, top: 25.w, bottom: 42.w, right: 16.w),
// //             // height: 100,
// //             color: Color(0xffE7F6FF),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Row(
// //                   children: [
// //                     GestureDetector(
// //                         onTap: () {
// //                           read.onChecked();
// //                         },
// //                         child: watch.isChecked
// //                             ? SvgPicture.asset(
// //                                 'assets/icons/ion_checkbox.svg',
// //                                 // width: 20.w,
// //                                 // height: 18.h,
// //                               )
// //                             : Container(
// //                                 margin:
// //                                     EdgeInsets.only(right: 5.w, bottom: 2.5.w),
// //                                 height: 20.h,
// //                                 width: 20.w,
// //                                 decoration: BoxDecoration(
// //                                     color:
// //                                         //  watch.isChecked
// //                                         //     ? Colors.blue
// //                                         //     :
// //                                         const Color(0xffD9D9D9),
// //                                     borderRadius: const BorderRadius.all(
// //                                         Radius.circular(2))),
// //                               )),
// //                     Text(
// //                       "Agree to COC ",
// //                       style: GoogleFonts.inter(
// //                         textStyle: TextStyle(
// //                             color: Color(0xff1B1B1B),
// //                             letterSpacing: .5,
// //                             fontSize: 12.sp,
// //                             fontWeight: FontWeight.w600),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 PrimaryButton(
// //                   width: 150.w,
// //                   height: 45.w,
// //                   color: Color(0xff413185),
// //                   onTap: () async {
// //                     // Check if the user has agreed to the terms and conditions
// //                     SharedPreferences pref =
// //                         await SharedPreferences.getInstance();
// //                     bool hasAgreedToCOC =
// //                         pref.getBool("hasAgreedToCOC") ?? false;
// //                     if (hasAgreedToCOC) {
// //                       // Proceed with the submission if the user has agreed
// //                       print("object");
// //                       Navigator.pushReplacement(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => const MainScreenView(
// //                             index: 2,
// //                             screenName: HomePageScreenView(),
// //                           ),
// //                         ),
// //                       );
// //                     } else {
// //                       // Show a snackbar if the user hasn't agreed
// //                       Utils.showPrimarySnackbar(
// //                         context,
// //                         ' Please agree to the COC',
// //                         type: SnackType.error,
// //                       );
// //                     }
// //                   },
// //                   child: Text(
// //                     "Submit",
// //                     style: GoogleFonts.inter(
// //                       textStyle: TextStyle(
// //                         color: Colors.white,
// //                         letterSpacing: .5,
// //                         fontSize: 16.sp,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ),
// //                 )
// //               ],
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ydcpl_application/screens/auth/view/login_view.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/view/bottom_view.dart';
// import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';
// import 'package:ydcpl_application/screens/coc/view/hindi_coc.dart';
// import 'package:ydcpl_application/screens/coc/view/marathi.dart';
// import 'package:ydcpl_application/screens/home/view/home_view.dart';
// import 'package:ydcpl_application/utils/utils.dart';
// import 'package:ydcpl_application/widgets/buttons.dart';
// import 'package:ydcpl_application/widgets/customebar.dart';

// class EnglishcocScreenView extends StatefulWidget {
//   const EnglishcocScreenView({Key? key}) : super(key: key);

//   @override
//   State<EnglishcocScreenView> createState() => _EnglishcocScreenViewState();
// }

// class _EnglishcocScreenViewState extends State<EnglishcocScreenView> {
//   bool _showContainer = false; // Track if the container should be shown or not

//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<CocViewController>().initState(context);
//     });
//     Timer(Duration(seconds: 9), () {
//       setState(() {
//         _showContainer = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final watch = context.watch<CocViewController>();
//     final read = context.read<CocViewController>();
//     // final readMain = context.watch<MainScreenController>();

//     return Scaffold(
//       body: WillPopScope(
//         onWillPop: () async {
//           return false;
//         },
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Image(image: AssetImage("assets/images/appb.png")),
                // Positioned(
                //   right: 0.w,
                //   left: 0,
                //   bottom: 20.w,
                //   child: Image(
                //     image: NetworkImage('${watch.appBar?.imageAppBar ?? ''}'),
                //     height: 20.h,
                //     width: 40.h,
                //   ),
                // )
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.all(20.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SvgPicture.asset('assets/icons/backword.svg'),
//                   Text(
//                     "English",
//                     style: GoogleFonts.inter(
//                       textStyle: TextStyle(
//                           color: Color(0xff413185),
//                           letterSpacing: .5,
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HindicocScreenView(),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           left: 18.0, right: 8.0), // Adjust padding as needed
//                       child: SvgPicture.asset('assets/icons/forword.svg'),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Divider(
//               indent: 15.w,
//               endIndent: 15.w,
//               thickness: 2,
//               color: Color(0xffE3F5FF),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: RawScrollbar(
//                   thickness: 2.w,
//                   thumbColor: Colors.blue,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     physics: const BouncingScrollPhysics(),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           HtmlWidget(watch.htmlContentEnglish),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (_showContainer)
//               Container(
//                 padding: EdgeInsets.only(
//                     left: 19.w, top: 25.w, bottom: 42.w, right: 16.w),
//                 // height: 100,
//                 color: Color(0xffE7F6FF),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         GestureDetector(
//                             onTap: () {
//                               read.onChecked();
//                             },
//                             child: watch.isChecked
//                                 ? SvgPicture.asset(
//                                     'assets/icons/ion_checkbox.svg',
//                                     // width: 20.w,
//                                     // height: 18.h,
//                                   )
//                                 : Container(
//                                     margin: EdgeInsets.only(
//                                         right: 5.w, bottom: 2.5.w),
//                                     height: 20.h,
//                                     width: 20.w,
//                                     decoration: BoxDecoration(
//                                         color: const Color(0xffD9D9D9),
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(2))),
//                                   )),
//                         Text(
//                           "Agree to COC ",
//                           style: GoogleFonts.inter(
//                             textStyle: TextStyle(
//                                 color: Color(0xff1B1B1B),
//                                 letterSpacing: .5,
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ],
//                     ),
//                     PrimaryButton(
//                       width: 150.w,
//                       height: 45.w,
//                       color: Color(0xff413185),
//                       onTap: () async {
//                         // Check if the user has agreed to the terms and conditions
//                         SharedPreferences pref =
//                             await SharedPreferences.getInstance();
//                         bool hasAgreedToCOC =
//                             pref.getBool("hasAgreedToCOC") ?? false;
//                         if (hasAgreedToCOC) {
//                           // Proceed with the submission if the user has agreed
//                           print("object");
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const MainScreenView(
//                                 index: 2,
//                                 screenName: HomePageScreenView(),
//                               ),
//                             ),
//                           );
//                         } else {
//                           // Show a snackbar if the user hasn't agreed
//                           Utils.showPrimarySnackbar(
//                             context,
//                             ' Please agree to the COC',
//                             type: SnackType.error,
//                           );
//                         }
//                       },
//                       child: Text(
//                         "Submit",
//                         style: GoogleFonts.inter(
//                           textStyle: TextStyle(
//                             color: Colors.white,
//                             letterSpacing: .5,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }
