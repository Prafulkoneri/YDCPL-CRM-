// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:provider/provider.dart';
// // import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
// // import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
// // import 'package:ydcpl_application/screens/home/controller/home_controller.dart';
// // import 'package:ydcpl_application/widgets/customebar.dart';
// // import 'package:ydcpl_application/widgets/loader.dart';

// // class ReportViewScreen extends StatefulWidget {
// //   const ReportViewScreen({super.key});

// //   @override
// //   State<ReportViewScreen> createState() => _ReportViewScreenState();
// // }

// // class _ReportViewScreenState extends State<ReportViewScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final readMain = context.read<MainScreenController>();
// //     final watch = context.read<HomeController>();

// //     return Scaffold(
// //         backgroundColor: Color(0xffF7F9FB),
// // appBar: PreferredSize(
// //   preferredSize: Size.fromHeight(60.w),
// //   child: PrimaryAppBar(
// //       action: SvgPicture.asset(
// //         'assets/icons/bell.svg',
// //       ),
// //       onProfileIconPressed: () {
// //         readMain.onNavigation(2, const ProfileScren(), context);
// //       },
// //       isProfileIconEnabled: true,
// //       isBackButtonEnabled: false,
// //       title: '${watch.appBar?.nameAppBar ?? ''}'),
// // ),
// //         body: watch.isLoading
// //             ? const Loader()
// //             : WillPopScope(
// // onWillPop: () async {
// //   return false;
// // },
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                 ),
// //               ));
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:ydcpl_application/screens/report/controller/report_controller.dart';
// import 'package:ydcpl_application/screens/report/view/report_completed_view.dart';
// import 'package:ydcpl_application/screens/report/view/report_ongoing_view.dart';
// import 'package:ydcpl_application/widgets/customebar.dart';
// import 'package:ydcpl_application/widgets/indicator.dart';
// import 'package:ydcpl_application/widgets/loader.dart';

// class ReportViewScreen extends StatefulWidget {
//   final int? selectedIndex;
//   final bool? isFromOrderView;
//   const ReportViewScreen({Key? key, this.selectedIndex, this.isFromOrderView})
//       : super(key: key);

//   @override
//   _ReportViewScreenState createState() => _ReportViewScreenState();
// }

// class _ReportViewScreenState extends State<ReportViewScreen>
//     with TickerProviderStateMixin {
//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<ReportController>().initState(context, widget.selectedIndex);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<ReportController>();
//     final watch = context.read<ReportController>();
//     final readMain = context.read<MainScreenController>();

//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: PreferredSize(
// preferredSize: Size.fromHeight(60.w),
// child: PrimaryAppBar(
//     action: SvgPicture.asset(
//       'assets/icons/bell.svg',
//     ),
//     onProfileIconPressed: () {
//       readMain.onNavigation(2, const ProfileScren(), context);
//     },
//     isProfileIconEnabled: true,
//     isBackButtonEnabled: false,
//     title: '${watch.appBar?.nameAppBar ?? ''}'),
//         ),
//         body:
//             //  watch.isLoading
//             //     ? const Loader()
//             //     :
//             WillPopScope(
//           onWillPop: () async {
//             return false;
//           },
//           child: Column(
//             children: [
//               TabBar(
//                 physics: const NeverScrollableScrollPhysics(),
//                 // indicatorSize: TabBarIndicatorSize.tab,
//                 // controller: tabController,
//                 splashBorderRadius: BorderRadius.circular(20),
//                 indicator:
//                     CustomIndicator(color: Colors.transparent, radius: 0.w),
//                 // indicatorWeight: 0.w,
//                 // indicatorPadding: EdgeInsets.only(top: 10.w),
//                 padding: EdgeInsets.only(top: 16.w),
//                 labelPadding: EdgeInsets.only(bottom: 0.w),
//                 tabs: <Widget>[
//                   Tab(
//                     child: Container(
//                       child: Column(
//                         children: [
//                           Text(
//                             "Pending",
//                             style: TextStyle(
//                                 fontSize: 12.sp,
//                                 fontWeight: watch.selectedIndex == 0
//                                     ? FontWeight.w700
//                                     : FontWeight.w400,
//                                 color: const Color(0xff3A3A3A)),
//                           ),
//                           SizedBox(
//                             height: 10.w,
//                           ),
//                           watch.selectedIndex == 0
//                               ? Container(
//                                   height: 6.w,
//                                   decoration: BoxDecoration(
//                                       color: const Color(0xff39C19D),
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(5.w),
//                                           topRight: Radius.circular(5.w))),
//                                 )
//                               : Container(),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Container(
//                       child: Column(
//                         children: [
//                           Text(
//                             "Confirmed",
//                             style: TextStyle(
//                                 fontSize: 12.sp,
//                                 fontWeight: watch.selectedIndex == 1
//                                     ? FontWeight.w700
//                                     : FontWeight.w400,
//                                 color: const Color(0xff3A3A3A)),
//                           ),
//                           SizedBox(
//                             height: 10.w,
//                           ),
//                           watch.selectedIndex == 1
//                               ? Container(
//                                   height: 6.w,
//                                   decoration: BoxDecoration(
//                                       color: const Color(0xff39C19D),
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(5.w),
//                                           topRight: Radius.circular(5.w))),
//                                 )
//                               : Container(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//                 onTap: (index) {
//                   read.onTabClicked(index);
//                 },
//               ),
//               Expanded(
//                 child: ListView(
//                   shrinkWrap: true,
//                   physics: const BouncingScrollPhysics(),
//                   children: [
//                     IndexedStack(
//                       index: watch.selectedIndex,
//                       children: <Widget>[
//                         Visibility(
//                           maintainState: true,
//                           visible: watch.selectedIndex == 0,
//                           child: const OnGoingReportView(),
//                         ),
//                         Visibility(
//                           maintainState: true,
//                           visible: watch.selectedIndex == 1,
//                           child: const CompletedReportView(),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/report/controller/report_controller.dart';
import 'package:ydcpl_application/screens/report/view/report_completed_view.dart';
import 'package:ydcpl_application/screens/report/view/report_ongoing_view.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/customebar.dart';
import 'package:ydcpl_application/widgets/indicator.dart';

class SOrderStatusView extends StatefulWidget {
  final int? selectedIndex;
  final bool? isFromOrderView;
  const SOrderStatusView({Key? key, this.selectedIndex, this.isFromOrderView})
      : super(key: key);

  @override
  _SOrderStatusViewState createState() => _SOrderStatusViewState();
}

class _SOrderStatusViewState extends State<SOrderStatusView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      print("9999");
      context
          .read<ReportViewController>()
          .initState(context, widget.selectedIndex);
    });
    print("gudiyaaaaa");
    print(widget.selectedIndex);
    print(widget.isFromOrderView);
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ReportViewController>();
    final watch = context.watch<ReportViewController>();
    final readMainScreen = context.read<MainScreenController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return isOnline
        ? DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Scaffold(
              backgroundColor: Color(0xffF7F9FB),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.w),
                child: PrimaryAppBar(
                    action: SvgPicture.asset(
                      'assets/icons/bell.svg',
                    ),
                    onProfileIconPressed: () {
                      // readMain.onNavigation(2, const ProfileScren(), context);
                    },
                    isProfileIconEnabled: true,
                    isBackButtonEnabled: false,
                    title: '${watch.appBar?.nameAppBar ?? ' '}'),
              ),
              body: WillPopScope(
                onWillPop: () async {
                  print("hello");
                  // readMainScreen.onNavigation(0,const ShopDashBoardView(refresh: false), context);
                  return false;
                },
                child: Column(
                  children: [
                    // TabBar(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   // indicatorSize: TabBarIndicatorSize.tab,
                    //   // controller: tabController,
                    //   splashBorderRadius: BorderRadius.circular(20),
                    //   indicator:
                    //       CustomIndicator(color: Colors.transparent, radius: 0.w),
                    //   // indicatorWeight: 0.w,
                    //   // indicatorPadding: EdgeInsets.only(top: 10.w),
                    //   padding: EdgeInsets.only(top: 16.w),
                    //   labelPadding: EdgeInsets.only(bottom: 0.w),
                    //   tabs: <Widget>[
                    //     Tab(
                    //       child: Container(
                    //         child: Column(
                    //           children: [
                    //             Text(
                    //               "Pending",
                    //               style: TextStyle(
                    //                   fontSize: 12.sp,
                    //                   fontWeight: watch.selectedIndex == 0
                    //                       ? FontWeight.w700
                    //                       : FontWeight.w400,
                    //                   color: const Color(0xff3A3A3A)),
                    //             ),
                    //             SizedBox(
                    //               height: 10.w,
                    //             ),
                    //             watch.selectedIndex == 0
                    //                 ? Container(
                    //                     height: 6.w,
                    //                     decoration: BoxDecoration(
                    //                         color: const Color(0xff39C19D),
                    //                         borderRadius: BorderRadius.only(
                    //                             topLeft: Radius.circular(5.w),
                    //                             topRight: Radius.circular(5.w))),
                    //                   )
                    //                 : Container(),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     Tab(
                    //       child: Container(
                    //         child: Column(
                    //           children: [
                    //             Text(
                    //               "Confirmed",
                    //               style: TextStyle(
                    //                   fontSize: 12.sp,
                    //                   fontWeight: watch.selectedIndex == 1
                    //                       ? FontWeight.w700
                    //                       : FontWeight.w400,
                    //                   color: const Color(0xff3A3A3A)),
                    //             ),
                    //             SizedBox(
                    //               height: 10.w,
                    //             ),
                    //             watch.selectedIndex == 1
                    //                 ? Container(
                    //                     height: 6.w,
                    //                     decoration: BoxDecoration(
                    //                         color: const Color(0xff39C19D),
                    //                         borderRadius: BorderRadius.only(
                    //                             topLeft: Radius.circular(5.w),
                    //                             topRight: Radius.circular(5.w))),
                    //                   )
                    //                 : Container(),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    //   onTap: (index) {
                    //     read.onTabClicked(index);
                    //   },
                    // ),
                    // Expanded(
                    //   child: ListView(
                    //     shrinkWrap: true,
                    //     physics: const BouncingScrollPhysics(),
                    //     children: [
                    //       IndexedStack(
                    //         index: watch.selectedIndex,
                    //         children: <Widget>[
                    //           Visibility(
                    //             maintainState: true,
                    //             visible: watch.selectedIndex == 0,
                    //             child: const SPendingOrdersView(),
                    //           ),
                    //           Visibility(
                    //             maintainState: true,
                    //             visible: watch.selectedIndex == 1,
                    //             child: const SConfirmedOrdersView(),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          )
        : TestWidget();
  }
}
