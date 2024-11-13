import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/screens/home/controller/home_controller.dart';
import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
import 'package:ydcpl_application/widgets/buttons.dart';
import 'package:ydcpl_application/widgets/textfield.dart';

class FillterBottom extends StatefulWidget {
  final String? loanId;

  const FillterBottom({super.key, this.loanId});

  @override
  State<FillterBottom> createState() => _FillterBottomState();
}

class _FillterBottomState extends State<FillterBottom> {
  final List<String> items = [
    '1-5 lakhs',
    '5-10 lakhs',
    '10-15 lakhs',
    '15-20 lakhs',
    '20-25 lakhs'
  ];

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeController>();
    final read = context.read<HomeController>();
    // bool _isExpanded = false;

    return SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          // height: 530.h,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          color: Color(0xffE7F6FF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.w, top: 20.w, right: 18.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filters",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color(0xff413185),
                            // letterSpacing: .5,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/close.svg',
                        height: 25.w,
                        // height: 45.h,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1, color: Color(0xff8CD4FD)),
              // SizedBox(
              //   height: 18.w,
              // ),
              Container(
                padding: EdgeInsets.only(left: 20.w, top: 18.w),
                child: Text(
                  "Portfolio",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color(0xff413185),
                        // letterSpacing: .5,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 13.w, right: 14.w, top: 13.w),
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color(0xffE7F6FF)), // Border color
                        borderRadius:
                            BorderRadius.circular(8), // Optional: Border radius
                      ),
                      child: Column(
                        children: [
                          ExpansionTile(
                            controller: watch.portfolioExpansionTileController,
                            // tilePadding: EdgeInsets.zero,
                            title: Row(
                              children: <Widget>[
                                Text(
                                  // "${watch.SelectedPortId ?? 'Select Portfolio'}",
                                  " Select Portfolio : ${watch.SelectedPortId ?? ''}",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        color: Color(0xff949494),
                                        // letterSpacing: .5,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
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
                            },
                            // Add any single widget you want to display when the tile is expanded
                            children: <Widget>[
                              Container(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: watch.portfoliodata?.length ?? 0,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final element = watch.portfoliodata?[index];
                                    return GestureDetector(
                                      onTap: () {
                                        print(element?.id);
                                        read.getPortFolio(
                                            context,
                                            element?.id.toString(),
                                            element?.portfolioName);
                                        read.closeExpansionTile(
                                            true); // Assuming this function is correctly implemented in your Provider
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 28.w, top: 17.w, right: 12.w),
                                        margin: EdgeInsets.only(bottom: 10.w),
                                        decoration: BoxDecoration(
                                            border: Border(
                                          top: BorderSide(
                                            //                   <--- right side
                                            color: Color(0xffDBEEF9),
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
                                                  Text(
                                                    '${element?.portfolioName}',
                                                    style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          color:
                                                              Color(0xff1B1B1B),
                                                          // letterSpacing: .5,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ]),
                                          ],
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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.w, top: 18.w),
                child: Text(
                  "Principle Outstanding",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color(0xff413185),
                        // letterSpacing: .5,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 13.w, right: 14.w, top: 13.w),
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color(0xffE7F6FF)), // Border color
                        borderRadius:
                            BorderRadius.circular(8), // Optional: Border radius
                      ),
                      child: Column(
                        children: [
                          ExpansionTile(
                            controller:
                                watch.principleOutExpansionTileController,
                            // tilePadding: EdgeInsets.zero,
                            title: Row(
                              children: <Widget>[
                                Text(
                                  // "${watch.Selectepostos ?? 'Choose one'}",
                                  " Choose one : ${watch.Selectepostos ?? ''}",

                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        color: Color(0xff949494),
                                        // letterSpacing: .5,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
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
                            },
                            // Add any single widget you want to display when the tile is expanded
                            children: <Widget>[
                              Container(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: watch.outstandList?.length ?? 0,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final element = watch.outstandList?[index];
                                    return GestureDetector(
                                      onTap: () {
                                        print(element?.value.toString());
                                        read.getpostoss(
                                            context, element?.value);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 28.w, top: 17.w, right: 12.w),
                                        margin: EdgeInsets.only(bottom: 10.w),
                                        decoration: BoxDecoration(
                                            border: Border(
                                          top: BorderSide(
                                            //                   <--- right side
                                            color: Color(0xffDBEEF9),
                                            width: 1.0,
                                          ),
                                        )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${element?.id}",
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Color(0xff1B1B1B),
                                                    // letterSpacing: .5,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
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
              Container(
                padding: EdgeInsets.only(left: 20.w, top: 18.w),
                child: Text(
                  "Total Outstanding",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color(0xff413185),
                        // letterSpacing: .5,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 13.w, right: 14.w, top: 13.w),
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color(0xffE7F6FF)), // Border color
                        borderRadius:
                            BorderRadius.circular(8), // Optional: Border radius
                      ),
                      child: Column(
                        children: [
                          ExpansionTile(
                            controller: watch.totaloutExpansionTileController,
                            // tilePadding: EdgeInsets.zero,
                            title: Row(
                              children: <Widget>[
                                Text(
                                  " Choose one : ${watch.Selectetos ?? ''}",

                                  // " ${watch.Selectetos ?? 'Choose one'} ",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        color: Color(0xff949494),
                                        // letterSpacing: .5,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
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
                            },
                            // Add any single widget you want to display when the tile is expanded
                            children: <Widget>[
                              Container(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: watch.outstandList?.length ?? 0,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final element = watch.outstandList?[index];
                                    return GestureDetector(
                                      onTap: () {
                                        print(element?.value.toString());
                                        read.gettos(context, element?.value);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 28.w, top: 17.w, right: 12.w),
                                        margin: EdgeInsets.only(bottom: 10.w),
                                        decoration: BoxDecoration(
                                            border: Border(
                                          top: BorderSide(
                                            //                   <--- right side
                                            color: Color(0xffDBEEF9),
                                            width: 1.0,
                                          ),
                                        )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${element?.id}",
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Color(0xff1B1B1B),
                                                    // letterSpacing: .5,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
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
              Container(
                padding: EdgeInsets.only(left: 20.w, top: 18.w),
                child: Text(
                  "Disposition Code",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color(0xff413185),
                        // letterSpacing: .5,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 13.w, right: 14.w, top: 13.w),
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color(0xffE7F6FF)), // Border color
                        borderRadius:
                            BorderRadius.circular(8), // Optional: Border radius
                      ),
                      child: Column(
                        children: [
                          ExpansionTile(
                            controller:
                                watch.depositionCodeExpansionTileController,
                            // tilePadding: EdgeInsets.zero,
                            title: Row(
                              children: <Widget>[
                                Text(
                                  // ' ${watch.SelectedispoCode ?? 'Choose one'}',
                                  " Choose one : ${watch.SelectedispoCode ?? ''}",
                                  // "Choose one ",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        color: Color(0xff949494),
                                        // letterSpacing: .5,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
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
                            },
                            // Add any single widget you want to display when the tile is expanded
                            children: <Widget>[
                              Container(
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount:
                                      watch.dispostionCodeListData?.length ?? 0,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final element =
                                        watch.dispostionCodeListData?[index];
                                    return GestureDetector(
                                      onTap: () {
                                        print(element?.id);

                                        read.getSubCode(
                                            context,
                                            element?.despositionCode
                                                .toString());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 28.w, top: 17.w, right: 12.w),
                                        margin: EdgeInsets.only(bottom: 10.w),
                                        decoration: BoxDecoration(
                                            border: Border(
                                          top: BorderSide(
                                            //                   <--- right side
                                            color: Color(0xffDBEEF9),
                                            width: 1.0,
                                          ),
                                        )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
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
                                          ],
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
              Container(
                padding: EdgeInsets.only(left: 20.w, top: 18.w),
                child: Text(
                  "Location",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color(0xff413185),
                        // letterSpacing: .5,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 13.w, right: 14.w, top: 13.w),
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color(0xffE7F6FF)), // Border color
                        borderRadius:
                            BorderRadius.circular(8), // Optional: Border radius
                      ),
                      child: Column(
                        children: [
                          ExpansionTile(
                            controller: watch.locationExpansionTileController,
                            // tilePadding: EdgeInsets.zero,
                            title: Row(
                              children: <Widget>[
                                Text(
                                  // "${watch.Selectelocation ?? 'Enter location'}",
                                  " Enter location : ${watch.Selectelocation ?? ''}",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        color: Color(0xff949494),
                                        // letterSpacing: .5,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
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
                            },
                            // Add any single widget you want to display when the tile is expanded
                            children: <Widget>[
                              Container(
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: watch.dataLocation?.length ?? 0,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final element = watch.dataLocation?[index];
                                    return GestureDetector(
                                      onTap: () {
                                        print(element?.location.toString());
                                        read.getlocationid(
                                            context, element?.location);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 28.w, top: 17.w, right: 12.w),
                                        margin: EdgeInsets.only(bottom: 10.w),
                                        decoration: BoxDecoration(
                                            border: Border(
                                          top: BorderSide(
                                            //                   <--- right side
                                            color: Color(0xffDBEEF9),
                                            width: 1.0,
                                          ),
                                        )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${element?.location}",
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Color(0xff1B1B1B),
                                                    // letterSpacing: .5,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
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
              Container(
                padding: EdgeInsets.only(left: 20.w, top: 20.w, right: 18.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButton(
                      child: Text(
                        'Reset',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color(0xff413185),
                              // letterSpacing: .5,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      width: 150.w,
                      borderColor: Colors.black,
                      color: Colors.white,
                      onTap: () {
                        print('object');
                        Navigator.pop(context);
                        read.clearFiltter(context);
                      },
                    ),
                    PrimaryButton(
                      child: Text(
                        'Apply',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Colors.white,
                              // letterSpacing: .5,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      width: 150.w,
                      borderColor: Color(0xff413185),
                      color: Color(0xff413185),
                      onTap: () {
                        print("${watch.SelectedispoCode}discode");
                        print("${watch.SelecteportCode}port");
                        print("${watch.Selectepostos}pos");
                        print("${watch.Selectetos}tos");
                        print("${watch.Selectelocation}location");
                        // return;
                        read.getAllList(
                          context,
                          watch.Selectetos ?? '',
                          watch.Selectepostos ?? '',
                          watch.SelecteportCode ?? '',
                          watch.SelectedispoCode ?? '',
                          watch.Selectelocation ?? '',
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.w,
              )
            ],
          ),
        ));
  }
}
