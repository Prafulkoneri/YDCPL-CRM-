import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
import 'package:ydcpl_application/screens/notification/view/notification_view.dart';
import 'package:ydcpl_application/screens/setting/controller/setting_controller.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/customebar.dart';
import 'package:ydcpl_application/widgets/loader.dart';
import 'package:ydcpl_application/widgets/textfield.dart';

import '../../../widgets/buttons.dart';

class SettingViewScreen extends StatefulWidget {
  const SettingViewScreen({super.key});

  @override
  State<SettingViewScreen> createState() => _SettingViewScreenState();
}

class _SettingViewScreenState extends State<SettingViewScreen> {
  bool switchValue = true;
  bool passwordVisibles = true;
  bool passwordVisibless = true;
  bool passwordVisiblesss = true;

  void onToggleSwitch(bool value) {
    setState(() {
      switchValue = value;
    });
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ChangeSettingController>().initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final readMain = context.read<MainScreenController>();
    final watch = context.watch<ChangeSettingController>();
    final read = context.read<ChangeSettingController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return isOnline
        ? Scaffold(
            backgroundColor: Color(0xffF7F9FB),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.w),
              child: PrimaryAppBar(
                  action: GestureDetector(
                    onTap: () {
                      readMain.onNavigation(
                          2, const Notificatio0nView(), context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/bell.svg',
                      // width: 20.w,
                      // height: 18.h,
                    ),
                  ),
                  // : Container(),
                  onProfileIconPressed: () {
                    readMain.onNavigation(2, const ProfileScren(), context);
                  },
                  isProfileIconEnabled: true,
                  isBackButtonEnabled: false,
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
                  ),
            ),
            body: watch.isLoading
                ? const Loader()
                : WillPopScope(
                    onWillPop: () async {
                      // SystemNavigator.pop();
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
                          padding: EdgeInsets.only(left: 13.w, right: 12.w),
                          child: Text(
                            "Settings",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color(0xff1B1B1B),
                                  // letterSpacing: .5,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          // height: 120.w,
                          color: Color(0xffEFF9FF),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.only(left: 13.w, right: 12.w),
                                child: Text(
                                  "Change Password ",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        color: Color(0xff1B1B1B),
                                        // letterSpacing: .5,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 13.w, top: 10.w, right: 12.w),
                                child: TextField(
                                  controller: watch.oldpasswordController,
                                  obscureText: passwordVisibles,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.w,
                                          color: const Color(0xffDBEEF9)),
                                      borderRadius: BorderRadius.circular(5.w),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.w,
                                        color: const Color(0xff8CD4FD),
                                      ),
                                      borderRadius: BorderRadius.circular(5.w),
                                    ),
                                    hintText: "Current Password",
                                    suffixIcon: IconButton(
                                      icon: Icon(passwordVisibles
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisibles =
                                                !passwordVisibles;
                                          },
                                        );
                                      },
                                    ),
                                    alignLabelWithHint: false,
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                ),
                                //  PrimarySTextFormField(
                                //   controller: watch.oldpasswordController,
                                //   suffix: Icon(Icons.remove_red_eye),
                                //   hintText: "Enter Current Password",
                                // ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 13.w, top: 10.w, right: 12.w),
                                child: TextField(
                                  controller: watch.passwordController,
                                  obscureText: passwordVisibless,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.w,
                                          color: const Color(0xffDBEEF9)),
                                      borderRadius: BorderRadius.circular(5.w),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.w,
                                        color: const Color(0xff8CD4FD),
                                      ),
                                      borderRadius: BorderRadius.circular(5.w),
                                    ),
                                    hintText: "New Password",
                                    suffixIcon: IconButton(
                                      icon: Icon(passwordVisibless
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisibless =
                                                !passwordVisibless;
                                          },
                                        );
                                      },
                                    ),
                                    alignLabelWithHint: false,
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                ),
                                //  PrimarySTextFormField(
                                //   controller: watch.passwordController,
                                //   suffix: Icon(Icons.remove_red_eye),
                                //   hintText: "Enter New Password",
                                // ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 13.w, top: 10.w, right: 12.w),
                                child: TextField(
                                  controller: watch.confirmController,
                                  obscureText: passwordVisiblesss,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.w,
                                          color: const Color(0xffDBEEF9)),
                                      borderRadius: BorderRadius.circular(5.w),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.w,
                                        color: const Color(0xff8CD4FD),
                                      ),
                                      borderRadius: BorderRadius.circular(5.w),
                                    ),
                                    hintText: "Confirm Password",
                                    suffixIcon: IconButton(
                                      icon: Icon(passwordVisiblesss
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisiblesss =
                                                !passwordVisiblesss;
                                          },
                                        );
                                      },
                                    ),
                                    alignLabelWithHint: false,
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                ),
                                // PrimarySTextFormField(
                                //   controller: watch.confirmController,
                                //   suffix: Icon(Icons.remove_red_eye),
                                //   hintText: "Re-enter New Password",
                                // ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 13.w, top: 10.w, right: 12.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    PrimaryButton(
                                      width: 162.w,
                                      height: 37.w,
                                      borderColor: Color(0xff413185),
                                      color: Colors.white,
                                      // style: style,
                                      onTap: () async {
                                        print("object");
                                        read.refreshState(context);
                                      },
                                      child: Text(
                                        'Clear',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              color: Color(0xff413185),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    PrimaryButton(
                                      borderRadius: 10,
                                      width: 162.w,
                                      height: 37.w,
                                      borderColor: Color(0xff413185),
                                      color: Color(0xff413185).withOpacity(0.9),
                                      // style: style,
                                      onTap: () async {
                                        read.UpdatePassword(context);
                                      },
                                      child: Text(
                                        'Save',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 18.w, right: 12.w),
                          color: Color(0xffEFF9FF),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Notifications",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color(0xff1B1B1B),
                                      // letterSpacing: .5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Transform.scale(
                                  scale:
                                      0.8, // Adjust the scale factor as needed
                                  child: CupertinoSwitch(
                                    value: watch.bakendNotification == 'yes',
                                    activeColor: Color(0xff413185),
                                    onChanged: read.onToggleSwitch,
                                  )),
                            ],
                          ),
                        ),

                        // Expanded(
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.vertical,
                        //     physics: BouncingScrollPhysics(),
                        //     shrinkWrap: true,
                        //     // scrollDirection: ,
                        //     padding: EdgeInsets.only(left: 12, right: 14, top: 10.h),
                        //     itemCount: 6,
                        //     itemBuilder: (context, index) {
                        //       return Container(
                        //         margin: EdgeInsets.only(bottom: 10.w),
                        //         decoration: BoxDecoration(
                        //           boxShadow: [
                        //             BoxShadow(
                        //               offset: Offset(3, 3),
                        //               blurRadius: 12,
                        //               color: Color.fromRGBO(0, 0, 0, 0.16),
                        //             ),
                        //           ],
                        //           color: Colors.white,
                        //           borderRadius: BorderRadius.circular(15),
                        //         ),
                        //         // width: 100.w,
                        //         child: Column(
                        //           children: [
                        //             Container(
                        //               padding:
                        //                   EdgeInsets.only(left: 12.w, right: 14.w, top: 10.w),
                        //               child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Row(
                        //                     children: [
                        // Text(
                        //   "Customer Name : ",
                        //   style: GoogleFonts.inter(
                        //     textStyle: TextStyle(
                        //         color: Color(0xff707070),
                        //         letterSpacing: .5,
                        //         fontSize: 12.sp,
                        //         fontWeight: FontWeight.w500),
                        //   ),
                        // ),
                        //                       Text(
                        //                         "Mr. Umesh Kumar ",
                        //                         style: GoogleFonts.inter(
                        //                           textStyle: TextStyle(
                        //                               color: Color(0xff1B1B1B),
                        //                               letterSpacing: .5,
                        //                               fontSize: 12.sp,
                        //                               fontWeight: FontWeight.w500),
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   GestureDetector(
                        //                       onTap: () {
                        //                         // Navigator.push(
                        //                         //   context,
                        //                         //   MaterialPageRoute(
                        //                         //       builder: (context) => HindicocScreenView()),
                        //                         // );
                        //                       },
                        //                       child: SvgPicture.asset(
                        //                         'assets/icons/forword.svg',
                        //                         color: Color(0xff787878),
                        //                       )),
                        //                 ],
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 10.w,
                        //             ),
                        //             Container(
                        //               padding:
                        //                   EdgeInsets.only(left: 12.w, right: 14.w, top: 10.w),
                        //               child: Row(
                        //                 children: [
                        //                   Text(
                        //                     "LAN No :",
                        //                     style: GoogleFonts.inter(
                        //                       textStyle: TextStyle(
                        //                           color: Color(0xff707070),
                        //                           letterSpacing: .5,
                        //                           fontSize: 12.sp,
                        //                           fontWeight: FontWeight.w500),
                        //                     ),
                        //                   ),
                        //                   Text(
                        //                     "501123606",
                        //                     style: GoogleFonts.inter(
                        //                       textStyle: TextStyle(
                        //                           color: Color(0xff1B1B1B),
                        //                           letterSpacing: .5,
                        //                           fontSize: 12.sp,
                        //                           fontWeight: FontWeight.w500),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 6.w,
                        //             ),
                        //             Container(
                        //               padding:
                        //                   EdgeInsets.only(left: 12.w, right: 14.w, top: 10.w),
                        //               child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Container(
                        //                     height: 40.h,
                        //                     padding: EdgeInsets.only(
                        //                         left: 11.w,
                        //                         bottom: 7.w,
                        //                         right: 75.w,
                        //                         top: 8.w),
                        //                     decoration: BoxDecoration(
                        //                         borderRadius: BorderRadius.circular(5),
                        //                         color: Color(0xffEFF9FF),
                        //                         border: Border.all(color: Color(0xff8CD4FD))),
                        //                     child: Column(
                        //                       children: [
                        //                         Text(
                        //                           "EMI Amount",
                        //                           style: GoogleFonts.inter(
                        //                             textStyle: TextStyle(
                        //                                 color: Color(0xff413185),
                        //                                 letterSpacing: .5,
                        //                                 fontSize: 10.sp,
                        //                                 fontWeight: FontWeight.w400),
                        //                           ),
                        //                         ),
                        //                         Text(
                        //                           "₹ 30,000",
                        //                           style: GoogleFonts.inter(
                        //                             textStyle: TextStyle(
                        //                                 color: Color(0xff413185),
                        //                                 letterSpacing: .5,
                        //                                 fontSize: 14.sp,
                        //                                 fontWeight: FontWeight.w700),
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   Container(
                        //                     height: 40.h,
                        //                     padding: EdgeInsets.only(
                        //                         left: 11.w,
                        //                         bottom: 7.w,
                        //                         right: 75.w,
                        //                         top: 8.w),
                        //                     decoration: BoxDecoration(
                        //                         borderRadius: BorderRadius.circular(5),
                        //                         color: Color(0xffFFEDED),
                        //                         border: Border.all(color: Color(0xffFDA8A8))),
                        //                     child: Column(
                        //                       children: [
                        //                         Text(
                        //                           "Total Due",
                        //                           style: GoogleFonts.inter(
                        //                             textStyle: TextStyle(
                        //                                 color: Color(0xffCF1515),
                        //                                 letterSpacing: .5,
                        //                                 fontSize: 10.sp,
                        //                                 fontWeight: FontWeight.w400),
                        //                           ),
                        //                         ),
                        //                         Text(
                        //                           "₹ 60,000",
                        //                           style: GoogleFonts.inter(
                        //                             textStyle: TextStyle(
                        //                                 color: Color(0xffCF1515),
                        //                                 letterSpacing: .5,
                        //                                 fontSize: 14.sp,
                        //                                 fontWeight: FontWeight.w700),
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 9.h,
                        //             ),
                        //             Container(
                        //               padding: EdgeInsets.only(
                        //                   left: 12.w, right: 13.w, top: 6.w, bottom: 7.w),
                        //               // height: 20.w,
                        //               decoration: BoxDecoration(
                        //                   color: Color(0xffD8F1FF),
                        //                   borderRadius: BorderRadius.only(
                        //                     bottomLeft: Radius.circular(15),
                        //                     bottomRight: Radius.circular(15),
                        //                   )),
                        //               child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Row(
                        //                     children: [
                        //                       Text(
                        //                         "Disposition Code :",
                        //                         style: GoogleFonts.inter(
                        //                           textStyle: TextStyle(
                        //                               color: Color(0xff1B1B1B),
                        //                               letterSpacing: .5,
                        //                               fontSize: 11.sp,
                        //                               fontWeight: FontWeight.w500),
                        //                         ),
                        //                       ),
                        //                       Text(
                        //                         "PTP",
                        //                         style: GoogleFonts.inter(
                        //                           textStyle: TextStyle(
                        //                               color: Color(0xff1B1B1B),
                        //                               letterSpacing: .5,
                        //                               fontSize: 12.sp,
                        //                               fontWeight: FontWeight.w500),
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   Text(
                        //                     "23 March 2024",
                        //                     style: GoogleFonts.inter(
                        //                       textStyle: TextStyle(
                        //                           color: Color(0xff1B1B1B),
                        //                           letterSpacing: .5,
                        //                           fontSize: 11.sp,
                        //                           fontWeight: FontWeight.w500),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ))
        : TestWidget();
  }
}
