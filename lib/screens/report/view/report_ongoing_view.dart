// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:ydcpl_application/screens/report/controller/report_controller.dart';

// class SPendingOrdersView extends StatefulWidget {
//   const SPendingOrdersView({
//     super.key,
//   });

//   @override
//   State<SPendingOrdersView> createState() => _SPendingOrdersViewState();
// }

// class _SPendingOrdersViewState extends State<SPendingOrdersView> {
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<ReportViewController>();
//     final watch = context.watch<ReportViewController>();
//     final readMainScreen = context.read<MainScreenController>();

//     return SizedBox(
//       // height: MediaQuery.of(context).size.height / 1.5,
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               margin: EdgeInsets.only(
//                 left: 13.w,
//                 right: 14.w,
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(left: 14.w, right: 14.w),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border:
//                           Border.all(color: Color(0xffE7F6FF)), // Border color
//                       borderRadius:
//                           BorderRadius.circular(8), // Optional: Border radius
//                     ),
//                     child: Column(
//                       children: [
//                         ExpansionTile(
//                           // controller: watch.portfolioExpansionTileController,
//                           tilePadding: EdgeInsets.zero,
//                           title: Row(
//                             children: <Widget>[
//                               Text(
//                                 "Select Portfolio",
//                                 style: GoogleFonts.inter(
//                                   textStyle: TextStyle(
//                                       color: Color(0xff949494),
//                                       // letterSpacing: .5,
//                                       fontSize: 12.sp,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // trailing: watch.isExpanded
//                           //     ? Icon(Icons.arrow_drop_up)
//                           //     : Icon(Icons
//                           //         .arrow_drop_down), // Change trailing icon based on _isExpanded
//                           // onExpansionChanged: (isExpanded) {
//                           //   read.toggleExpansion(isExpanded);
//                           // },
//                           // Add any single widget you want to display when the tile is expanded
//                           children: <Widget>[
//                             Container(
//                               child: ListView.builder(
//                                 padding: EdgeInsets.zero,
//                                 itemCount: 5,
//                                 //  watch.portfoliodata?.length ?? 0,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {
//                                   // final element = watch.portfoliodata?[index];
//                                   return GestureDetector(
//                                     onTap: () {
//                                       // print(element?.id);
//                                       // read.getPortFolio(
//                                       //     context,
//                                       //     element?.id.toString(),
//                                       //     element?.portfolioName);
//                                       // read.closeExpansionTile(
//                                       //     true); // Assuming this function is correctly implemented in your Provider
//                                     },
//                                     child: Container(
//                                       padding: EdgeInsets.only(
//                                           left: 28.w, top: 17.w, right: 12.w),
//                                       margin: EdgeInsets.only(bottom: 10.w),
//                                       decoration: BoxDecoration(
//                                           border: Border(
//                                         top: BorderSide(
//                                           //                   <--- right side
//                                           color: Color(0xffDBEEF9),
//                                           width: 1.0,
//                                         ),
//                                       )),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   '{element?.portfolioName}',
//                                                   style: GoogleFonts.inter(
//                                                     textStyle: TextStyle(
//                                                         color:
//                                                             Color(0xff1B1B1B),
//                                                         // letterSpacing: .5,
//                                                         fontSize: 12.sp,
//                                                         fontWeight:
//                                                             FontWeight.w500),
//                                                   ),
//                                                 ),
//                                               ]),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5.w,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                   padding: EdgeInsets.only(top: 11.w, bottom: 8.w),
//                   margin: EdgeInsets.only(
//                       // left: 14.w, right: 14.w,
//                       top: 11.w,
//                       bottom: 8.w),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.only(
//                             left: 12.w, top: 2.w, bottom: 2.w, right: 12.w),
//                         // width: ScreenUtil().screenWidth,
//                         color: Color(0xffEFF9FF),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               // width: 100,
//                               // height: 100,
//                               padding: EdgeInsets.only(
//                                   left: 15.w, top: 2, bottom: 2.w, right: 15.w),
//                               decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 5, 52, 138),
//                                   borderRadius: BorderRadius.circular(5.w)),

//                               child: Text(
//                                 "SBI BANK",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.dmSans(
//                                   textStyle: TextStyle(
//                                       color: Colors.white,
//                                       // letterSpacing: .5,
//                                       fontSize: 12.sp,
//                                       fontWeight: FontWeight.w900),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "Personal loan ",
//                               style: GoogleFonts.inter(
//                                 textStyle: TextStyle(
//                                     color: Color(0xff1B1B1B),
//                                     // letterSpacing: .5,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 21.w,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 12.0),
//                         child: Text(
//                           "Portfolio Name",
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.inter(
//                             textStyle: TextStyle(
//                                 color: Color(0xff413185),
//                                 // letterSpacing: .5,
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w900),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 10.w, left: 15.w, right: 15.w),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(3, 3),
//                     blurRadius: 12,
//                     color: Color.fromRGBO(0, 0, 0, 0.16),
//                   ),
//                 ],
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               // width: 100.w,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 18.w,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.only(left: 18.w),
//                         child: Image.asset(
//                           'assets/images/uiw_date.png',
//                           height: 32.w,
//                           width: 32.w,
//                         ),
//                       ),
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Allocation Date:",
//                                   style: GoogleFonts.inter(
//                                     textStyle: TextStyle(
//                                         color: Color(0xff1B1B1B),
//                                         letterSpacing: .5,
//                                         fontSize: 11.sp,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                                 Text(
//                                   "05 Mar 2024",
//                                   style: GoogleFonts.inter(
//                                     textStyle: TextStyle(
//                                         color: Color(0xff1B1B1B),
//                                         letterSpacing: .5,
//                                         fontSize: 14.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             // Container(
//                             //   ,
//                             // )
//                             // SizedBox(height: 5.w,),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image.asset(
//                                 'assets/images/Line 15.png',
//                                 height: 32.w,
//                                 // width: 32.w,
//                               ),
//                             ),
//                             // VerticalDivider(
//                             //   color: Colors.black,
//                             //   thickness: 2,
//                             // ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Closing Date",
//                                   style: GoogleFonts.inter(
//                                     textStyle: TextStyle(
//                                         color: Color(0xff1B1B1B),
//                                         letterSpacing: .5,
//                                         fontSize: 11.sp,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                                 Text(
//                                   "05 June 2024",
//                                   style: GoogleFonts.inter(
//                                     textStyle: TextStyle(
//                                         color: Color(0xff1B1B1B),
//                                         letterSpacing: .5,
//                                         fontSize: 14.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 22.w,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(
//                         left: 12.w, right: 13.w, top: 6.w, bottom: 7.w),
//                     // height: 20.w,
//                     decoration: BoxDecoration(
//                         color: Color(0xffFFEDED),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(15),
//                           bottomRight: Radius.circular(15),
//                         )),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Remaining Days :",
//                           style: GoogleFonts.inter(
//                             textStyle: TextStyle(
//                                 color: Color(0xff1B1B1B),
//                                 letterSpacing: .5,
//                                 fontSize: 11.sp,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                         Text(
//                           "10",
//                           style: GoogleFonts.inter(
//                             textStyle: TextStyle(
//                                 color: Color(0xffCF1515),
//                                 letterSpacing: .5,
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10.w,
//             ),
//             ////////////////////yyyyyyyyyyyyyyyyyyyyyyyyyy/////////////////////
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(
//                       left: 10.w, right: 6.w, bottom: 7.w, top: 12.w),
//                   margin: EdgeInsets.only(left: 14.w),
//                   decoration: BoxDecoration(
//                       color: Color(0xffE7F3FB),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Allocated Cases",
//                         style: GoogleFonts.inter(
//                           textStyle: TextStyle(
//                               color: Colors.black,
//                               letterSpacing: .5,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 11.w,
//                       ),
//                       Text(
//                         "1000",
//                         style: GoogleFonts.inter(
//                           textStyle: TextStyle(
//                               color: Color(0xff0092E6),
//                               // letterSpacing: .5,
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(
//                       left: 8.w, right: 7.w, bottom: 7.w, top: 12.w),
//                   // margin: EdgeInsets.only(left: 14.w),
//                   decoration: BoxDecoration(
//                       color: Color(0xffA3FF9B).withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Visited Cases",
//                         style: GoogleFonts.inter(
//                           textStyle: TextStyle(
//                               color: Colors.black,
//                               letterSpacing: .5,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 11.w,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "750",
//                             style: GoogleFonts.inter(
//                               textStyle: TextStyle(
//                                   color: Color(0xff2EBC00),
//                                   // letterSpacing: .5,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 30.w,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(
//                                 left: 6, right: 5.w, top: 3.w, bottom: 3.w),
//                             decoration: BoxDecoration(
//                                 color: Color(0xff3EA01D),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Text(
//                               "75 %",
//                               style: GoogleFonts.inter(
//                                 textStyle: TextStyle(
//                                     color: Colors.white,
//                                     // letterSpacing: .5,
//                                     fontSize: 9.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(
//                       left: 10.w, right: 9.w, bottom: 7.w, top: 12.w),
//                   margin: EdgeInsets.only(right: 14.w),
//                   decoration: BoxDecoration(
//                       color: Color(0xffFFDC83).withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Pending Cases",
//                         style: GoogleFonts.inter(
//                           textStyle: TextStyle(
//                               color: Colors.black,
//                               letterSpacing: .5,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 11.w,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "750",
//                             style: GoogleFonts.inter(
//                               textStyle: TextStyle(
//                                   color: Color(0xffD99D00),
//                                   // letterSpacing: .5,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 30.w,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(
//                                 left: 6, right: 5.w, top: 3.w, bottom: 3.w),
//                             decoration: BoxDecoration(
//                                 color: Color(0xffD99D00),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Text(
//                               "75 %",
//                               style: GoogleFonts.inter(
//                                 textStyle: TextStyle(
//                                     color: Colors.white,
//                                     // letterSpacing: .5,
//                                     fontSize: 9.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 19.w, right: 19.w, top: 11.w),
//               // margin: EdgeInsets.only(left: 15.w, right: 15.w,b top: 4.w),
//               child: Column(
//                 children: <Widget>[
//                   Table(
//                     border: TableBorder.all(
//                       color: Color(0xffDBDBDB), // Set border color
//                       width: 1.0, // Set border width
//                       style: BorderStyle.solid, // Set border style
//                     ),
//                     // defaultColumnWidth: FixedColumnWidth(120.0),
//                     children: [
//                       TableRow(children: [
//                         Container(
//                           padding: EdgeInsets.only(
//                             left: 10.w,
//                             right: 27.w,
//                             bottom: 10.w,
//                             top: 8.w,
//                           ),
//                           color: const Color(0xffEFF9FF),
//                           child: Center(
//                             child: Text(
//                               "Paid",
//                               overflow: TextOverflow.ellipsis,
//                               style: GoogleFonts.dmSans(
//                                 textStyle: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                             bottom: 10.w,
//                             top: 8.w,
//                           ),
//                           color: const Color(0xffEFF9FF),
//                           child: Center(
//                             child: Text(
//                               "PTP",
//                               style: GoogleFonts.dmSans(
//                                 textStyle: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                             bottom: 10.w,
//                             top: 8.w,
//                           ),
//                           color: const Color(0xffEFF9FF),
//                           child: Center(
//                             child: Text(
//                               "Others",
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ]),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 19.w, right: 19.w),
//               // margin: EdgeInsets.only(left: 15.w, right: 15.w,b top: 4.w),
//               child: Column(children: <Widget>[
//                 createTable(),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget createTable() {
//     final watch = context.watch<ReportViewController>();
//     // final read = context.watch<SubscriptionHistoryController>();
//     List<TableRow> rows = [];
//     int length = 10;
//     for (int i = 0; i < length; i++) {
//       rows.add(
//         TableRow(
//           decoration: BoxDecoration(
//             color: i % 2 == 0
//                 ? Color(0xffF5F5F5)
//                 : Color(
//                     0xffFFFFFF), // Red for even rows, default color for odd rows
//           ),
//           children: [
//             Container(
//               padding: EdgeInsets.only(
//                 left: 9.w,
//                 right: 10.w,
//                 bottom: 10.w,
//                 top: 8.w,
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     '?? "ym"',
//                     style: GoogleFonts.dmSans(
//                       textStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                 right: 27.w,
//                 bottom: 10.w,
//                 top: 8.w,
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     ' ?? ',
//                     style: GoogleFonts.dmSans(
//                       textStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                 left: 0.w,
//                 bottom: 10.w,
//                 top: 8.w,
//               ),
//               color: i % 2 == 0
//                   ? Color(0xffF5F5F5)
//                   : Color(
//                       0xffFFFFFF), // Red for even rows, default color for odd rows
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'hgyjhg',
//                         style: GoogleFonts.dmSans(
//                           textStyle: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//     return Table(
//       border: TableBorder(
//         left: BorderSide(color: Color(0xffDBDBDB), width: 1.w),
//         right: BorderSide(color: Color(0xffDBDBDB), width: 1.w),
//         bottom: BorderSide(color: Color(0xffDBDBDB), width: 1.w),
//         // top: BorderSide(color: Colors.black, width: 1.w),
//         verticalInside: BorderSide(color: Color(0xffDBDBDB), width: 1.w),
//         horizontalInside: BorderSide(color: Color(0xffDBDBDB), width: 1.w),
//       ),
//       children: rows,
//     );
//   }
// }
