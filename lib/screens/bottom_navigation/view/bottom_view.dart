import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/test_connection.dart';

class MainScreenView extends StatefulWidget {
  final bool? isRefresh;
  final Widget? screenName;
  final Widget? newBudget;
  final int? index;
  const MainScreenView(
      {Key? key, this.isRefresh, this.screenName, this.newBudget, this.index})
      : super(key: key);

  @override
  _MainScreenViewState createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   context.read<ProfileController>().initState(context, true);
    //   context.read<AllShopController>().initState(context, true);
    //   context.read<CartListController>().initState(context);
    // });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<MainScreenController>().initState(
            context,
            widget.index,
            widget.screenName,
          );
    });
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final read = context.read<MainScreenController>();
    final watch = context.watch<MainScreenController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return isOnline
        ? Scaffold(
            extendBody: true,
            bottomNavigationBar: Visibility(
              visible: !watch.hideBottomNavigation ? true : false,
              child: Container(
                  height: 70.w,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.w),
                        topLeft: Radius.circular(15.w)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 2),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: BottomAppBar(
                      child: Container(
                        color: Color(0xffE7F6FF).withOpacity(0.6),
                        padding:
                            EdgeInsets.only(left: 35.w, right: 35.w, top: 16.w),
                        height: 70.w,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                read.onHomeScreenPressed();
                              },
                              child: watch.currentTab == 0
                                  ? Container(
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      color: Colors.transparent,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.w,
                                            width: 21.w,
                                            child: SvgPicture.asset(
                                                "assets/icons/home.svg",
                                                color: Color(0xff413185)),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Text(
                                            "Home",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11.sp,
                                                color: Color(0xff413185)),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      color: Colors.transparent,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.w,
                                            width: 21.w,
                                            child: SvgPicture.asset(
                                                "assets/icons/home.svg",
                                                color: Color(0xff413185)),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Text(
                                            "Home",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp,
                                                color: Color(0xff413185)),
                                          )
                                        ],
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                read.onShopPressed();
                              },
                              child: watch.currentTab == 1
                                  ? Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.w,
                                            width: 21.w,
                                            child: SvgPicture.asset(
                                              "assets/icons/report.svg",
                                              height: 20.w,
                                              width: 20.w,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Text(
                                            "Reports",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11.sp,
                                                color: Color(0xff413185)),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.w,
                                            width: 21.w,
                                            child: SvgPicture.asset(
                                                "assets/icons/report.svg"),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Text(
                                            "Reports",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp,
                                                color: Color(0xff413185)),
                                          )
                                        ],
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                read.onOfferPressed();
                              },
                              child: watch.currentTab == 2
                                  ? Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.w,
                                            width: 21.w,
                                            child: SvgPicture.asset(
                                                "assets/icons/settings.svg",
                                                color: Color(0xff413185)),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Text(
                                            "Settings",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11.sp,
                                                color: Color(0xff413185)),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.w,
                                            width: 21.w,
                                            child: SvgPicture.asset(
                                                "assets/icons/settings.svg"),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Text(
                                            "Settings",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp),
                                          )
                                        ],
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                read.onAccountPressed(context);
                              },
                              child: watch.currentTab == 3
                                  ? Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.w,
                                            width: 21.w,
                                            child: SvgPicture.asset(
                                                "assets/icons/logout.svg",
                                                color: Color(0xff413185)),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Text(
                                            "Logout",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11.sp,
                                                color: Color(0xff413185)),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.w,
                                            width: 21.w,
                                            child: SvgPicture.asset(
                                                "assets/icons/logout.svg"),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Text(
                                            "Logout",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp),
                                          )
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            body: watch.currentScreen
            // Stack(
            //   children: [
            //     Navigator(
            //       key: navigatorKey,
            //       onGenerateRoute: (RouteSettings settings) {
            //         return MaterialPageRoute(
            //           builder: (BuildContext context) => watch.currentScreen,
            //         );
            //       },
            //     ),
            //   ],
            // ),

            )
        : TestWidget();
  }
}
