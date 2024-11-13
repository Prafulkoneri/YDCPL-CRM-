import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
import 'package:ydcpl_application/screens/home_view_details/view/home_view_details.dart';
import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
import 'package:ydcpl_application/screens/update_satus/controller/update_status_controller.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/customebar.dart';
import 'package:ydcpl_application/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class UpdateHomeViewDetailsScreen extends StatefulWidget {
  final String? customerId;
  final String? loanId;
  const UpdateHomeViewDetailsScreen({super.key, this.customerId, this.loanId});

  @override
  State<UpdateHomeViewDetailsScreen> createState() =>
      _UpdateHomeViewDetailsScreenState();
}

class _UpdateHomeViewDetailsScreenState
    extends State<UpdateHomeViewDetailsScreen> {
  bool _isExpanded = false;
  void initState() {
    log(widget.customerId ?? '');
    log(widget.loanId ?? '');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context
          .read<UpdateController>()
          .initState(context, widget.loanId, widget.customerId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final readMain = context.read<MainScreenController>();
    final watch = context.watch<UpdateController>();
    final read = context.read<UpdateController>();
    final watchView = context.watch<HomeDetailsController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return isOnline
        ? Scaffold(
            backgroundColor: Color(0xffF7F9FB),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.w),
              child: PrimaryAppBar(
                  // onActionTap: () {
                  //   readMain.onNavigation(2, const ProfileScren(), context);
                  // },
                  // action: SvgPicture.asset(
                  //   'assets/icons/userprofile.svg',
                  //   // width: 20.w,
                  //   // height: 18.h,
                  // ),
                  // : Container(),
                  onBackBtnPressed: () {
                    print(watchView
                        .homeListDetailsdata?.customerDetails?.customerId);
                    print(
                        watchView.homeListDetailsdata?.customerDetails?.loanId);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => HomeViewDetailsScreen(
                    //           customerId: watchView
                    //               .homeListDetailsdata?.customerDetails?.customerId
                    //               .toString(),
                    //           loanId: watchView
                    //               .homeListDetailsdata?.customerDetails?.loanId)),
                    // );
                    // return;
                    readMain.onNavigation(
                        1,
                        HomeViewDetailsScreen(
                            customerId: watchView.homeListDetailsdata
                                ?.customerDetails?.customerId
                                .toString(),
                            loanId: watchView
                                .homeListDetailsdata?.customerDetails?.loanId),
                        context,
                        false);
                    readMain.hideBottomNavigationBar();
                    Navigator.pop(context);
                  },
                  // isProfileIconEnabled: true,
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
                  ),
            ),
            body: WillPopScope(
              onWillPop: () async {
                readMain.onNavigation(
                    1,
                    HomeViewDetailsScreen(
                        customerId: watchView
                            .homeListDetailsdata?.customerDetails?.customerId
                            .toString(),
                        loanId: watchView
                            .homeListDetailsdata?.customerDetails?.loanId),
                    context,
                    false);
                readMain.hideBottomNavigationBar();
                // It worked for me instead of above line
                //            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreenView()),);
                //       Navigator.pop(context);
                return true;
              },
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.w,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 14.w, right: 13.w, bottom: 10.w),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 3),
                                  blurRadius: 12,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // width: 100.w,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 12.w, right: 14.w, top: 10.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          // homeListDetailsdata?.customerDetails?.customerName
                                          "${watchView.homeListDetailsdata?.customerDetails?.customerName} ",
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                color: Color(0xff1B1B1B),
                                                // letterSpacing: .5,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${watchView.homeListDetailsdata?.customerDetails?.productName} ",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              color: Color(0xff1B1B1B),
                                              // letterSpacing: .5,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 12.w, right: 14.w, top: 10.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "LAN No :",
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xff707070),
                                                  letterSpacing: .5,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Text(
                                            " ${watchView.homeListDetailsdata?.customerDetails?.loanId} ",
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xff1B1B1B),
                                                  letterSpacing: .5,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${watchView.homeListDetailsdata?.customerDetails?.productCategoryName}",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              color: Color(0xff1B1B1B),
                                              // letterSpacing: .5,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 12.w,
                                      right: 13.w,
                                      top: 6.w,
                                      bottom: 7.w),
                                  // height: 20.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xffD8F1FF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      )),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Disposition Code :",
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xff1B1B1B),
                                                  letterSpacing: .5,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Text(
                                            "${watchView.homeListDetailsdata?.customerDetails?.dispoCode}",
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xff1B1B1B),
                                                  letterSpacing: .5,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${watchView.homeListDetailsdata?.customerDetails?.createdAt} ",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              color: Color(0xff1B1B1B),
                                              letterSpacing: .5,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 19.w, right: 12.w),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 3),
                                  blurRadius: 12,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8.h,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 19.w, right: 37.w),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Principal Outstanding ",
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Color(0xff413185),
                                                    // letterSpacing: .5,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Total Outstanding     ",
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xff413185),
                                                  // letterSpacing: .5,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "₹${watchView.homeListDetailsdata?.customerDetails?.principalOs}",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xff413185),
                                                  // letterSpacing: .5,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                // Text(
                                                //   "",
                                                //   style: GoogleFonts.inter(
                                                //     textStyle: TextStyle(
                                                //         color: Color(0xff413185),
                                                //         // letterSpacing: .5,
                                                //         fontSize: 14.sp,
                                                //         fontWeight: FontWeight.w600),
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  "₹ ${watchView.homeListDetailsdata?.customerDetails?.totalOs}",
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xff413185),
                                                        // letterSpacing: .5,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Container(
                                //   padding: EdgeInsets.only(left: 19.w, right: 37.w),
                                //   child: Column(
                                //     // crossAxisAlignment: CrossAxisAlignment.center,
                                //     // mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Row(
                                //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Expanded(
                                //             child: Text(
                                //               "Principal Outstanding ",
                                //               style: GoogleFonts.inter(
                                //                 textStyle: TextStyle(
                                //                     color: Color(0xff413185),
                                //                     // letterSpacing: .5,
                                //                     fontSize: 12.sp,
                                //                     fontWeight: FontWeight.w500),
                                //               ),
                                //             ),
                                //           ),
                                //           Text(
                                //             "Total Outstanding  ",
                                //             style: GoogleFonts.inter(
                                //               textStyle: TextStyle(
                                //                   color: Color(0xff413185),
                                //                   // letterSpacing: .5,
                                //                   fontSize: 12.sp,
                                //                   fontWeight: FontWeight.w500),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //       Container(
                                //         padding: EdgeInsets.only(right: 22.w),
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           // crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: [
                                //             Text(
                                //               "₹ ${watchView.homeListDetailsdata?.customerDetails?.principalOs}",
                                //               textAlign: TextAlign.start,
                                //               style: GoogleFonts.inter(
                                //                 textStyle: TextStyle(
                                //                     color: Color(0xff413185),
                                //                     // letterSpacing: .5,
                                //                     fontSize: 14.sp,
                                //                     fontWeight: FontWeight.w600),
                                //               ),
                                //             ),
                                //             Text(
                                //               "₹ ${watchView.homeListDetailsdata?.customerDetails?.totalOs}",
                                //               style: GoogleFonts.inter(
                                //                 textStyle: TextStyle(
                                //                     color: Color(0xff413185),
                                //                     // letterSpacing: .5,
                                //                     fontSize: 14.sp,
                                //                     fontWeight: FontWeight.w600),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 19.w, right: 37.w),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Last Payment ",
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Color(0xff413185),
                                                    // letterSpacing: .5,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Last Payment Date    ",
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xff413185),
                                                  // letterSpacing: .5,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "₹${watchView.homeListDetailsdata?.customerDetails?.lastPayment}",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xff413185),
                                                  // letterSpacing: .5,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "",
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xff413185),
                                                        // letterSpacing: .5,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Text(
                                                  "     ${watchView.homeListDetailsdata?.customerDetails?.lastPaymentDate}",
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xff413185),
                                                        // letterSpacing: .5,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 25.h,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 19.w, right: 37.w),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total Due ",
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xffCF1515),
                                                  // letterSpacing: .5,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 55.w,
                                                ),
                                                Text(
                                                  "Due Date  ",
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xffCF1515),
                                                        // letterSpacing: .5,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "₹ ${watchView.homeListDetailsdata?.customerDetails?.totalOs}",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xffCF1515),
                                                  // letterSpacing: .5,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "",
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xff413185),
                                                        // letterSpacing: .5,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  "${watchView.homeListDetailsdata?.customerDetails?.dueDate}",
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xffCF1515),
                                                        // letterSpacing: .5,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Container(
                                //   padding: EdgeInsets.only(left: 19.w, right: 37.w),
                                //   child: Column(
                                //     // crossAxisAlignment: CrossAxisAlignment.center,
                                //     // mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Expanded(
                                //             child: Text(
                                //               "Total Due ",
                                //               style: GoogleFonts.inter(
                                //                 textStyle: TextStyle(
                                //                     color: Color(0xffCF1515),
                                //                     // letterSpacing: .5,
                                //                     fontSize: 12.sp,
                                //                     fontWeight: FontWeight.w500),
                                //               ),
                                //             ),
                                //           ),
                                // Text(
                                //   "Due Date                  ",
                                //   style: GoogleFonts.inter(
                                //     textStyle: TextStyle(
                                //         color: Color(0xffCF1515),
                                //         // letterSpacing: .5,
                                //         fontSize: 12.sp,
                                //         fontWeight: FontWeight.w500),
                                //   ),
                                // ),
                                //         ],
                                //       ),
                                //       Container(
                                //         padding: EdgeInsets.only(right: 25.w),
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           // crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: [
                                // Text(
                                //   "₹ ${watchView.homeListDetailsdata?.customerDetails?.totalOs}",
                                //   textAlign: TextAlign.start,
                                //   style: GoogleFonts.inter(
                                //     textStyle: TextStyle(
                                //         color: Color(0xffCF1515),
                                //         // letterSpacing: .5,
                                //         fontSize: 14.sp,
                                //         fontWeight: FontWeight.w600),
                                //   ),
                                // ),
                                // Text(
                                //   "${watchView.homeListDetailsdata?.customerDetails?.dueDate}",
                                //   style: GoogleFonts.inter(
                                //     textStyle: TextStyle(
                                //         color: Color(0xffCF1515),
                                //         // letterSpacing: .5,
                                //         fontSize: 14.sp,
                                //         fontWeight: FontWeight.w600),
                                //   ),
                                // ),
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                SizedBox(
                                  height: 19.h,
                                )
                              ],
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 19.w, right: 12.w),
                          //   decoration: BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //         offset: Offset(3, 3),
                          //         blurRadius: 12,
                          //         color: Color.fromRGBO(0, 0, 0, 0.16),
                          //       ),
                          //     ],
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(15),
                          //   ),
                          //   child: Column(
                          //     children: [
                          //       SizedBox(
                          //         height: 8.h,
                          //       ),
                          //       Container(
                          //         padding: EdgeInsets.only(left: 19.w, right: 37.w),
                          //         child: Column(
                          //           // crossAxisAlignment: CrossAxisAlignment.center,
                          //           // mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Row(
                          //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Expanded(
                          //                   child: Text(
                          //                     "Principal Outstanding ",
                          //                     style: GoogleFonts.inter(
                          //                       textStyle: TextStyle(
                          //                           color: Color(0xff413185),
                          //                           // letterSpacing: .5,
                          //                           fontSize: 12.sp,
                          //                           fontWeight: FontWeight.w500),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Text(
                          //                   "Total Outstanding",
                          //                   style: GoogleFonts.inter(
                          //                     textStyle: TextStyle(
                          //                         color: Color(0xff413185),
                          //                         // letterSpacing: .5,
                          //                         fontSize: 12.sp,
                          //                         fontWeight: FontWeight.w500),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             Row(
                          //               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //               // crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Expanded(
                          //                   child: Text(
                          //                     "₹${watchView.homeListDetailsdata?.customerDetails?.principalOs} ",
                          //                     textAlign: TextAlign.start,
                          //                     style: GoogleFonts.inter(
                          //                       textStyle: TextStyle(
                          //                           color: Color(0xff413185),
                          //                           // letterSpacing: .5,
                          //                           fontSize: 14.sp,
                          //                           fontWeight: FontWeight.w600),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Text(
                          //                   "₹${watchView.homeListDetailsdata?.customerDetails?.totalOs}",
                          //                   style: GoogleFonts.inter(
                          //                     textStyle: TextStyle(
                          //                         color: Color(0xff413185),
                          //                         // letterSpacing: .5,
                          //                         fontSize: 14.sp,
                          //                         fontWeight: FontWeight.w600),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         height: 25.h,
                          //       ),
                          //       Container(
                          //         padding: EdgeInsets.only(left: 19.w, right: 37.w),
                          //         child: Column(
                          //           // crossAxisAlignment: CrossAxisAlignment.center,
                          //           // mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Row(
                          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Text(
                          //                   "Last Payment ",
                          //                   style: GoogleFonts.inter(
                          //                     textStyle: TextStyle(
                          //                         color: Color(0xff413185),
                          //                         // letterSpacing: .5,
                          //                         fontSize: 12.sp,
                          //                         fontWeight: FontWeight.w500),
                          //                   ),
                          //                 ),
                          //                 Text(
                          //                   "Last Payment Date",
                          //                   style: GoogleFonts.inter(
                          //                     textStyle: TextStyle(
                          //                         color: Color(0xff413185),
                          //                         // letterSpacing: .5,
                          //                         fontSize: 12.sp,
                          //                         fontWeight: FontWeight.w500),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Expanded(
                          //                   child: Text(
                          //                     "₹${watchView.homeListDetailsdata?.customerDetails?.lastPayment}",
                          //                     textAlign: TextAlign.start,
                          //                     style: GoogleFonts.inter(
                          //                       textStyle: TextStyle(
                          //                           color: Color(0xff413185),
                          //                           // letterSpacing: .5,
                          //                           fontSize: 14.sp,
                          //                           fontWeight: FontWeight.w600),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Text(
                          //                   "${watchView.homeListDetailsdata?.customerDetails?.lastPaymentDate}",
                          //                   style: GoogleFonts.inter(
                          //                     textStyle: TextStyle(
                          //                         color: Color(0xff413185),
                          //                         // letterSpacing: .5,
                          //                         fontSize: 14.sp,
                          //                         fontWeight: FontWeight.w600),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         height: 10.h,
                          //       ),
                          //       Container(
                          //         padding: EdgeInsets.only(left: 19.w, right: 37.w),
                          //         child: Column(
                          //           // crossAxisAlignment: CrossAxisAlignment.center,
                          //           // mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //               padding: EdgeInsets.only(right: 29.w),
                          //               child: Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.spaceBetween,
                          //                 children: [
                          //                   Text(
                          //                     "Total Due ",
                          //                     style: GoogleFonts.inter(
                          //                       textStyle: TextStyle(
                          //                           color: Color(0xffCF1515),
                          //                           // letterSpacing: .5,
                          //                           fontSize: 12.sp,
                          //                           fontWeight: FontWeight.w500),
                          //                     ),
                          //                   ),
                          //                   Text(
                          //                     "Due Date",
                          //                     style: GoogleFonts.inter(
                          //                       textStyle: TextStyle(
                          //                           color: Color(0xffCF1515),
                          //                           // letterSpacing: .5,
                          //                           fontSize: 12.sp,
                          //                           fontWeight: FontWeight.w500),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //             Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               // crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Text(
                          //                   "₹${watchView.homeListDetailsdata?.customerDetails?.totalOs}",
                          //                   textAlign: TextAlign.start,
                          //                   style: GoogleFonts.inter(
                          //                     textStyle: TextStyle(
                          //                         color: Color(0xffCF1515),
                          //                         // letterSpacing: .5,
                          //                         fontSize: 14.sp,
                          //                         fontWeight: FontWeight.w600),
                          //                   ),
                          //                 ),
                          //                 Text(
                          //                   "${watchView.homeListDetailsdata?.customerDetails?.dueDate} ",
                          //                   style: GoogleFonts.inter(
                          //                     textStyle: TextStyle(
                          //                         color: Color(0xffCF1515),
                          //                         // letterSpacing: .5,
                          //                         fontSize: 14.sp,
                          //                         fontWeight: FontWeight.w600),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         height: 19.h,
                          //       )
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 22.w),
                            child: Text(
                              "Upload Status",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: Color(0xff1B1B1B),
                                    letterSpacing: .5,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 13.w, right: 14.w, top: 13.w),
                            child: Text(
                              "Disposition Code",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    // letterSpacing: .5,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 13.w, right: 14.w, top: 13.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xffE7F6FF)), // Border color
                              borderRadius: BorderRadius.circular(
                                  8), // Optional: Border radius
                            ),
                            child: Column(
                              children: [
                                ExpansionTile(
                                  controller: watch
                                      .depositionCodeExpansionTileController,
                                  title: Text(
                                    " Select Code : ${watch.disname}",
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color: Color(0xff413185),
                                          // letterSpacing: .5,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  trailing: watch.isExpanded
                                      ? Icon(Icons.arrow_drop_up)
                                      : Icon(Icons
                                          .arrow_drop_down), // Change trailing icon based on _isExpanded
                                  onExpansionChanged: (isExpanded) {
                                    read.toggleExpansion(isExpanded);
                                    // read.getAddressList(context, watch.loanId);
                                  },
                                  children: <Widget>[
                                    Container(
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemCount: watch.dispostionCodeListData
                                                ?.length ??
                                            0,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          final element = watch
                                              .dispostionCodeListData?[index];
                                          return GestureDetector(
                                            onTap: () {
                                              read.getSubCode(
                                                  context,
                                                  element?.id.toString(),
                                                  element?.despositionCode ??
                                                      '');
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 28.w,
                                                  top: 17.w,
                                                  right: 12.w),
                                              margin:
                                                  EdgeInsets.only(bottom: 10.w),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                top: BorderSide(
                                                  //                   <--- right side
                                                  color: Color(0xffDBEEF9),
                                                  width: 1.0,
                                                ),
                                              )),
                                              child: Text(
                                                "${element?.despositionCode}",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff1B1B1B),
                                                      // letterSpacing: .5,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 13.w, right: 14.w, top: 13.w),
                            child: Text(
                              "Disposition Subcode",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    // letterSpacing: .5,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 13.w, right: 14.w, top: 13.w),
                            child: Column(
                              children: [
                                Container(
                                  // margin: EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color:
                                            Color(0xffE7F6FF)), // Border color
                                    borderRadius: BorderRadius.circular(
                                        8), // Optional: Border radius
                                  ),
                                  child: Column(
                                    children: [
                                      ExpansionTile(
                                        controller: watch
                                            .depositionSubCodeExpansionTileController,
                                        // tilePadding: EdgeInsets.zero,
                                        title: Text(
                                          "Select Code : ${watch.disSubCode}",
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                color: Color(0xff413185),
                                                // letterSpacing: .5,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        trailing: watch.isExpanded
                                            ? Icon(Icons.arrow_drop_up)
                                            : Icon(Icons
                                                .arrow_drop_down), // Change trailing icon based on _isExpanded
                                        onExpansionChanged: (isExpanded) {
                                          read.toggleExpansion(isExpanded);
                                        },
                                        // Add any single widget you want to display when the tile is expanded
                                        children: <Widget>[
                                          Container(
                                            child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              itemCount: watch
                                                      .getSubcodeList?.length ??
                                                  0,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                final element = watch
                                                    .getSubcodeList?[index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    print(element
                                                        ?.despositionSubcode);
                                                    read.selectsubCode(
                                                        context,
                                                        element
                                                            ?.despositionSubcode);
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 28.w,
                                                        top: 17.w,
                                                        right: 12.w),
                                                    margin: EdgeInsets.only(
                                                        bottom: 10.w),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                      top: BorderSide(
                                                        //                   <--- right side
                                                        color:
                                                            Color(0xffDBEEF9),
                                                        width: 1.0,
                                                      ),
                                                    )),
                                                    child: Text(
                                                      "${element?.despositionSubcode}",
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            color: Color(
                                                                0xff1B1B1B),
                                                            // letterSpacing: .5,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                          // Padding(
                                          //   padding: const EdgeInsets.all(16.0),
                                          //   child: Text('Expanded Content'),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          watch.isRTPSelected
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(
                                      left: 13.w, right: 14.w, top: 13.w),
                                  child: PrimarySTextFormField(
                                    titleHeader: 'Amount paid',
                                    controller: watch.amountController,
                                    hintText: "Enter amount",
                                  ),
                                ),
                          // watch.isRTPSelected || watch.isPTPSelected
                          //     ? Container()
                          //     : Container(
                          //         margin: EdgeInsets.only(
                          //             left: 13.w, right: 14.w, top: 13.w),
                          //         child: Text(
                          //           "Paid Status",
                          //           style: GoogleFonts.inter(
                          //             textStyle: TextStyle(
                          //                 color: Colors.black,
                          //                 // letterSpacing: .5,
                          //                 fontSize: 14.sp,
                          //                 fontWeight: FontWeight.w500),
                          //           ),
                          //         ),
                          //       ),
                          // watch.isRTPSelected || watch.isPTPSelected
                          //     ? Container()
                          //     : Container(
                          //         margin: EdgeInsets.only(
                          //             left: 13.w, right: 14.w, top: 13.w),
                          //         decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           border: Border.all(
                          //               color: Color(0xffE7F6FF)), // Border color
                          //           borderRadius: BorderRadius.circular(
                          //               8), // Optional: Border radius
                          //         ),
                          //         child: Column(
                          //           children: [
                          //             ExpansionTile(
                          //               title: Text(
                          //                 "Select Code",
                          //                 style: GoogleFonts.inter(
                          //                   textStyle: TextStyle(
                          //                       color: Color(0xff413185),
                          //                       // letterSpacing: .5,
                          //                       fontSize: 12.sp,
                          //                       fontWeight: FontWeight.w600),
                          //                 ),
                          //               ),
                          //               trailing: watch.isExpanded
                          //                   ? Icon(Icons.arrow_drop_up)
                          //                   : Icon(Icons
                          //                       .arrow_drop_down), // Change trailing icon based on _isExpanded
                          //               onExpansionChanged: (isExpanded) {
                          //                 read.toggleExpansion(isExpanded);
                          //                 // read.getAddressList(context, watch.loanId);
                          //               },
                          //               // Add any single widget you want to display when the tile is expanded
                          //               children: <Widget>[
                          //                 Container(
                          //                   child: ListView.builder(
                          //                     padding: EdgeInsets.zero,
                          //                     itemCount: 2,
                          //                     // watch.addressdata?.length ?? 0,
                          //                     shrinkWrap: true,
                          //                     itemBuilder: (context, index) {
                          //                       // final element = watch.addressdata?[index];
                          //                       return Container(
                          //                         padding: EdgeInsets.only(
                          //                             left: 28.w,
                          //                             top: 17.w,
                          //                             right: 12.w),
                          //                         margin: EdgeInsets.only(bottom: 10.w),
                          //                         decoration: BoxDecoration(
                          //                             border: Border(
                          //                           top: BorderSide(
                          //                             //                   <--- right side
                          //                             color: Color(0xffDBEEF9),
                          //                             width: 1.0,
                          //                           ),
                          //                         )),
                          //                         child: Column(
                          //                           crossAxisAlignment:
                          //                               CrossAxisAlignment.start,
                          //                           children: [
                          //                             Text(
                          //                               "Permanent Address",
                          //                               style: GoogleFonts.inter(
                          //                                 textStyle: TextStyle(
                          //                                     color: Color(0xff1B1B1B),
                          //                                     // letterSpacing: .5,
                          //                                     fontSize: 12.sp,
                          //                                     fontWeight:
                          //                                         FontWeight.w500),
                          //                               ),
                          //                             ),
                          //                             Row(
                          //                                 mainAxisAlignment:
                          //                                     MainAxisAlignment
                          //                                         .spaceBetween,
                          //                                 children: [
                          //                                   // Add some space between icon and text
                          //                                   Flexible(
                          //                                     child: GestureDetector(
                          //                                       onTap: () {
                          //                                         // read.openGoogleMaps(
                          //                                         //     element?.address ??
                          //                                         //         '',
                          //                                         //     context);
                          //                                       },
                          //                                       child: Text(
                          //                                         "{element?.address}",
                          //                                         style:
                          //                                             GoogleFonts.inter(
                          //                                           textStyle:
                          //                                               TextStyle(
                          //                                                   color: Color(
                          //                                                       0xff1B1B1B),
                          //                                                   // letterSpacing: .5,
                          //                                                   fontSize:
                          //                                                       12.sp,
                          //                                                   fontWeight:
                          //                                                       FontWeight
                          //                                                           .w500),
                          //                                         ),
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                   SizedBox(width: 10.w),
                          //                                   SvgPicture.asset(
                          //                                     'assets/icons/ic_baseline-call (1).svg',
                          //                                     // color: Color(0xff413185),
                          //                                   ),
                          //                                 ]),
                          //                           ],
                          //                         ),
                          //                       );
                          //                     },
                          //                   ),
                          //                 )
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 13.w, right: 14.w, top: 13.w),
                            child: PrimarySTextFormField(
                              hintText: 'DD/MM/YY',
                              readOnly: true,
                              onTap: () async {
                                var pickedDate = await showDatePicker(
                                  builder: (BuildContext, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Color(0xff1767B1),
                                          // <-- SEE HERE
                                          onPrimary: Colors.white,
                                          // <-- SEE HERE
                                          onSurface:
                                              Colors.black, // <-- SEE HERE
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: const Color(
                                                0xff1767B1), // button text color
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                                if (pickedDate != null) {
                                  String date = DateFormat('dd-MM-yyy')
                                      .format(pickedDate ?? DateTime.now());
                                  read.onFromDateSelected(date);
                                }
                              },
                              controller: watch.fromDateController,
                              suffix: SizedBox(
                                width: 15.h,
                                height: 17.w,
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/icons/Vector (15).svg",
                                  ),
                                ),
                              ),
                              hintFontSize: 15.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 22.w, top: 12.w),
                            child: Text(
                              "Feedback",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: Color(0xff1B1B1B),
                                    letterSpacing: .5,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16.w, top: 12, right: 16.w),
                            child: PrimarySTextFormField(
                              controller: watch.feedBackController,
                              height: 200,
                              maxLines: 1000,
                              // controller: watch.ownerNameController,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    read.onChooseFile1();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w,
                                        top: 12.w,
                                        bottom: 12.w,
                                        right: 9.w),
                                    width: 250.w,
                                    // height: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xffE7F6FF))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Choose a photo",
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                color: Color(0xff949494),
                                                // letterSpacing: .5,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Icon(Icons.file_upload_outlined)
                                      ],
                                    ),
                                    // padding:
                                    //     EdgeInsets.only(left: 16.w, top: 12, right: .w),
                                    // child: PrimarySTextFormField(
                                    //     width: 10.w,
                                    //     suffix: Icon(Icons.file_upload_outlined)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    read.openCameras(context);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/Group 68.svg',
                                    // color: Color(0xff413185),
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
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(watchView
                              .homeListDetailsdata?.customerDetails?.loanId);
                          print(watch.feedBackController.text);
                          print(watch.amountController.text);
                          print(watch.fromDateController.text);
                          // return;
                          // readMain.onNavigation(
                          //     1,
                          //     HomeViewDetailsScreen(
                          //         customerId: watchView.homeListDetailsdata
                          //             ?.customerDetails?.customerId
                          //             .toString(),
                          //         loanId: watchView
                          //             .homeListDetailsdata?.customerDetails?.loanId),
                          //     context,
                          //     false);
                          // readMain.hideBottomNavigationBar();
                          read.subMitFrom(
                            context,
                            watchView
                                .homeListDetailsdata?.customerDetails?.loanId,
                            watch.feedBackController.text,
                            watch.disname,
                            watch.disSubCode,
                            watch.fromDateController.text,

                            watch.amountController.text,
                            // 'subDCode',
                            // watch.fromDateController,
                            // 'pstatus',
                            // watch.amountController
                          );
                        },
                        child: Container(
                          height: 50.h,
                          width: ScreenUtil().screenWidth,
                          color: Color(0xffE7F6FF),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: Color(0xff413185),
                                    // letterSpacing: .5,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        : TestWidget();
  }
}
