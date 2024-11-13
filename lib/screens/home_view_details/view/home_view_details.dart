// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:ydcpl_application/screens/home/view/home_view.dart';
// import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
// import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
// import 'package:ydcpl_application/screens/update_satus/view/update_view.dart';
// import 'package:ydcpl_application/widgets/customebar.dart';

// class HomeViewDetailsScreen extends StatefulWidget {
//   final String? customerId;
//   final String? loanId;
//   const HomeViewDetailsScreen({super.key, this.customerId, this.loanId});

//   @override
//   State<HomeViewDetailsScreen> createState() => _HomeViewDetailsScreenState();
// }

// class _HomeViewDetailsScreenState extends State<HomeViewDetailsScreen> {
//   // bool _isExpanded = false;
//   void initState() {
//     log(widget.customerId ?? '');
//     log(widget.loanId ?? '');
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context
//           .read<HomeDetailsController>()
//           .initState(context, widget.customerId, widget.loanId);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final readMain = context.read<MainScreenController>();
//     final watch = context.watch<HomeDetailsController>();
//     final read = context.read<HomeDetailsController>();
//     return Scaffold(
//       backgroundColor: Color(0xffF7F9FB),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60.w),
//         child: PrimaryAppBar(
//           action: SvgPicture.asset(
//             'assets/icons/bell.svg',
//             // width: 20.w,
//             // height: 18.h,
//           ),
//           // : Container(),
//           onBackBtnPressed: () {
//             readMain.onNavigation(2, const HomePageScreenView(), context);
//           },
//           // isProfileIconEnabled: true,
//           isBackButtonEnabled: true,
//           title: Image.asset(
//             'assets/images/image 1 (1).png',
//             height: 15.w,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 10.w,
//                   ),
//                   Container(
//                     margin:
//                         EdgeInsets.only(left: 14.w, right: 13.w, bottom: 10.w),
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           offset: Offset(3, 3),
//                           blurRadius: 12,
//                           color: Color.fromRGBO(0, 0, 0, 0.16),
//                         ),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     // width: 100.w,
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 12.w, right: 14.w, top: 10.w),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "${watch.homeListDetailsdata?.customerDetails?.customerName}",
//                                 style: GoogleFonts.inter(
//                                   textStyle: TextStyle(
//                                       color: Color(0xff1B1B1B),
//                                       // letterSpacing: .5,
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Text(
//                                 "${watch.homeListDetailsdata?.customerDetails?.product}",
//                                 style: GoogleFonts.inter(
//                                   textStyle: TextStyle(
//                                       color: Color(0xff1B1B1B),
//                                       // letterSpacing: .5,
//                                       fontSize: 14.sp,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.w,
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 12.w, right: 14.w, top: 10.w),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "LAN No :",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xff707070),
//                                           letterSpacing: .5,
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                   Text(
//                                     "${watch.homeListDetailsdata?.customerDetails?.loanId}",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xff1B1B1B),
//                                           letterSpacing: .5,
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Text(
//                                 "BKT - 012",
//                                 style: GoogleFonts.inter(
//                                   textStyle: TextStyle(
//                                       color: Color(0xff1B1B1B),
//                                       // letterSpacing: .5,
//                                       fontSize: 14.sp,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.w,
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 12.w, right: 13.w, top: 6.w, bottom: 7.w),
//                           // height: 20.w,
//                           decoration: BoxDecoration(
//                               color: Color(0xffD8F1FF),
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(15),
//                                 bottomRight: Radius.circular(15),
//                               )),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Disposition Code :",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xff1B1B1B),
//                                           letterSpacing: .5,
//                                           fontSize: 11.sp,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                   Text(
//                                     "PTP",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xff1B1B1B),
//                                           letterSpacing: .5,
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Text(
//                                 "${watch.homeListDetailsdata?.customerDetails?.createdAt}",
//                                 style: GoogleFonts.inter(
//                                   textStyle: TextStyle(
//                                       color: Color(0xff1B1B1B),
//                                       letterSpacing: .5,
//                                       fontSize: 11.sp,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 19.h,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: 19.w, right: 12.w),
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           offset: Offset(3, 3),
//                           blurRadius: 12,
//                           color: Color.fromRGBO(0, 0, 0, 0.16),
//                         ),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 8.h,
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(left: 19.w, right: 37.w),
//                           child: Column(
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       "Principal Outstanding ",
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xff413185),
//                                             // letterSpacing: .5,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Total Outstanding",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xff413185),
//                                           // letterSpacing: .5,
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 // crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       "₹ ${watch.homeListDetailsdata?.customerDetails?.principalOs}",
//                                       textAlign: TextAlign.start,
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xff413185),
//                                             // letterSpacing: .5,
//                                             fontSize: 14.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "₹ ${watch.homeListDetailsdata?.customerDetails?.totalOs}              ",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xff413185),
//                                           // letterSpacing: .5,
//                                           fontSize: 14.sp,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 25.h,
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(left: 19.w, right: 37.w),
//                           child: Column(
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       "Last Payment ",
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xff413185),
//                                             // letterSpacing: .5,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Last Payment Date",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xff413185),
//                                           // letterSpacing: .5,
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 // crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       "₹ ${watch.homeListDetailsdata?.customerDetails?.lastPayment}",
//                                       textAlign: TextAlign.start,
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xff413185),
//                                             // letterSpacing: .5,
//                                             fontSize: 14.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "${watch.homeListDetailsdata?.customerDetails?.lastPaymentDate}                           ",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xff413185),
//                                           // letterSpacing: .5,
//                                           fontSize: 14.sp,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 25.h,
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(left: 19.w, right: 37.w),
//                           child: Column(
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       "Total Due ",
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xffCF1515),
//                                             // letterSpacing: .5,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Due Date",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xffCF1515),
//                                           // letterSpacing: .5,
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 // crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       "₹ ${watch.homeListDetailsdata?.customerDetails?.totalOs}",
//                                       textAlign: TextAlign.start,
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xffCF1515),
//                                             // letterSpacing: .5,
//                                             fontSize: 14.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "${watch.homeListDetailsdata?.customerDetails?.dueDate}       ",
//                                     style: GoogleFonts.inter(
//                                       textStyle: TextStyle(
//                                           color: Color(0xffCF1515),
//                                           // letterSpacing: .5,
//                                           fontSize: 14.sp,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 19.h,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 18.h,
//                   ),
//                   Text(
//                     "Contact Information",
//                     style: GoogleFonts.inter(
//                       textStyle: TextStyle(
//                           color: Color(0xff1B1B1B),
//                           letterSpacing: .5,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: 13.w, right: 14.w, top: 13.w),
//                     child: Column(
//                       children: [
//                         Container(
//                           // margin: EdgeInsets.only(),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(
//                                 color: Color(0xffE7F6FF)), // Border color
//                             borderRadius: BorderRadius.circular(
//                                 8), // Optional: Border radius
//                           ),
//                           child: Column(
//                             children: [
//                               ExpansionTile(
//                                 // tilePadding: EdgeInsets.zero,
//                                 title: Row(
//                                   children: <Widget>[
//                                     SvgPicture.asset(
//                                       'assets/icons/yncall.svg',
//                                       color: Color(0xff0092E6),
//                                     ),
//                                     SizedBox(
//                                         width: 10
//                                             .w), // Add some space between icon and text
//                                     Text(
//                                       "Contact Mobile No.",
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xff413185),
//                                             // letterSpacing: .5,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 trailing: watch.isExpanded
//                                     ? Icon(Icons.arrow_drop_up)
//                                     : Icon(Icons
//                                         .arrow_drop_down), // Change trailing icon based on _isExpanded
//                                 onExpansionChanged: (isExpanded) {
//                                   read.toggleExpansion(isExpanded);
//                                   read.getMobilelist(context, watch.loanId);
//                                 },
//                                 // Add any single widget you want to display when the tile is expanded
//                                 children: <Widget>[
//                                   Container(
//                                     child: ListView.builder(
//                                       padding: EdgeInsets.zero,
//                                       itemCount: watch.mobiledata?.length ?? 0,
//                                       shrinkWrap: true,
//                                       itemBuilder: (context, index) {
//                                         final element =
//                                             watch.mobiledata?[index];
//                                         return Container(
//                                           padding: EdgeInsets.only(
//                                               left: 28.w,
//                                               top: 17.w,
//                                               right: 12.w),
//                                           margin: EdgeInsets.only(bottom: 10.w),
//                                           decoration: BoxDecoration(
//                                               border: Border(
//                                             top: BorderSide(
//                                               //                   <--- right side
//                                               color: Color(0xffDBEEF9),
//                                               width: 1.0,
//                                             ),
//                                           )),
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     // Add some space between icon and text
//                                                     Text(
//                                                       "${element?.mobileNo ?? 0}",
//                                                       style: GoogleFonts.inter(
//                                                         textStyle: TextStyle(
//                                                             color: Color(
//                                                                 0xff1B1B1B),
//                                                             // letterSpacing: .5,
//                                                             fontSize: 12.sp,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w500),
//                                                       ),
//                                                     ),
//                                                     SizedBox(width: 10.w),
//                                                     GestureDetector(
//                                                       onTap: () {
//                                                         read.launchPhone(
//                                                             element?.mobileNo ??
//                                                                 '',
//                                                             context);
//                                                         // read.launchPhone(
//                                                         //     watch.shopDetails
//                                                         //             ?.shopOwnerSupportNumber ??
//                                                         //         "",
//                                                         //     context);
//                                                       },
//                                                       child: SvgPicture.asset(
//                                                         'assets/icons/ic_baseline-call.svg',
//                                                         // color: Color(0xff413185),
//                                                       ),
//                                                     ),
//                                                   ]),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   )
//                                   // Padding(
//                                   //   padding: const EdgeInsets.all(16.0),
//                                   //   child: Text('Expanded Content'),
//                                   // ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.w,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(
//                                 color: Color(0xffE7F6FF)), // Border color
//                             borderRadius: BorderRadius.circular(
//                                 8), // Optional: Border radius
//                           ),
//                           child: Column(
//                             children: [
//                               ExpansionTile(
//                                 title: Row(
//                                   children: <Widget>[
//                                     SvgPicture.asset(
//                                       'assets/icons/ylocation.svg',
//                                       color: Color(0xff0092E6),
//                                     ),
//                                     SizedBox(
//                                         width:
//                                             8), // Add some space between icon and text
//                                     Text(
//                                       "Addresses",
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xff413185),
//                                             // letterSpacing: .5,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 trailing: watch.isExpanded
//                                     ? Icon(Icons.arrow_drop_up)
//                                     : Icon(Icons
//                                         .arrow_drop_down), // Change trailing icon based on _isExpanded
//                                 onExpansionChanged: (isExpanded) {
//                                   read.toggleExpansion(isExpanded);
//                                   read.getAddressList(context, watch.loanId);
//                                 },
//                                 // Add any single widget you want to display when the tile is expanded
//                                 children: <Widget>[
//                                   Container(
//                                     child: ListView.builder(
//                                       padding: EdgeInsets.zero,
//                                       itemCount: watch.addressdata?.length ?? 0,
//                                       shrinkWrap: true,
//                                       itemBuilder: (context, index) {
//                                         final element =
//                                             watch.addressdata?[index];
//                                         return Container(
//                                           padding: EdgeInsets.only(
//                                               left: 28.w,
//                                               top: 17.w,
//                                               right: 12.w),
//                                           margin: EdgeInsets.only(bottom: 10.w),
//                                           decoration: BoxDecoration(
//                                               border: Border(
//                                             top: BorderSide(
//                                               //                   <--- right side
//                                               color: Color(0xffDBEEF9),
//                                               width: 1.0,
//                                             ),
//                                           )),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 "Permanent Address",
//                                                 style: GoogleFonts.inter(
//                                                   textStyle: TextStyle(
//                                                       color: Color(0xff1B1B1B),
//                                                       // letterSpacing: .5,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 ),
//                                               ),
//                                               Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     // Add some space between icon and text
//                                                     Flexible(
//                                                       child: GestureDetector(
//                                                         onTap: () {
//                                                           read.openGoogleMaps(
//                                                               element?.address ??
//                                                                   '',
//                                                               context);
//                                                         },
//                                                         child: Text(
//                                                           "${element?.address}",
//                                                           style:
//                                                               GoogleFonts.inter(
//                                                             textStyle:
//                                                                 TextStyle(
//                                                                     color: Color(
//                                                                         0xff1B1B1B),
//                                                                     // letterSpacing: .5,
//                                                                     fontSize:
//                                                                         12.sp,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w500),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(width: 10.w),
//                                                     SvgPicture.asset(
//                                                       'assets/icons/ic_baseline-call (1).svg',
//                                                       // color: Color(0xff413185),
//                                                     ),
//                                                   ]),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.w,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(
//                                 color: Color(0xffE7F6FF)), // Border color
//                             borderRadius: BorderRadius.circular(
//                                 8), // Optional: Border radius
//                           ),
//                           child: Column(
//                             children: [
//                               ExpansionTile(
//                                 title: Row(
//                                   children: <Widget>[
//                                     SvgPicture.asset(
//                                       'assets/icons/tellicom.svg',
//                                       color: Color(0xff0092E6),
//                                     ),
//                                     SizedBox(
//                                         width:
//                                             8), // Add some space between icon and text
//                                     Text(
//                                       "Telecaller All Logs",
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xff413185),
//                                             // letterSpacing: .5,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 trailing: watch.isExpanded
//                                     ? Icon(Icons.arrow_drop_up)
//                                     : Icon(Icons
//                                         .arrow_drop_down), // Change trailing icon based on _isExpanded
//                                 onExpansionChanged: (isExpanded) {
//                                   read.toggleExpansion(isExpanded);

//                                   read.MobileCallListLogs(
//                                       context, watch.loanId);
//                                 },
//                                 // Add any single widget you want to display when the tile is expanded
//                                 children: <Widget>[
//                                   Container(
//                                     color: Color(0xffE7F6FF),
//                                     child: ListView.builder(
//                                       padding: EdgeInsets.zero,
//                                       itemCount: watch.mobileCallLogsListData
//                                           ?.customerCallLogsData?.length,
//                                       shrinkWrap: true,
//                                       itemBuilder: (context, index) {
//                                         final element = watch
//                                             .mobileCallLogsListData
//                                             ?.customerCallLogsData?[index];
//                                         return Container(
//                                           padding: EdgeInsets.only(
//                                             top: 17.w,
//                                           ),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 margin: EdgeInsets.only(
//                                                     left: 14.w,
//                                                     right: 13.w,
//                                                     bottom: 10.w),
//                                                 decoration: BoxDecoration(
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       offset: Offset(3, 3),
//                                                       blurRadius: 12,
//                                                       color: Color.fromRGBO(
//                                                           0, 0, 0, 0.16),
//                                                     ),
//                                                   ],
//                                                   color: Colors.white,
//                                                   borderRadius:
//                                                       BorderRadius.circular(15),
//                                                 ),
//                                                 // width: 100.w,
//                                                 child: Column(
//                                                   children: [
//                                                     Container(
//                                                       padding: EdgeInsets.only(
//                                                           left: 12.w,
//                                                           right: 13.w,
//                                                           top: 6.w,
//                                                           bottom: 7.w),
//                                                       // height: 20.w,
//                                                       decoration: BoxDecoration(
//                                                           color:
//                                                               Color(0xffF1F1F1),
//                                                           borderRadius:
//                                                               BorderRadius.only(
//                                                             topLeft:
//                                                                 Radius.circular(
//                                                                     15),
//                                                             topRight:
//                                                                 Radius.circular(
//                                                                     15),
//                                                           )),
//                                                       child: Column(
//                                                         children: [
//                                                           Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceBetween,
//                                                             children: [
//                                                               Text(
//                                                                 "PTP :${element?.dispositionCode} ${element?.dispositionSubCode}",
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   textStyle: TextStyle(
//                                                                       color: Color(
//                                                                           0xff1B1B1B),
//                                                                       letterSpacing:
//                                                                           .5,
//                                                                       fontSize:
//                                                                           13.sp,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w700),
//                                                                 ),
//                                                               ),
//                                                               Text(
//                                                                 "23 March 2024",
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   textStyle: TextStyle(
//                                                                       color: Color(
//                                                                           0xff1B1B1B),
//                                                                       letterSpacing:
//                                                                           .5,
//                                                                       fontSize:
//                                                                           11.sp,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceBetween,
//                                                             children: [
//                                                               Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     "By : ",
//                                                                     style: GoogleFonts
//                                                                         .inter(
//                                                                       textStyle: TextStyle(
//                                                                           color: Color(0xff1B1B1B),
//                                                                           // letterSpacing:
//                                                                           //     .5,
//                                                                           fontSize: 10.sp,
//                                                                           fontWeight: FontWeight.w700),
//                                                                     ),
//                                                                   ),
//                                                                   Text(
//                                                                     "Uday Chopda",
//                                                                     style: GoogleFonts
//                                                                         .inter(
//                                                                       textStyle: TextStyle(
//                                                                           color: Color(0xff1B1B1B),
//                                                                           // letterSpacing:
//                                                                           //     .5,
//                                                                           fontSize: 10.sp,
//                                                                           fontWeight: FontWeight.w600),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                               Text(
//                                                                 "4:33 PM",
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   textStyle: TextStyle(
//                                                                       color: Color(0xff1B1B1B),
//                                                                       // letterSpacing:
//                                                                       //     .5,
//                                                                       fontSize: 12.sp,
//                                                                       fontWeight: FontWeight.w400),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 13.w,
//                                                     ),
//                                                     Container(
//                                                       padding: EdgeInsets.only(
//                                                           left: 14.w,
//                                                           right: 12.w),
//                                                       child: Text(
//                                                         "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit.",
//                                                         style:
//                                                             GoogleFonts.inter(
//                                                           textStyle: TextStyle(
//                                                               color: Color(
//                                                                   0xff1B1B1B),
//                                                               // letterSpacing:
//                                                               //     .5,
//                                                               fontSize: 12.sp,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     // Container(
//                                                     //   padding: EdgeInsets.only(
//                                                     //       left: 12.w,
//                                                     //       right: 14.w,
//                                                     //       top: 10.w),
//                                                     //   child: Row(
//                                                     //     mainAxisAlignment:
//                                                     //         MainAxisAlignment
//                                                     //             .spaceBetween,
//                                                     //     children: [
//                                                     //       Text(
//                                                     //         "Mr. Umesh Kumar ",
//                                                     //         style: GoogleFonts.inter(
//                                                     //           textStyle: TextStyle(
//                                                     //               color: Color(
//                                                     //                   0xff1B1B1B),
//                                                     //               // letterSpacing: .5,
//                                                     //               fontSize: 16.sp,
//                                                     //               fontWeight:
//                                                     //                   FontWeight
//                                                     //                       .w600),
//                                                     //         ),
//                                                     //       ),
//                                                     //       Text(
//                                                     //         "Personal Loan",
//                                                     //         style: GoogleFonts.inter(
//                                                     //           textStyle: TextStyle(
//                                                     //               color: Color(
//                                                     //                   0xff1B1B1B),
//                                                     //               // letterSpacing: .5,
//                                                     //               fontSize: 14.sp,
//                                                     //               fontWeight:
//                                                     //                   FontWeight
//                                                     //                       .w500),
//                                                     //         ),
//                                                     //       ),
//                                                     //     ],
//                                                     //   ),
//                                                     // ),
//                                                     SizedBox(
//                                                       height: 10.w,
//                                                     ),
//                                                     Container(
//                                                       padding: EdgeInsets.only(
//                                                           left: 12.w,
//                                                           right: 14.w,
//                                                           top: 10.w),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           Container(
//                                                             height: 40.h,
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     left: 11.w,
//                                                                     bottom: 7.w,
//                                                                     right: 60.w,
//                                                                     top: 8.w),
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             5),
//                                                                 color: Color(
//                                                                     0xffEFF9FF),
//                                                                 border: Border.all(
//                                                                     color: Color(
//                                                                         0xff8CD4FD))),
//                                                             child: Column(
//                                                               children: [
//                                                                 Text(
//                                                                   "EMI Amount",
//                                                                   style:
//                                                                       GoogleFonts
//                                                                           .inter(
//                                                                     textStyle: TextStyle(
//                                                                         color: Colors
//                                                                             .black,
//                                                                         letterSpacing:
//                                                                             .5,
//                                                                         fontSize: 10
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400),
//                                                                   ),
//                                                                 ),
//                                                                 Text(
//                                                                   "₹ 30,000",
//                                                                   style:
//                                                                       GoogleFonts
//                                                                           .inter(
//                                                                     textStyle: TextStyle(
//                                                                         color: Colors
//                                                                             .black,
//                                                                         letterSpacing:
//                                                                             .5,
//                                                                         fontSize: 14
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w700),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           Container(
//                                                             height: 40.h,
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     left: 11.w,
//                                                                     bottom: 7.w,
//                                                                     right: 60.w,
//                                                                     top: 8.w),
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             5),
//                                                                 color: Color(
//                                                                     0xffEFF9FF),
//                                                                 border: Border.all(
//                                                                     color: Color(
//                                                                         0xff8CD4FD))),
//                                                             child: Column(
//                                                               children: [
//                                                                 Text(
//                                                                   "Total Due",
//                                                                   style:
//                                                                       GoogleFonts
//                                                                           .inter(
//                                                                     textStyle: TextStyle(
//                                                                         color: Colors
//                                                                             .black,
//                                                                         letterSpacing:
//                                                                             .5,
//                                                                         fontSize: 10
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400),
//                                                                   ),
//                                                                 ),
//                                                                 Text(
//                                                                   "₹ 60,000",
//                                                                   style:
//                                                                       GoogleFonts
//                                                                           .inter(
//                                                                     textStyle: TextStyle(
//                                                                         color: Colors
//                                                                             .black,
//                                                                         letterSpacing:
//                                                                             .5,
//                                                                         fontSize: 14
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w700),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),

//                                                     SizedBox(
//                                                       height: 10.w,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.w,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(
//                                 color: Color(0xffE7F6FF)), // Border color
//                             borderRadius: BorderRadius.circular(
//                                 8), // Optional: Border radius
//                           ),
//                           child: Column(
//                             children: [
//                               ExpansionTile(
//                                 title: Row(
//                                   children: <Widget>[
//                                     SvgPicture.asset(
//                                       'assets/icons/report1.svg',
//                                       color: Color(0xff0092E6),
//                                     ),
//                                     SizedBox(
//                                         width:
//                                             8), // Add some space between icon and text
//                                     Text(
//                                       "Field Status Logs",
//                                       style: GoogleFonts.inter(
//                                         textStyle: TextStyle(
//                                             color: Color(0xff413185),
//                                             // letterSpacing: .5,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 trailing: watch.isExpanded
//                                     ? Icon(Icons.arrow_drop_up)
//                                     : Icon(Icons
//                                         .arrow_drop_down), // Change trailing icon based on _isExpanded
//                                 onExpansionChanged: (isExpanded) {
//                                   read.toggleExpansion(isExpanded);

//                                   read.FieldStatusLog(context, watch.loanId);
//                                 },
//                                 // Add any single widget you want to display when the tile is expanded
//                                 children: <Widget>[
//                                   Container(
//                                     color: Color(0xffE7F6FF),
//                                     child: ListView.builder(
//                                       physics: NeverScrollableScrollPhysics(),
//                                       padding: EdgeInsets.zero,
//                                       itemCount: watch
//                                               .fieldVisitDa
//                                               ?.customerFieldVisitData
//                                               ?.length ??
//                                           0,
//                                       shrinkWrap: true,
//                                       itemBuilder: (context, index) {
//                                         final element = watch.fieldVisitDa
//                                             ?.customerFieldVisitData?[index];
//                                         return Container(
//                                           padding: EdgeInsets.only(
//                                             top: 17.w,
//                                           ),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 margin: EdgeInsets.only(
//                                                     left: 14.w,
//                                                     right: 13.w,
//                                                     bottom: 10.w),
//                                                 decoration: BoxDecoration(
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       offset: Offset(3, 3),
//                                                       blurRadius: 12,
//                                                       color: Color.fromRGBO(
//                                                           0, 0, 0, 0.16),
//                                                     ),
//                                                   ],
//                                                   color: Colors.white,
//                                                   borderRadius:
//                                                       BorderRadius.circular(15),
//                                                 ),
//                                                 // width: 100.w,
//                                                 child: Column(
//                                                   children: [
//                                                     Container(
//                                                       padding: EdgeInsets.only(
//                                                           left: 12.w,
//                                                           right: 13.w,
//                                                           top: 6.w,
//                                                           bottom: 7.w),
//                                                       // height: 20.w,
//                                                       decoration: BoxDecoration(
//                                                           color:
//                                                               Color(0xffF1F1F1),
//                                                           borderRadius:
//                                                               BorderRadius.only(
//                                                             topLeft:
//                                                                 Radius.circular(
//                                                                     15),
//                                                             topRight:
//                                                                 Radius.circular(
//                                                                     15),
//                                                           )),
//                                                       child: Column(
//                                                         children: [
//                                                           Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceBetween,
//                                                             children: [
//                                                               Text(
//                                                                 "PTP :",
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   textStyle: TextStyle(
//                                                                       color: Color(
//                                                                           0xff1B1B1B),
//                                                                       letterSpacing:
//                                                                           .5,
//                                                                       fontSize:
//                                                                           13.sp,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w700),
//                                                                 ),
//                                                               ),
//                                                               Text(
//                                                                 "${element?.createdAt}",
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   textStyle: TextStyle(
//                                                                       color: Color(
//                                                                           0xff1B1B1B),
//                                                                       letterSpacing:
//                                                                           .5,
//                                                                       fontSize:
//                                                                           11.sp,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceBetween,
//                                                             children: [
//                                                               Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     "By : ",
//                                                                     style: GoogleFonts
//                                                                         .inter(
//                                                                       textStyle: TextStyle(
//                                                                           color: Color(0xff1B1B1B),
//                                                                           // letterSpacing:
//                                                                           //     .5,
//                                                                           fontSize: 10.sp,
//                                                                           fontWeight: FontWeight.w700),
//                                                                     ),
//                                                                   ),
//                                                                   Text(
//                                                                     "${element?.fieldExecutiveName}",
//                                                                     style: GoogleFonts
//                                                                         .inter(
//                                                                       textStyle: TextStyle(
//                                                                           color: Color(0xff1B1B1B),
//                                                                           // letterSpacing:
//                                                                           //     .5,
//                                                                           fontSize: 10.sp,
//                                                                           fontWeight: FontWeight.w600),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                               Text(
//                                                                 "${element?.createdTime}",
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   textStyle: TextStyle(
//                                                                       color: Color(0xff1B1B1B),
//                                                                       // letterSpacing:
//                                                                       //     .5,
//                                                                       fontSize: 12.sp,
//                                                                       fontWeight: FontWeight.w400),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 13.w,
//                                                     ),
//                                                     Container(
//                                                       padding: EdgeInsets.only(
//                                                           left: 14.w,
//                                                           right: 12.w),
//                                                       child: Text(
//                                                         "${element?.executiveFeedback}",
//                                                         style:
//                                                             GoogleFonts.inter(
//                                                           textStyle: TextStyle(
//                                                               color: Color(
//                                                                   0xff1B1B1B),
//                                                               // letterSpacing:
//                                                               //     .5,
//                                                               fontSize: 12.sp,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10.w,
//                                                     ),
//                                                     Container(
//                                                       padding: EdgeInsets.only(
//                                                           left: 12.w,
//                                                           right: 14.w,
//                                                           top: 10.w),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           Container(
//                                                             height: 40.h,
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     left: 11.w,
//                                                                     bottom: 7.w,
//                                                                     right: 60.w,
//                                                                     top: 8.w),
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             5),
//                                                                 color: Color(
//                                                                     0xffEFF9FF),
//                                                                 border: Border.all(
//                                                                     color: Color(
//                                                                         0xff8CD4FD))),
//                                                             child: Column(
//                                                               children: [
//                                                                 Text(
//                                                                   "EMI Amount",
//                                                                   style:
//                                                                       GoogleFonts
//                                                                           .inter(
//                                                                     textStyle: TextStyle(
//                                                                         color: Colors
//                                                                             .black,
//                                                                         letterSpacing:
//                                                                             .5,
//                                                                         fontSize: 10
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400),
//                                                                   ),
//                                                                 ),
//                                                                 Text(
//                                                                   "₹ 30,000",
//                                                                   style:
//                                                                       GoogleFonts
//                                                                           .inter(
//                                                                     textStyle: TextStyle(
//                                                                         color: Colors
//                                                                             .black,
//                                                                         letterSpacing:
//                                                                             .5,
//                                                                         fontSize: 14
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w700),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           Container(
//                                                             height: 40.h,
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     left: 11.w,
//                                                                     bottom: 7.w,
//                                                                     right: 60.w,
//                                                                     top: 8.w),
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             5),
//                                                                 color: Color(
//                                                                     0xffEFF9FF),
//                                                                 border: Border.all(
//                                                                     color: Color(
//                                                                         0xff8CD4FD))),
//                                                             child: Column(
//                                                               children: [
//                                                                 Text(
//                                                                   "Total Due",
//                                                                   style:
//                                                                       GoogleFonts
//                                                                           .inter(
//                                                                     textStyle: TextStyle(
//                                                                         color: Colors
//                                                                             .black,
//                                                                         letterSpacing:
//                                                                             .5,
//                                                                         fontSize: 10
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400),
//                                                                   ),
//                                                                 ),
//                                                                 Text(
//                                                                   "₹ 60,000",
//                                                                   style:
//                                                                       GoogleFonts
//                                                                           .inter(
//                                                                     textStyle: TextStyle(
//                                                                         color: Colors
//                                                                             .black,
//                                                                         letterSpacing:
//                                                                             .5,
//                                                                         fontSize: 14
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w700),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10.w,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               GestureDetector(
//                 onTap: () {
// Navigator.push(
//   context,
//   MaterialPageRoute(
//       builder: (context) =>
//           const UpdateHomeViewDetailsScreen()),
// );
//                 },
//                 child: Container(
//                   height: 50.h,
//                   width: ScreenUtil().screenWidth,
//                   color: Color(0xffE7F6FF),
//                   child: Center(
//                     child: Text(
//                       "Update Status",
//                       style: GoogleFonts.inter(
//                         textStyle: TextStyle(
//                             color: Color(0xff413185),
//                             // letterSpacing: .5,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/home/view/home_view.dart';
import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
import 'package:ydcpl_application/screens/home_view_details/view/add_bottom_address_bottom_sheet.dart';
import 'package:ydcpl_application/screens/home_view_details/view/add_contact_bottom_sheet.dart';
import 'package:ydcpl_application/screens/notification/view/notification_view.dart';
import 'package:ydcpl_application/screens/script/view/script_view_status_view.dart';
import 'package:ydcpl_application/screens/update_satus/view/update_view.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/buttons.dart';
import 'package:ydcpl_application/widgets/customebar.dart';
import 'package:ydcpl_application/widgets/loader.dart';

class HomeViewDetailsScreen extends StatefulWidget {
  final String? customerId;
  final String? loanId;
  final String? productName;
  final String? productCategoryName;
  const HomeViewDetailsScreen(
      {super.key,
      required this.customerId,
      required this.loanId,
      this.productName,
      this.productCategoryName});

  @override
  State<HomeViewDetailsScreen> createState() => _HomeViewDetailsScreenState();
}

class _HomeViewDetailsScreenState extends State<HomeViewDetailsScreen> {
  // bool _isExpanded = false;
  void initState() {
    log(widget.customerId ?? '');
    log(widget.loanId ?? '');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<HomeDetailsController>().initState(
          context,
          widget.customerId,
          widget.loanId,
          widget.productName,
          widget.productCategoryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final readMain = context.read<MainScreenController>();
    final watch = context.watch<HomeDetailsController>();
    final read = context.read<HomeDetailsController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return isOnline
        ? Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Color(0xffF7F9FB),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.w),
              child: PrimaryAppBar(
                  // onActionTap: () {
                  //   print("object");
                  //   readMain.onNavigation(1, Notificatio0nView(), context);
                  // },
                  action: GestureDetector(
                    onTap: () {
                      print("object");
                      readMain.onNavigation(
                          1, Notificatio0nView(), context, false);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Notificatio0nView()),
                      // );

                      // Navigator.pop(context);
                      // readMain.onNavigation(1, HomePageScreenView(), context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/bell.svg',
                      // width: 20.w,
                      // height: 18.h,
                    ),
                  ),
                  // : Container(),
                  onBackBtnPressed: () {
                    print("object");
                    // Navigator.pop(context);
                    readMain.onNavigation(
                        1, HomePageScreenView(), context, false);
                  },
                  // isProfileIconEnabled: false,
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
                  ),
            ),
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(60.w),
            //   child: PrimaryAppBar(
            //     action: SvgPicture.asset(
            //       'assets/icons/bell.svg',
            //       // width: 20.w,
            //       // height: 18.h,
            //     ),
            //     // : Container(),
            //     onBackBtnPressed: () {
            //       readMain.onNavigation(2, const HomePageScreenView(), context);
            //     },
            //     // isProfileIconEnabled: true,
            //     isBackButtonEnabled: true,
            //     title: Image.asset(
            //       'assets/images/image 1 (1).png',
            //       height: 15.w,
            //     ),
            //   ),
            // ),
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
                    child: Column(children: [
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
                                          Container(
                                            width: 200.w,
                                            child: Text(
                                              "${watch.homeListDetailsdata?.customerDetails?.customerName}",
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Color(0xff1B1B1B),
                                                    // letterSpacing: .5,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${watch.homeListDetailsdata?.customerDetails?.productName ?? ''}",
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
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Text(
                                                "${watch.homeListDetailsdata?.customerDetails?.loanId}",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff1B1B1B),
                                                      letterSpacing: .5,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${watch.homeListDetailsdata?.customerDetails?.productCategoryName ?? ''}",
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
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Text(
                                                "${watch.homeListDetailsdata?.customerDetails?.dispoCode ?? ''}",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff1B1B1B),
                                                      letterSpacing: .5,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${watch.homeListDetailsdata?.customerDetails?.createdAt}",
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
                                margin:
                                    EdgeInsets.only(left: 19.w, right: 12.w),
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
                                      padding: EdgeInsets.only(
                                          left: 19.w, right: 37.w),
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
                                                        color:
                                                            Color(0xff413185),
                                                        // letterSpacing: .5,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Total Outstanding ",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff413185),
                                                      // letterSpacing: .5,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "₹${watch.homeListDetailsdata?.customerDetails?.principalOs}",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff413185),
                                                      // letterSpacing: .5,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    // Text(
                                                    //   "",
                                                    //   style: GoogleFonts.inter(
                                                    //     textStyle: TextStyle(
                                                    //         color: Color(0xff413185),
                                                    //         // letterSpacing: .5,
                                                    //         fontSize: 14.sp,
                                                    //         fontWeight:
                                                    //             FontWeight.w600),
                                                    //   ),
                                                    // ),
                                                    SizedBox(
                                                      width: 25.w,
                                                    ),
                                                    Text(
                                                      "₹ ${watch.homeListDetailsdata?.customerDetails?.totalOs}   ",
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            color: Color(
                                                                0xff413185),
                                                            // letterSpacing: .5,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                                      padding: EdgeInsets.only(
                                          left: 19.w, right: 37.w),
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
                                                        color:
                                                            Color(0xff413185),
                                                        // letterSpacing: .5,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Last Payment Date",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff413185),
                                                      // letterSpacing: .5,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(right: 25.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "₹ ${watch.homeListDetailsdata?.customerDetails?.lastPayment}",
                                                  textAlign: TextAlign.start,
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
                                                  "${watch.homeListDetailsdata?.customerDetails?.lastPaymentDate}",
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
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 19.w, right: 37.w),
                                      child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Total Due ",
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
                                              ),
                                              Text(
                                                "Due Date                  ",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Color(0xffCF1515),
                                                      // letterSpacing: .5,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(right: 25.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "₹ ${watch.homeListDetailsdata?.customerDetails?.totalOs}",
                                                  textAlign: TextAlign.start,
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
                                                Text(
                                                  "${watch.homeListDetailsdata?.customerDetails?.dueDate}",
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
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 19.h,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Text(
                                  "Contact Information",
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
                                child: Column(
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(
                                                0xffE7F6FF)), // Border color
                                        borderRadius: BorderRadius.circular(
                                            8), // Optional: Border radius
                                      ),
                                      child: Column(
                                        children: [
                                          ExpansionTile(
                                            // tilePadding: EdgeInsets.zero,
                                            title: Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  'assets/icons/yncall.svg',
                                                  color: Color(0xff0092E6),
                                                ),
                                                SizedBox(
                                                    width: 10
                                                        .w), // Add some space between icon and text
                                                Text(
                                                  "Contact Mobile No.",
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xff413185),
                                                        // letterSpacing: .5,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: watch.isExpanded
                                                ? Icon(Icons.arrow_drop_up)
                                                : Icon(Icons.arrow_drop_down),
                                            // Change trailing icon based on _isExpanded
                                            onExpansionChanged: (isExpanded) {
                                              read.toggleExpansion(isExpanded);
                                              read.getMobilelist(
                                                  context, watch.loanId);
                                            },
                                            // Add any single widget you want to display when the tile is expanded
                                            children: <Widget>[
                                              Container(
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.zero,
                                                  itemCount: watch
                                                          .mobiledata?.length ??
                                                      0,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final element = watch
                                                        .mobiledata?[index];
                                                    return Container(
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
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                // Add some space between icon and text
                                                                Text(
                                                                  // "${element?.mobileNo ?? 0}",
                                                                  "${element!.mobileNo!.isNotEmpty && element.mobileNo!.length >= 4 ? "XXX XX X " + element.mobileNo!.substring(element.mobileNo!.length - 4) : "XXX XX X"} (${element.createdType})",

                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    textStyle: TextStyle(
                                                                        color: Color(0xff1B1B1B),
                                                                        // letterSpacing: .5,
                                                                        fontSize: 12.sp,
                                                                        fontWeight: FontWeight.w500),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width:
                                                                        10.w),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    read.launchPhone(
                                                                        element.mobileNo ??
                                                                            '',
                                                                        context);
                                                                    // read.launchPhone(
                                                                    //     watch.shopDetails
                                                                    //             ?.shopOwnerSupportNumber ??
                                                                    //         "",
                                                                    //     context);
                                                                  },
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/icons/ic_baseline-call.svg',
                                                                    // color: Color(0xff413185),
                                                                  ),
                                                                ),
                                                              ]),
                                                        ],
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
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(
                                                0xffE7F6FF)), // Border color
                                        borderRadius: BorderRadius.circular(
                                            8), // Optional: Border radius
                                      ),
                                      child: Column(
                                        children: [
                                          ExpansionTile(
                                            title: Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  'assets/icons/ylocation.svg',
                                                  color: Color(0xff0092E6),
                                                ),
                                                SizedBox(
                                                    width:
                                                        8), // Add some space between icon and text
                                                Text(
                                                  "Address",
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xff413185),
                                                        // letterSpacing: .5,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: watch.isExpanded
                                                ? Icon(Icons.arrow_drop_up)
                                                : Icon(Icons
                                                    .arrow_drop_down), // Change trailing icon based on _isExpanded
                                            onExpansionChanged: (isExpanded) {
                                              read.toggleExpansion(isExpanded);
                                              read.getAddressList(
                                                  context, watch.loanId);
                                            },
                                            // Add any single widget you want to display when the tile is expanded
                                            children: <Widget>[
                                              Container(
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.zero,
                                                  itemCount: watch.addressdata
                                                          ?.length ??
                                                      0,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final element = watch
                                                        .addressdata?[index];
                                                    return Container(
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
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Permanent Address ( ${element?.createdType ?? '-'} )",
                                                            style: GoogleFonts
                                                                .inter(
                                                              textStyle:
                                                                  TextStyle(
                                                                      color: Color(
                                                                          0xff1B1B1B),
                                                                      // letterSpacing: .5,
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              read.openGoogleMaps(
                                                                  element?.address ??
                                                                      '',
                                                                  context);
                                                            },
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  // Add some space between icon and text
                                                                  Flexible(
                                                                    child: Text(
                                                                      "${element?.address},${element?.area}, ${element?.pincode}",
                                                                      style: GoogleFonts
                                                                          .inter(
                                                                        textStyle: TextStyle(
                                                                            color: Color(0xff1B1B1B),
                                                                            // letterSpacing: .5,
                                                                            fontSize: 12.sp,
                                                                            fontWeight: FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          10.w),
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/icons/ic_baseline-call (1).svg',
                                                                    // color: Color(0xff413185),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ],
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
                                    // SizedBox(
                                    //   height: 10.w,
                                    // ),
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     color: Colors.white,
                                    //     border: Border.all(
                                    //         color: Color(0xffE7F6FF)), // Border color
                                    //     borderRadius: BorderRadius.circular(
                                    //         8), // Optional: Border radius
                                    //   ),
                                    //   child: Column(
                                    //     children: [
                                    //       ExpansionTile(
                                    //         title: Row(
                                    //           children: <Widget>[
                                    //             SvgPicture.asset(
                                    //               'assets/icons/tellicom.svg',
                                    //               color: Color(0xff0092E6),
                                    //             ),
                                    //             SizedBox(
                                    //                 width:
                                    //                     8), // Add some space between icon and text
                                    //             Text(
                                    //               "Telecaller All Logs",
                                    //               style: GoogleFonts.inter(
                                    //                 textStyle: TextStyle(
                                    //                     color: Color(0xff413185),
                                    //                     // letterSpacing: .5,
                                    //                     fontSize: 12.sp,
                                    //                     fontWeight: FontWeight.w600),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //         trailing: watch.isExpanded
                                    //             ? Icon(Icons.arrow_drop_up)
                                    //             : Icon(Icons
                                    //                 .arrow_drop_down), // Change trailing icon based on _isExpanded
                                    //         onExpansionChanged: (isExpanded) {
                                    //           read.toggleExpansion(isExpanded);

                                    //           read.MobileCallListLogs(context, watch.loanId);
                                    //         },
                                    //         // Add any single widget you want to display when the tile is expanded
                                    //         children: <Widget>[
                                    //           Container(
                                    //             color: Color(0xffE7F6FF),
                                    //             child: ListView.builder(
                                    //               padding: EdgeInsets.zero,
                                    //               itemCount: watch.mobileCallLogsListData
                                    //                   ?.customerCallLogsData?.length,
                                    //               shrinkWrap: true,
                                    //               itemBuilder: (context, index) {
                                    //                 final element = watch
                                    //                     .mobileCallLogsListData
                                    //                     ?.customerCallLogsData?[index];
                                    //                 return Container(
                                    //                   padding: EdgeInsets.only(
                                    //                     top: 17.w,
                                    //                   ),
                                    //                   child: Column(
                                    //                     crossAxisAlignment:
                                    //                         CrossAxisAlignment.start,
                                    //                     children: [
                                    //                       Container(
                                    //                         margin: EdgeInsets.only(
                                    //                             left: 14.w,
                                    //                             right: 13.w,
                                    //                             bottom: 10.w),
                                    //                         decoration: BoxDecoration(
                                    //                           boxShadow: [
                                    //                             BoxShadow(
                                    //                               offset: Offset(3, 3),
                                    //                               blurRadius: 12,
                                    //                               color: Color.fromRGBO(
                                    //                                   0, 0, 0, 0.16),
                                    //                             ),
                                    //                           ],
                                    //                           color: Colors.white,
                                    //                           borderRadius:
                                    //                               BorderRadius.circular(15),
                                    //                         ),
                                    //                         // width: 100.w,
                                    //                         child: Column(
                                    //                           children: [
                                    //                             Container(
                                    //                               padding: EdgeInsets.only(
                                    //                                   left: 12.w,
                                    //                                   right: 13.w,
                                    //                                   top: 6.w,
                                    //                                   bottom: 7.w),
                                    //                               // height: 20.w,
                                    //                               decoration: BoxDecoration(
                                    //                                   color:
                                    //                                       Color(0xffF1F1F1),
                                    //                                   borderRadius:
                                    //                                       BorderRadius.only(
                                    //                                     topLeft:
                                    //                                         Radius.circular(
                                    //                                             15),
                                    //                                     topRight:
                                    //                                         Radius.circular(
                                    //                                             15),
                                    //                                   )),
                                    //                               child: Column(
                                    //                                 children: [
                                    //                                   Row(
                                    //                                     mainAxisAlignment:
                                    //                                         MainAxisAlignment
                                    //                                             .spaceBetween,
                                    //                                     children: [
                                    //                                       Text(
                                    //                                         "PTP :${element?.dispositionCode} ${element?.dispositionSubCode}",
                                    //                                         style: GoogleFonts
                                    //                                             .inter(
                                    //                                           textStyle: TextStyle(
                                    //                                               color: Color(
                                    //                                                   0xff1B1B1B),
                                    //                                               letterSpacing:
                                    //                                                   .5,
                                    //                                               fontSize:
                                    //                                                   13.sp,
                                    //                                               fontWeight:
                                    //                                                   FontWeight
                                    //                                                       .w700),
                                    //                                         ),
                                    //                                       ),
                                    //                                       Text(
                                    //                                         "23 March 2024",
                                    //                                         style: GoogleFonts
                                    //                                             .inter(
                                    //                                           textStyle: TextStyle(
                                    //                                               color: Color(
                                    //                                                   0xff1B1B1B),
                                    //                                               letterSpacing:
                                    //                                                   .5,
                                    //                                               fontSize:
                                    //                                                   11.sp,
                                    //                                               fontWeight:
                                    //                                                   FontWeight
                                    //                                                       .w500),
                                    //                                         ),
                                    //                                       ),
                                    //                                     ],
                                    //                                   ),
                                    //                                   Row(
                                    //                                     mainAxisAlignment:
                                    //                                         MainAxisAlignment
                                    //                                             .spaceBetween,
                                    //                                     children: [
                                    //                                       Row(
                                    //                                         children: [
                                    //                                           Text(
                                    //                                             "By : ",
                                    //                                             style:
                                    //                                                 GoogleFonts
                                    //                                                     .inter(
                                    //                                               textStyle: TextStyle(
                                    //                                                   color: Color(0xff1B1B1B),
                                    //                                                   // letterSpacing:
                                    //                                                   //     .5,
                                    //                                                   fontSize: 10.sp,
                                    //                                                   fontWeight: FontWeight.w700),
                                    //                                             ),
                                    //                                           ),
                                    //                                           Text(
                                    //                                             "Uday Chopda",
                                    //                                             style:
                                    //                                                 GoogleFonts
                                    //                                                     .inter(
                                    //                                               textStyle: TextStyle(
                                    //                                                   color: Color(0xff1B1B1B),
                                    //                                                   // letterSpacing:
                                    //                                                   //     .5,
                                    //                                                   fontSize: 10.sp,
                                    //                                                   fontWeight: FontWeight.w600),
                                    //                                             ),
                                    //                                           ),
                                    //                                         ],
                                    //                                       ),
                                    //                                       Text(
                                    //                                         "4:33 PM",
                                    //                                         style: GoogleFonts
                                    //                                             .inter(
                                    //                                           textStyle: TextStyle(
                                    //                                               color: Color(0xff1B1B1B),
                                    //                                               // letterSpacing:
                                    //                                               //     .5,
                                    //                                               fontSize: 12.sp,
                                    //                                               fontWeight: FontWeight.w400),
                                    //                                         ),
                                    //                                       ),
                                    //                                     ],
                                    //                                   ),
                                    //                                 ],
                                    //                               ),
                                    //                             ),
                                    //                             SizedBox(
                                    //                               height: 13.w,
                                    //                             ),
                                    //                             Container(
                                    //                               padding: EdgeInsets.only(
                                    //                                   left: 14.w,
                                    //                                   right: 12.w),
                                    //                               child: Text(
                                    //                                 "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit.",
                                    //                                 style: GoogleFonts.inter(
                                    //                                   textStyle: TextStyle(
                                    //                                       color: Color(
                                    //                                           0xff1B1B1B),
                                    //                                       // letterSpacing:
                                    //                                       //     .5,
                                    //                                       fontSize: 12.sp,
                                    //                                       fontWeight:
                                    //                                           FontWeight
                                    //                                               .w400),
                                    //                                 ),
                                    //                               ),
                                    //                             ),
                                    //                             SizedBox(
                                    //                               height: 10.w,
                                    //                             ),
                                    //                             Container(
                                    //                               padding: EdgeInsets.only(
                                    //                                   left: 12.w,
                                    //                                   right: 14.w,
                                    //                                   top: 10.w),
                                    //                               child: Row(
                                    //                                 mainAxisAlignment:
                                    //                                     MainAxisAlignment
                                    //                                         .spaceBetween,
                                    //                                 children: [
                                    //                                   Container(
                                    //                                     height: 40.h,
                                    //                                     padding:
                                    //                                         EdgeInsets.only(
                                    //                                             left: 11.w,
                                    //                                             bottom: 7.w,
                                    //                                             right: 60.w,
                                    //                                             top: 8.w),
                                    //                                     decoration: BoxDecoration(
                                    //                                         borderRadius:
                                    //                                             BorderRadius
                                    //                                                 .circular(
                                    //                                                     5),
                                    //                                         color: Color(
                                    //                                             0xffEFF9FF),
                                    //                                         border: Border.all(
                                    //                                             color: Color(
                                    //                                                 0xff8CD4FD))),
                                    //                                     child: Column(
                                    //                                       children: [
                                    //                                         Text(
                                    //                                           "EMI Amount",
                                    //                                           style:
                                    //                                               GoogleFonts
                                    //                                                   .inter(
                                    //                                             textStyle: TextStyle(
                                    //                                                 color: Colors
                                    //                                                     .black,
                                    //                                                 letterSpacing:
                                    //                                                     .5,
                                    //                                                 fontSize:
                                    //                                                     10.sp,
                                    //                                                 fontWeight:
                                    //                                                     FontWeight
                                    //                                                         .w400),
                                    //                                           ),
                                    //                                         ),
                                    //                                         Text(
                                    //                                           "₹ 30,000",
                                    //                                           style:
                                    //                                               GoogleFonts
                                    //                                                   .inter(
                                    //                                             textStyle: TextStyle(
                                    //                                                 color: Colors
                                    //                                                     .black,
                                    //                                                 letterSpacing:
                                    //                                                     .5,
                                    //                                                 fontSize:
                                    //                                                     14.sp,
                                    //                                                 fontWeight:
                                    //                                                     FontWeight
                                    //                                                         .w700),
                                    //                                           ),
                                    //                                         ),
                                    //                                       ],
                                    //                                     ),
                                    //                                   ),
                                    //                                   Container(
                                    //                                     height: 40.h,
                                    //                                     padding:
                                    //                                         EdgeInsets.only(
                                    //                                             left: 11.w,
                                    //                                             bottom: 7.w,
                                    //                                             right: 60.w,
                                    //                                             top: 8.w),
                                    //                                     decoration: BoxDecoration(
                                    //                                         borderRadius:
                                    //                                             BorderRadius
                                    //                                                 .circular(
                                    //                                                     5),
                                    //                                         color: Color(
                                    //                                             0xffEFF9FF),
                                    //                                         border: Border.all(
                                    //                                             color: Color(
                                    //                                                 0xff8CD4FD))),
                                    //                                     child: Column(
                                    //                                       children: [
                                    //                                         Text(
                                    //                                           "Total Due",
                                    //                                           style:
                                    //                                               GoogleFonts
                                    //                                                   .inter(
                                    //                                             textStyle: TextStyle(
                                    //                                                 color: Colors
                                    //                                                     .black,
                                    //                                                 letterSpacing:
                                    //                                                     .5,
                                    //                                                 fontSize:
                                    //                                                     10.sp,
                                    //                                                 fontWeight:
                                    //                                                     FontWeight
                                    //                                                         .w400),
                                    //                                           ),
                                    //                                         ),
                                    //                                         Text(
                                    //                                           "₹ 60,000",
                                    //                                           style:
                                    //                                               GoogleFonts
                                    //                                                   .inter(
                                    //                                             textStyle: TextStyle(
                                    //                                                 color: Colors
                                    //                                                     .black,
                                    //                                                 letterSpacing:
                                    //                                                     .5,
                                    //                                                 fontSize:
                                    //                                                     14.sp,
                                    //                                                 fontWeight:
                                    //                                                     FontWeight
                                    //                                                         .w700),
                                    //                                           ),
                                    //                                         ),
                                    //                                       ],
                                    //                                     ),
                                    //                                   ),
                                    //                                 ],
                                    //                               ),
                                    //                             ),
                                    //                             SizedBox(
                                    //                               height: 10.w,
                                    //                             ),
                                    //                           ],
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 );
                                    //               },
                                    //             ),
                                    //           )
                                    //         ],
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(
                                                0xffE7F6FF)), // Border color
                                        borderRadius: BorderRadius.circular(
                                            8), // Optional: Border radius
                                      ),
                                      child: Column(
                                        children: [
                                          ExpansionTile(
                                            title: Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  'assets/icons/report1.svg',
                                                  color: Color(0xff0092E6),
                                                ),
                                                SizedBox(
                                                    width:
                                                        8), // Add some space between icon and text
                                                Text(
                                                  "Field Status Logs",
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xff413185),
                                                        // letterSpacing: .5,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: watch.isExpanded
                                                ? Icon(Icons.arrow_drop_up)
                                                : Icon(Icons
                                                    .arrow_drop_down), // Change trailing icon based on _isExpanded
                                            onExpansionChanged: (isExpanded) {
                                              read.toggleExpansion(isExpanded);

                                              read.FieldStatusLog(
                                                  context, watch.loanId);
                                            },
                                            // Add any single widget you want to display when the tile is expanded
                                            children: <Widget>[
                                              Container(
                                                color: Color(0xffE7F6FF),
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.zero,
                                                  itemCount: watch
                                                          .fieldVisitDa
                                                          ?.customerFieldVisitData
                                                          ?.length ??
                                                      0,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final element = watch
                                                            .fieldVisitDa
                                                            ?.customerFieldVisitData?[
                                                        index];
                                                    return Container(
                                                      padding: EdgeInsets.only(
                                                        top: 17.w,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 14.w,
                                                                    right: 13.w,
                                                                    bottom:
                                                                        10.w),
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  offset:
                                                                      Offset(
                                                                          3, 3),
                                                                  blurRadius:
                                                                      12,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.16),
                                                                ),
                                                              ],
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            // width: 100.w,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets.only(
                                                                      left:
                                                                          12.w,
                                                                      right:
                                                                          13.w,
                                                                      top: 6.w,
                                                                      bottom:
                                                                          7.w),
                                                                  // height: 20.w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Color(
                                                                              0xffF1F1F1),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(15),
                                                                            topRight:
                                                                                Radius.circular(15),
                                                                          )),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "${element?.dispoCode ?? '-'} : ${element?.dispoSubcode ?? '-'}",
                                                                            style:
                                                                                GoogleFonts.inter(
                                                                              textStyle: TextStyle(color: Color(0xff1B1B1B), letterSpacing: .5, fontSize: 13.sp, fontWeight: FontWeight.w700),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "${element?.createdAt}",
                                                                            style:
                                                                                GoogleFonts.inter(
                                                                              textStyle: TextStyle(color: Color(0xff1B1B1B), letterSpacing: .5, fontSize: 11.sp, fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "By : ",
                                                                                style: GoogleFonts.inter(
                                                                                  textStyle: TextStyle(
                                                                                      color: Color(0xff1B1B1B),
                                                                                      // letterSpacing:
                                                                                      //     .5,
                                                                                      fontSize: 10.sp,
                                                                                      fontWeight: FontWeight.w700),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                "${element?.createdBy ?? '-'}",
                                                                                style: GoogleFonts.inter(
                                                                                  textStyle: TextStyle(
                                                                                      color: Color(0xff1B1B1B),
                                                                                      // letterSpacing:
                                                                                      //     .5,
                                                                                      fontSize: 10.sp,
                                                                                      fontWeight: FontWeight.w600),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            "${element?.createdTime}",
                                                                            style:
                                                                                GoogleFonts.inter(
                                                                              textStyle: TextStyle(
                                                                                  color: Color(0xff1B1B1B),
                                                                                  // letterSpacing:
                                                                                  //     .5,
                                                                                  fontSize: 12.sp,
                                                                                  fontWeight: FontWeight.w400),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 13.w,
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets.only(
                                                                      left:
                                                                          14.w,
                                                                      right:
                                                                          12.w),
                                                                  child: Text(
                                                                    "${element?.executiveFeedback}",
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      textStyle: TextStyle(
                                                                          color: Color(0xff1B1B1B),
                                                                          // letterSpacing:
                                                                          //     .5,
                                                                          fontSize: 12.sp,
                                                                          fontWeight: FontWeight.w400),
                                                                    ),
                                                                  ),
                                                                ),
                                                                // SizedBox(
                                                                //   height: 10.w,
                                                                // ),
                                                                element?.dispoCode ==
                                                                            'PTP' &&
                                                                        element?.dispoCode ==
                                                                            'PAID'
                                                                    ? Container()
                                                                    : Container(
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                12.w,
                                                                            right: 14.w,
                                                                            top: 10.w),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              padding: EdgeInsets.only(
                                                                                left: 2.w,
                                                                              ),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    "Amount",
                                                                                    style: GoogleFonts.inter(
                                                                                      textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 10.sp, fontWeight: FontWeight.w400),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    "₹ ${element?.paidAmount ?? '-'}",
                                                                                    style: GoogleFonts.inter(
                                                                                      textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 14.sp, fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            element?.dispoCode == 'PTP' && element?.dispoCode == 'PAID'
                                                                                ? Container()
                                                                                : Container(
                                                                                    height: 40.h,
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Date",
                                                                                          style: GoogleFonts.inter(
                                                                                            textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 10.sp, fontWeight: FontWeight.w400),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          "${element?.paidDate ?? '-'}",
                                                                                          style: GoogleFonts.inter(
                                                                                            textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 14.sp, fontWeight: FontWeight.w700),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                // SizedBox(
                                                                //   height: 10.w,
                                                                // ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
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
                                    SizedBox(
                                      height: 60.w,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
            floatingActionButton: Builder(
              builder: (BuildContext context) {
                return FloatingActionButton(
                  onPressed: () {
                    // Show menu when the floating action button is pressed
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        MediaQuery.of(context).size.width - 0.0, // left
                        MediaQuery.of(context).size.height - 0.0, // top
                        0.0, // right
                        MediaQuery.of(context).size.height - 100.0, // top
                      ),
                      items: [
                        PopupMenuItem(
                          child: ListTile(
                            leading: SvgPicture.asset(
                              'assets/icons/Group 111.svg',
                              // color: Color(0xff413185),
                            ),
                            title: Text('Add Address'),
                            onTap: () {
                              Navigator.pop(context);

                              // Add action here
                              print('Add pressed');
                              showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  context: context,
                                  builder: (context) {
                                    // using a scaffold helps to more easily position the FAB
                                    return AddAddressBottom(
                                      loanId: watch.loanId,
                                    );
                                  });
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: SvgPicture.asset(
                              'assets/icons/Group 109.svg',
                              // color: Color(0xff0092E6),
                            ),
                            title: Text('Add Contact'),
                            onTap: () {
                              Navigator.pop(context);

                              print(watch.loanId);
                              // print(watch.customerId);
                              // return;
                              showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  context: context,
                                  builder: (context) {
                                    // using a scaffold helps to more easily position the FAB
                                    return AddContactBottom(
                                      loanId: watch.loanId,
                                    );
                                  });
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: SvgPicture.asset(
                              'assets/icons/Group 110.svg',
                              // color: Color(0xff0092E6),
                            ),
                            title: Text('Update Status'),
                            onTap: () {
                              print(watch.customerId);
                              print(watch.loanId);
                              // return;
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateHomeViewDetailsScreen(
                                          customerId: watch.customerId,
                                        )),
                              );

                              // Edit action here
                              print('Edit pressed');
                              //
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: SvgPicture.asset(
                              'assets/icons/Group 100.svg',
                              // color: Color(0xff0092E6),Group 100
                            ),
                            title: Text('Caller Script'),
                            onTap: () {
                              print(watch.customerId);
                              print(watch.loanId);
                              // return;
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewScreiptView(
                                          customerId: watch.customerId,
                                        )),
                              );

                              // Edit action here
                              print('Edit pressed');
                              //
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            // title: Text(''),
                            trailing: Container(
                              width: 64.0, // Adjust width as needed
                              height: 64.0, // Adjust height as needed
                              child: SvgPicture.asset(
                                'assets/icons/CloseIcon.svg',
                                // height: 60.h,
                                // color: Color(0xff0092E6),
                              ),
                            ),
                            onTap: () {
                              // Edit action here
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  child: Icon(Icons.add),
                  backgroundColor:
                      Color(0xff0092E6), // Customize background color
                  // foregroundColor: Colors.white, // Customize icon color
                );
              },
            ),
          )
        : TestWidget();
  }
}
