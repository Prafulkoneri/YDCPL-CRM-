// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';

// class CombinedCocScreenView extends StatefulWidget {
//   const CombinedCocScreenView({Key? key}) : super(key: key);

//   @override
//   State<CombinedCocScreenView> createState() => _CombinedCocScreenViewState();
// }

// class _CombinedCocScreenViewState extends State<CombinedCocScreenView>
//     with SingleTickerProviderStateMixin {
//   bool _showContainer = false; // Track if the container should be shown or not
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();

//     _tabController = TabController(length: 3, vsync: this);

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

//     return Scaffold(
//       body: WillPopScope(
//         onWillPop: () async {
//           return false;
//         },
//         child: TabBarView(
//           controller: _tabController,
//           children: [
//             _buildLanguageScreen(context, 'English', () {
//               // Define the onTap action for the English screen, if any.
//             }),
//             _buildLanguageScreen(context, 'Hindi', () {
//               _tabController.animateTo(0); // Switch to the English tab
//             }),
//             _buildLanguageScreen(context, 'Marathi', () {
//               _tabController.animateTo(1); // Switch to the Hindi tab
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguageScreen(
//       BuildContext context, String language, VoidCallback onBackTap) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Image(image: AssetImage("assets/images/appb.png")),
//           ],
//         ),
//         Container(
//           padding: EdgeInsets.all(20.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: onBackTap,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: SvgPicture.asset(
//                     'assets/icons/backword.svg',
//                     color: Color.fromARGB(255, 3, 18, 228),
//                   ),
//                 ),
//               ),
//               Text(
//                 language,
//                 style: GoogleFonts.inter(
//                   textStyle: TextStyle(
//                     color: Color(0xff413185),
//                     letterSpacing: .5,
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               if (language == 'Marathi')
//                 SvgPicture.asset('assets/icons/forword.svg', color: Colors.grey)
//               else
//                 SvgPicture.asset('assets/icons/forword.svg', color: Colors.blue)
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/bottom_navigation/view/bottom_view.dart';
import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';
import 'package:ydcpl_application/screens/coc/view/hindi_coc.dart';
import 'package:ydcpl_application/screens/coc/view/marathi.dart';
import 'package:ydcpl_application/screens/home/view/home_view.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/utils/utils.dart';
import 'package:ydcpl_application/widgets/buttons.dart';
import 'package:ydcpl_application/widgets/customebar.dart';

class EnglishcocScreenView extends StatefulWidget {
  final String? screenName;
  const EnglishcocScreenView({Key? key, required this.screenName})
      : super(key: key);

  @override
  State<EnglishcocScreenView> createState() => _EnglishcocScreenViewState();
}

class _EnglishcocScreenViewState extends State<EnglishcocScreenView>
    with SingleTickerProviderStateMixin {
  bool _showContainer = false;
  late TabController _tabController;
  int _countdown = 5; // Add countdown variable

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<CocViewController>().initState(context);
    });

    // Start the countdown timer
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
        setState(() {
          _showContainer = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<CocViewController>();
    final read = context.read<CocViewController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return isOnline
        ? Scaffold(
            body: WillPopScope(
              onWillPop: () async {
                // widget.screenName=='HomePage'
                if (widget.screenName == "HomePage") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreenView(
                        index: 2,
                        screenName: HomePageScreenView(),
                      ),
                    ),
                  );
                }
                return false;
                // return false;
              },
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLanguageScreen(context, 'English', () {
                    // Define the onTap action for the English screen, if any.
                  }),
                  _buildLanguageScreen(context, 'Hindi', () {
                    _tabController.animateTo(0); // Switch to the English tab
                  }),
                  _buildLanguageScreen(context, 'Marathi', () {
                    _tabController.animateTo(1); // Switch to the Hindi tab
                  }),
                ],
              ),
            ),
          )
        : TestWidget();
  }

  Widget _buildLanguageScreen(
      BuildContext context, String language, VoidCallback onBackTap) {
    final watch = context.watch<CocViewController>();
    final read = context.read<CocViewController>();
    final readmain = context.watch<MainScreenController>();

    return Column(
      children: [
        Stack(
          children: [
            Image(image: AssetImage("assets/images/appb.png")),
            Positioned(
                right: 0.w,
                left: 0,
                bottom: 20.w,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 15.w, top: 2, bottom: 2.w, right: 15.w),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 5, 52, 138),
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Text(
                      '${watch.appBar?.nameAppBar ?? ''}',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                )
                //  Image(
                //   image: NetworkImage('${watch.appBar?.nameAppBar ?? ''}'),
                //   height: 20.h,
                //   width: 40.h,
                // ),
                )
          ],
        ),
        Container(
          padding: EdgeInsets.all(20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onBackTap,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                    'assets/icons/backword.svg',
                    color: language == 'English'
                        ? Colors.grey
                        : Color.fromARGB(255, 3, 18, 228),
                  ),
                ),
              ),
              Text(
                language,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Color(0xff413185),
                    letterSpacing: .5,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (language != 'Marathi')
                InkWell(
                  onTap: () {
                    if (language == 'English') {
                      _tabController.animateTo(1); // Switch to the Hindi tab
                    } else if (language == 'Hindi') {
                      _tabController.animateTo(2); // Switch to the Marathi tab
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.0, right: 8.0),
                    child: SvgPicture.asset('assets/icons/forword.svg'),
                  ),
                )
              else
                SvgPicture.asset(
                  'assets/icons/forword.svg',
                  color: Colors.grey,
                ),
            ],
          ),
        ),
        Divider(
          indent: 15.w,
          endIndent: 15.w,
          thickness: 2,
          color: Color(0xffE3F5FF),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: RawScrollbar(
              thickness: 2.w,
              thumbColor: Colors.blue,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (language == 'English')
                        HtmlWidget(watch.htmlContentEnglish)
                      else if (language == 'Hindi')
                        HtmlWidget(watch.htmlContentMarathi)
                      else if (language == 'Marathi')
                        HtmlWidget(watch.htmlContentHindi),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_showContainer)
          widget.screenName != 'HomePage'
              ? Container(
                  padding: EdgeInsets.only(
                      left: 19.w, top: 25.w, bottom: 42.w, right: 16.w),
                  color: Color(0xffE7F6FF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              read.onChecked();
                            },
                            child: watch.isChecked
                                ? SvgPicture.asset(
                                    'assets/icons/ion_checkbox.svg')
                                : Container(
                                    margin: EdgeInsets.only(
                                        right: 5.w, bottom: 2.5.w),
                                    height: 20.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffD9D9D9),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(2)),
                                    ),
                                  ),
                          ),
                          Text(
                            "Agree to COC ",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Color(0xff1B1B1B),
                                letterSpacing: .5,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      PrimaryButton(
                        width: 150.w,
                        height: 45.w,
                        color: Color(0xff413185),
                        onTap: () async {
                          // Check if the user has agreed to the terms and conditions
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          bool hasAgreedToCOC =
                              pref.getBool("hasAgreedToCOC") ?? false;
                          if (hasAgreedToCOC) {
                            // Proceed with the submission if the user has agreed
                            // return;
                            print("object");
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
                            // Show a snackbar if the user hasn't agreed
                            Utils.showPrimarySnackbar(
                              context,
                              ' Please agree to the COC',
                              type: SnackType.error,
                            );
                          }
                        },
                        child: Text(
                          "Submit",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(
                      left: 19.w, top: 25.w, bottom: 42.w, right: 16.w),
                  color: Color(0xffE7F6FF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              read.onCheckedlog();
                            },
                            child: watch.isCheckedlog
                                ? SvgPicture.asset(
                                    'assets/icons/ion_checkbox.svg')
                                : Container(
                                    margin: EdgeInsets.only(
                                        right: 5.w, bottom: 2.5.w),
                                    height: 20.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffD9D9D9),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(2)),
                                    ),
                                  ),
                          ),
                          Text(
                            "Agree to COC ",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Color(0xff1B1B1B),
                                letterSpacing: .5,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      PrimaryButton(
                        width: 150.w,
                        height: 45.w,
                        color: Color(0xff413185),
                        onTap: () async {
                          // Check if the user has agreed to the terms and conditions
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          bool hasAgreedToCOClog =
                              pref.getBool("hasAgreedToCOClog") ?? false;
                          if (hasAgreedToCOClog) {
                            print("object");
                            readmain.logOut(context);
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const MainScreenView(
                            //       index: 2,
                            //       screenName: HomePageScreenView(),
                            //     ),
                            //   ),
                            // );
                          } else {
                            // Show a snackbar if the user hasn't agreed
                            Utils.showPrimarySnackbar(
                              context,
                              ' Please agree to the COC',
                              type: SnackType.error,
                            );
                          }
                        },
                        child: Text(
                          "Logout",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
        else
          Container(
            padding: EdgeInsets.all(16.0),
            color: Color(0xffE7F6FF),
            child: Center(
              child: Text(
                'Wait: $_countdown seconds',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Color(0xff1B1B1B),
                    letterSpacing: .5,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
