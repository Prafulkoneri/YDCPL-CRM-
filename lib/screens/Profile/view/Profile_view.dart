import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/Profile/controller/profile_controller.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/home/view/home_view.dart';
import 'package:ydcpl_application/screens/notification/view/notification_view.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/customebar.dart';
import 'package:ydcpl_application/widgets/image_network.dart';
import 'package:ydcpl_application/widgets/loader.dart';

class ProfileScren extends StatefulWidget {
  const ProfileScren({super.key});

  @override
  State<ProfileScren> createState() => _ProfileScrenState();
}

class _ProfileScrenState extends State<ProfileScren> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileController>().initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final readMain = context.read<MainScreenController>();
    final watch = context.watch<ProfileController>();
    final read = context.read<ProfileController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return isOnline
        ? Scaffold(
            backgroundColor: Color(0xffF7F9FB),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.w),
              child: PrimaryAppBar(
                  onActionTap: () {
                    readMain.onNavigation(
                        2, const Notificatio0nView(), context);
                  },
                  action: SvgPicture.asset(
                    'assets/icons/bell.svg',
                    // width: 20.w,
                    // height: 18.h,
                  ),
                  // : Container(),
                  onBackBtnPressed: () {
                    readMain.onNavigation(
                        2, const HomePageScreenView(), context);
                  },
                  isProfileIconEnabled: false,
                  isBackButtonEnabled: true,
                  title: '${watch.appBar?.nameAppBar ?? ''}'

                  // title: watch.appBar?.imageAppBar == null
                  //     ? Image.asset(
                  //         "assets/images/No profile picture.png",
                  //         height: 15.w,
                  //         fit: BoxFit.cover,
                  //       )
                  //     : Image.network(
                  //         '${watch.appBar?.imageAppBar ?? ''}',
                  //         height: 15.w,
                  //         fit: BoxFit.cover,
                  //       ),
                  // Image.asset(
                  //   'assets/images/image 1 (1).png',
                  //   height: 15.w,
                  // ),
                  //     Image.network(
                  //   '${watch.appBar?.imageAppBar ?? ''}',
                  //   height: 15.w,
                  // ),
                  ),
            ),
            body: watch.isLoading
                ? const Loader()
                : WillPopScope(
                    onWillPop: () async {
                      readMain.onNavigation(
                          1, HomePageScreenView(), context, false);
                      // It worked for me instead of above line
                      //            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreenView()),);
                      //       Navigator.pop(context);
                      return false;
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.w,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20.w, bottom: 20.w),
                          child: Row(
                            children: [
                              ClipOval(
                                child:
                                    watch.profiledata?.employeeProfilePhoto ==
                                            null
                                        ? Image.asset(
                                            "assets/images/No profile picture.png",
                                            height: 74.w,
                                            width: 74.w,
                                            fit: BoxFit.cover,
                                          )
                                        : AppNetworkImages(
                                            imageUrl:
                                                ' ${watch.profiledata?.employeeProfilePhoto}',
                                            height: 74.w,
                                            width: 74.w,
                                            fit: BoxFit.cover,
                                          ),
                                //    Image.network(No profile picture
                                //     '${watch.profiledata?.employeeProfilePhoto}',
                                // height: 74.w,
                                // width: 74.w,
                                // fit: BoxFit
                                //     .cover, // Ensure the image covers the entire circular area
                                //   ),
                              ),
                              SizedBox(
                                width: 20.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${watch.profiledata?.employeeName ?? ''} ",
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color: Color(0xff1B1B1B),
                                          letterSpacing: .5,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Text(
                                    "${watch.profiledata?.designation}",
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color: Color(0xff1B1B1B),
                                          letterSpacing: .5,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "${watch.profiledata?.employeeId}",
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color: Color(0xff1B1B1B),
                                          // letterSpacing: .5,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 20.w,
                          ),
                          child: Text(
                            "My Info ",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color(0xff1B1B1B),
                                  letterSpacing: .5,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 16.w),
                          padding: EdgeInsets.only(
                              left: 10.w, top: 14.w, bottom: 15.w),
                          // height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              border: Border.all(
                                  width: 1.w, color: Color(0xffDBEEF9))),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/mail.svg"),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                "${watch.profiledata?.email}",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color(0xff1B1B1B),
                                      letterSpacing: .5,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 16.w),
                          padding: EdgeInsets.only(
                              left: 10.w, top: 14.w, bottom: 15.w),
                          // height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              border: Border.all(
                                  width: 1.w, color: Color(0xffDBEEF9))),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/call.svg"),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                "${watch.profiledata?.employeeMobileNo}",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color(0xff1B1B1B),
                                      letterSpacing: .5,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 16.w),
                          padding: EdgeInsets.only(
                              left: 10.w, top: 14.w, bottom: 15.w),
                          // height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              border: Border.all(
                                  width: 1.w, color: Color(0xffDBEEF9))),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/ylocation.svg"),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                "${watch.profiledata?.employeeArea}",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color(0xff1B1B1B),
                                      letterSpacing: .5,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
        : TestWidget();
  }
}
