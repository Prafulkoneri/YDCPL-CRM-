import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';
import 'package:ydcpl_application/screens/home/controller/home_controller.dart';
import 'package:ydcpl_application/screens/home/view/home_filtter_view.dart';
import 'package:ydcpl_application/screens/home_view_details/view/home_view_details.dart';
import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
import 'package:ydcpl_application/screens/notification/view/notification_view.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/buttons.dart';
import 'package:ydcpl_application/widgets/customebar.dart';
import 'package:ydcpl_application/widgets/loader.dart';

class HomePageScreenView extends StatefulWidget {
  const HomePageScreenView({super.key});

  @override
  State<HomePageScreenView> createState() => _HomePageScreenViewState();
}

class _HomePageScreenViewState extends State<HomePageScreenView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().initState(context);
    });
    setPagination();
  }

  setPagination() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          context.read<HomeController>().onScrollMaxExtent(context);
          context.read<CocViewController>().initState(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final readMain = context.read<MainScreenController>();
    // final watchApp = context.watch<CocViewController>();

    final watch = context.watch<HomeController>();
    final read = context.read<HomeController>();
    // bool _isExpanded = false;
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
                  onProfileIconPressed: () {
                    readMain.onNavigation(2, const ProfileScren(), context);
                  },
                  isProfileIconEnabled: true,
                  isBackButtonEnabled: false,
                  title: '${watch.appBar?.nameAppBar ?? ''}'
                  //  watch.appBar?.imageAppBar == null
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
                    child: RefreshIndicator(
                      onRefresh: () async {
                        read.refreshState(context);

                        // Implement your refresh logic here
                        // For example, you can fetch new data
                        // await fetchData();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(3, 3),
                                    blurRadius: 12,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  ),
                                ],
                                color: Color(0xffF7F9FB),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 19.0.w,
                                  left: 19.0.w,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 270.w,
                                          height: 36.h,
                                          child: TextField(
                                            onChanged: (value) {
                                              read.activeSearchList(context);
                                            },
                                            controller: watch.searchController,

                                            // onTap: () {
                                            //   // readMain.onNavigation(
                                            //   //     1,
                                            //   //     const AllNearShopsView(
                                            //   //       isSearchFocus: true,
                                            //   //       refreshPage: true,
                                            //   //     ),
                                            //   //     context);
                                            // },
                                            // readOnly: true,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 1,
                                                      color: Color(0xff8CD4FD)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.w)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 1,
                                                      color: Color(0xff8CD4FD)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.w)),
                                              hintText:
                                                  'Search by Name & LAN No.',
                                              hintStyle: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      // letterSpacing: .5,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400)),

                                              // Add a clear button to the search bar

                                              // Add a search icon or button to the search bar
                                              prefixIcon: IconButton(
                                                icon: SvgPicture.asset(
                                                  'assets/icons/Vector (12).svg',
                                                  width: 15.w,
                                                  height: 15.h,
                                                ),
                                                onPressed: () {
                                                  // Perform the search here
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              backgroundColor: Colors.red,
                                              isScrollControlled: true,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(30),
                                                              topRight:
                                                                  Radius
                                                                      .circular(
                                                                          30))),
                                              context: context,
                                              builder: (context) {
                                                return FillterBottom();
                                              },
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            'assets/icons/ion_filter.svg',
                                            // width: 15.w,
                                            height: 45.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Allocated cases ",
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                color: Color(0xff1B1B1B),
                                                letterSpacing: .5,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text(
                                          "${watch.countdata?.totalCases} Cases",
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
                                    SizedBox(
                                      height: 10.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Expanded(
                              child: Stack(
                                children: [
                                  watch.homeList?.allocatedData?.isNotEmpty ==
                                          false
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                "assets/images/Group 1376.png",
                                                width: 150.w,
                                                height: 150.h,
                                              ),
                                            ),
                                          ],
                                        )
                                      : ListView.builder(
                                          controller: scrollController,
                                          scrollDirection: Axis.vertical,
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          // scrollDirection: ,
                                          padding: EdgeInsets.only(
                                              bottom: 70,
                                              left: 12,
                                              right: 14,
                                              top: 10.h),
                                          itemCount: watch.homeList
                                                  ?.allocatedData?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            final element = watch.homeList
                                                ?.allocatedData?[index];
                                            return GestureDetector(
                                              onTap: () {
                                                print(
                                                    element?.loanId.toString());
                                                print(element?.id.toString());
                                                print(element?.productName);
                                                print(element
                                                    ?.productCategoryName);
                                                // return;
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           HomeViewDetailsScreen(
                                                // customerId:
                                                //     element?.id.toString(),
                                                // loanId: element?.loanId
                                                //     .toString(),
                                                //           )),
                                                // );
                                                readMain
                                                    .onCustomVoucherTypeNotification(
                                                        context,
                                                        element?.id.toString(),
                                                        element?.loanId
                                                            .toString(),
                                                        element?.productName,
                                                        element
                                                            ?.productCategoryName);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 10.w),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(3, 3),
                                                      blurRadius: 12,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.16),
                                                    ),
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                // width: 100.w,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 12.w,
                                                          right: 14.w,
                                                          top: 10.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Customer Name : ",
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  textStyle: TextStyle(
                                                                      color: Color(
                                                                          0xff707070),
                                                                      letterSpacing:
                                                                          .5,
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 170.w,
                                                                child: Text(
                                                                  "${element?.name}",
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    textStyle: TextStyle(
                                                                        color: Color(
                                                                            0xff1B1B1B),
                                                                        letterSpacing:
                                                                            .5,
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {},
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/icons/forword.svg',
                                                                color: Color(
                                                                    0xff787878),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.w,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 12.w,
                                                          right: 14.w,
                                                          top: 10.w),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "LAN No :",
                                                            style: GoogleFonts
                                                                .inter(
                                                              textStyle: TextStyle(
                                                                  color: Color(
                                                                      0xff707070),
                                                                  letterSpacing:
                                                                      .5,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${element?.loanId}",
                                                            style: GoogleFonts
                                                                .inter(
                                                              textStyle: TextStyle(
                                                                  color: Color(
                                                                      0xff1B1B1B),
                                                                  letterSpacing:
                                                                      .5,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 6.w,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 12.w,
                                                          right: 14.w,
                                                          top: 10.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            // height: 40.h,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 11.w,
                                                                    bottom: 7.w,
                                                                    right: 60.w,
                                                                    top: 8.w),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: Color(
                                                                    0xffEFF9FF),
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xff8CD4FD))),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "EMI Amount",
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    textStyle: TextStyle(
                                                                        color: Color(
                                                                            0xff413185),
                                                                        letterSpacing:
                                                                            .5,
                                                                        fontSize: 10
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  " ₹ ${element?.emiAmount}",
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    textStyle: TextStyle(
                                                                        color: Color(
                                                                            0xff413185),
                                                                        letterSpacing:
                                                                            .5,
                                                                        fontSize: 14
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            // height: 40.h,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 11.w,
                                                                    bottom: 7.w,
                                                                    right: 60.w,
                                                                    top: 8.w),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: Color(
                                                                    0xffFFEDED),
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xffFDA8A8))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Total Due",
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    textStyle: TextStyle(
                                                                        color: Color(
                                                                            0xffCF1515),
                                                                        letterSpacing:
                                                                            .5,
                                                                        fontSize: 10
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "₹ ${element?.totalOs}",
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    textStyle: TextStyle(
                                                                        color: Color(
                                                                            0xffCF1515),
                                                                        letterSpacing:
                                                                            .5,
                                                                        fontSize: 13
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 9.h,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 12.w,
                                                          right: 13.w,
                                                          top: 6.w,
                                                          bottom: 7.w),
                                                      // height: 20.w,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xffD8F1FF),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15),
                                                          )),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Disposition Code :",
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  textStyle: TextStyle(
                                                                      color: Color(
                                                                          0xff1B1B1B),
                                                                      letterSpacing:
                                                                          .5,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                              Text(
                                                                "${element?.dispostionCode}",
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  textStyle: TextStyle(
                                                                      color: Color(
                                                                          0xff1B1B1B),
                                                                      letterSpacing:
                                                                          .5,
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            "${element?.createdAt}",
                                                            style: GoogleFonts
                                                                .inter(
                                                              textStyle: TextStyle(
                                                                  color: Color(
                                                                      0xff1B1B1B),
                                                                  letterSpacing:
                                                                      .5,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                  Positioned(
                                    bottom: 80.w,
                                    left: 0,
                                    right: 0,
                                    child: Visibility(
                                      visible: watch.showPaginationLoader,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color: Color(0xffD8F1FF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 65.h,
                          // ),
                        ],
                      ),
                    ),
                  ),
          )
        : TestWidget();
  }
}
