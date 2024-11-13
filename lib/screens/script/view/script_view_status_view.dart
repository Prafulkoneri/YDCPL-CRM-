import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';
import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
import 'package:ydcpl_application/screens/home_view_details/view/home_view_details.dart';
import 'package:ydcpl_application/screens/script/controller/screpit_controller.dart';
import 'package:ydcpl_application/screens/update_satus/controller/update_status_controller.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/customebar.dart';

class NewScreiptView extends StatefulWidget {
  final String? customerId;
  final String? scriptId;
  final String? loanId;
  const NewScreiptView(
      {super.key, this.customerId, this.scriptId, this.loanId});

  @override
  State<NewScreiptView> createState() => _NewScreiptViewState();
}

class _NewScreiptViewState extends State<NewScreiptView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  // void initState() {
  // super.initState();
  // _tabController = TabController(length: 3, vsync: this);
  // _scrollController = ScrollController();
  // }
  void initState() {
    log(widget.customerId ?? '');
    log(widget.loanId ?? '');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ScriptController>().initState(context, '', '');
    });
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final readMain = context.read<MainScreenController>();
    final watch = context.watch<ScriptController>();
    final read = context.read<ScriptController>();
    final watchView = context.watch<HomeDetailsController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    // bool hasTitle =
    //     watch.appBar?.nameAppBar != null && watch.appBar?.nameAppBar != '';

    return isOnline
        ? Scaffold(
            backgroundColor: Color(0xffF7F9FB),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.w),
              child: PrimaryAppBar(
                  onBackBtnPressed: () {
                    print(watchView
                        .homeListDetailsdata?.customerDetails?.customerId);
                    print(
                        watchView.homeListDetailsdata?.customerDetails?.loanId);

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
                  isBackButtonEnabled: true,
                  title: '${watch.appBar?.nameAppBar ?? ''}'),
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

                return true;
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color(0xffE7F6FF)), // Border color
                      borderRadius:
                          BorderRadius.circular(8), // Optional: Border radius
                    ),
                    child: Column(
                      children: [
                        ExpansionTile(
                          controller:
                              watch.depositionCodeExpans55ionTileController,
                          title: Text(
                            " Select Category : ${watch.scriptName}",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color(0xff413185),
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
                            // read.scriptDetails(context, '', '');
                          },
                          children: <Widget>[
                            // watch.scriptCategories?.isNotEmpty == false
                            //     ? Column(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Container(
                            //             child: Image.asset(
                            //               "assets/images/Group 1376.png",
                            //               width: 150.w,
                            //               height: 150.h,
                            //             ),
                            //           ),
                            //         ],
                            //       )
                            //     :
                            Container(
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: watch.scriptCategories?.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final element =
                                      watch.scriptCategories?[index];
                                  return GestureDetector(
                                    onTap: () {
                                      read.scriptDetails(
                                        context,
                                        element?.id.toString(),
                                        element?.typeName,
                                      );
                                      read.ddadf(context,
                                          element?.typeName.toString());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 28.w, top: 17.w, right: 12.w),
                                      margin: EdgeInsets.only(bottom: 10.w),
                                      decoration: BoxDecoration(
                                          border: Border(
                                        top: BorderSide(
                                          color: Color(0xffDBEEF9),
                                          width: 1.0,
                                        ),
                                      )),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${element?.typeName}",
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  color: Color(0xff1B1B1B),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
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
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildLanguageScreen(context, 'English', () {
                          // Define the onTap action for the English screen, if any.
                        }),
                        _buildLanguageScreen(context, 'Hindi', () {
                          _tabController
                              .animateTo(0); // Switch to the English tab
                        }),
                        _buildLanguageScreen(context, 'Marathi', () {
                          _tabController
                              .animateTo(1); // Switch to the Hindi tab
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : TestWidget();
  }

  Widget _buildLanguageScreen(
      BuildContext context, String language, VoidCallback onBackTap) {
    final watch = context.watch<ScriptController>();
    final read = context.read<ScriptController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return watch.script?.isNotEmpty == false
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
        : Column(children: [
            Container(
              padding:
                  EdgeInsets.only(left: 12.w, top: 20, bottom: 12.w, right: 12),
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
                          _tabController
                              .animateTo(1); // Switch to the Hindi tab
                        } else if (language == 'Hindi') {
                          _tabController
                              .animateTo(2); // Switch to the Marathi tab
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
              // indent: 15.w,
              // endIndent: 15.w,
              thickness: 2,
              color: Color(0xffE3F5FF),
            ),
            Expanded(
                child: watch.script?.isNotEmpty == false
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/Group 1380.png",
                              width: 150.w,
                              height: 150.h,
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18.w),
                        child: RawScrollbar(
                            controller:
                                _scrollController, // Use the same scroll controller
                            thickness: 3.w,
                            thumbColor: Colors.blue,
                            child: ListView.builder(
                                itemCount: watch.script?.length ?? 0,
                                shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final element = watch.script?[index];
                                  return Container(
                                    child: SingleChildScrollView(
                                      controller:
                                          _scrollController, // Use the same scroll controller
                                      scrollDirection: Axis.vertical,
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        children: [
                                          if (language == 'English')
                                            HtmlWidget(
                                                element?.scriptContentEnglish ??
                                                    '')
                                          ///////////massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementumonsectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapi,mollis pretium. Integer tincidunt. Cras dapi, mollis pretium. Integer tincidunt. CrasNulla consequat massa quis enim. Donec pede justo, fring onsectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapi,mollis pretium. Integer tincidunt. Cras dapi, mollis pretium. Integer tincidunt. CrasNulla consequat massa quis enim. Donec pede justo, fring onsectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapi,mollis pretium. Integer tincidunt. Cras dapi, mollis pretium. Integer tincidunt. CrasNulla consequat massa quis enim. Donec pede justo, fring onsectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapi,mollis pretium. Integer tincidunt. Cras dapi, mollis pretium. Integer tincidunt. CrasNulla consequat massa quis enim. Donec pede justo, fring ')
                                          else if (language == 'Hindi')
                                            HtmlWidget(
                                                element?.scriptContentHindi ??
                                                    '')
                                          else if (language == 'Marathi')
                                            HtmlWidget(
                                                element?.scriptContentMarathi ??
                                                    ''),
                                        ],
                                      ),
                                    ),
                                  );
                                }))))
          ]);
  }
}
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:ydcpl_application/internet.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';
// import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
// import 'package:ydcpl_application/screens/home_view_details/view/home_view_details.dart';
// import 'package:ydcpl_application/screens/script/controller/screpit_controller.dart';
// import 'package:ydcpl_application/screens/update_satus/controller/update_status_controller.dart';
// import 'package:ydcpl_application/test_connection.dart';
// import 'package:ydcpl_application/widgets/customebar.dart';

// class NewScreiptView extends StatefulWidget {
//   final String? customerId;
//   final String? scriptId;
//   final String? loanId;
//   const NewScreiptView(
//       {super.key, this.customerId, this.scriptId, this.loanId});

//   @override
//   State<NewScreiptView> createState() => _NewScreiptViewState();
// }

// class _NewScreiptViewState extends State<NewScreiptView>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late ScrollController _scrollController;

//   @override
//   // void initState() {
//   // super.initState();
//   // _tabController = TabController(length: 3, vsync: this);
//   // _scrollController = ScrollController();
//   // }
//   void initState() {
//     log(widget.customerId ?? '');
//     log(widget.loanId ?? '');
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<ScriptController>().initState(context, '', '');
//     });
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _scrollController = ScrollController();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _scrollController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final readMain = context.read<MainScreenController>();
//     final watch = context.watch<ScriptController>();
//     final read = context.read<ScriptController>();
//     final watchView = context.watch<HomeDetailsController>();
//     bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

//     // bool hasTitle =
//     //     watch.appBar?.nameAppBar != null && watch.appBar?.nameAppBar != '';

//     return isOnline
//         ? Scaffold(
//             backgroundColor: Color(0xffF7F9FB),
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(60.w),
//               child: PrimaryAppBar(
//                   onBackBtnPressed: () {
//                     print(watchView
//                         .homeListDetailsdata?.customerDetails?.customerId);
//                     print(
//                         watchView.homeListDetailsdata?.customerDetails?.loanId);

//                     readMain.onNavigation(
//                         1,
//                         HomeViewDetailsScreen(
//                             customerId: watchView.homeListDetailsdata
//                                 ?.customerDetails?.customerId
//                                 .toString(),
//                             loanId: watchView
//                                 .homeListDetailsdata?.customerDetails?.loanId),
//                         context,
//                         false);
//                     readMain.hideBottomNavigationBar();
//                     Navigator.pop(context);
//                   },
//                   isBackButtonEnabled: true,
//                   title: '${watch.appBar?.nameAppBar ?? ''}'),
//             ),
//             body: WillPopScope(
//               onWillPop: () async {
//                 readMain.onNavigation(
//                     1,
//                     HomeViewDetailsScreen(
//                         customerId: watchView
//                             .homeListDetailsdata?.customerDetails?.customerId
//                             .toString(),
//                         loanId: watchView
//                             .homeListDetailsdata?.customerDetails?.loanId),
//                     context,
//                     false);
//                 readMain.hideBottomNavigationBar();

//                 return true;
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
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
//                           controller:
//                               watch.depositionCodeExpans55ionTileController,
//                           title: Text(
//                             " Select Category : ${watch.scriptName}",
//                             style: GoogleFonts.inter(
//                               textStyle: TextStyle(
//                                   color: Color(0xff413185),
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           trailing: watch.isExpanded
//                               ? Icon(Icons.arrow_drop_up)
//                               : Icon(Icons
//                                   .arrow_drop_down), // Change trailing icon based on _isExpanded
//                           onExpansionChanged: (isExpanded) {
//                             read.toggleExpansion(isExpanded);
//                             // read.scriptDetails(context, '', '');
//                           },
//                           children: <Widget>[
//                             // watch.scriptCategories?.isNotEmpty == false
//                             //     ? Column(
//                             //         mainAxisAlignment: MainAxisAlignment.center,
//                             //         children: [
//                             //           Container(
//                             //             child: Image.asset(
//                             //               "assets/images/Group 1376.png",
//                             //               width: 150.w,
//                             //               height: 150.h,
//                             //             ),
//                             //           ),
//                             //         ],
//                             //       )
//                             //     :
//                             Container(
//                               child: ListView.builder(
//                                 physics: NeverScrollableScrollPhysics(),
//                                 padding: EdgeInsets.zero,
//                                 itemCount: watch.scriptCategories?.length,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {
//                                   final element =
//                                       watch.scriptCategories?[index];
//                                   return GestureDetector(
//                                     onTap: () {
//                                       read.scriptDetails(
//                                         context,
//                                         element?.id.toString(),
//                                         element?.typeName,
//                                       );
//                                       read.ddadf(context,
//                                           element?.typeName.toString());
//                                     },
//                                     child: Container(
//                                       padding: EdgeInsets.only(
//                                           left: 28.w, top: 17.w, right: 12.w),
//                                       margin: EdgeInsets.only(bottom: 10.w),
//                                       decoration: BoxDecoration(
//                                           border: Border(
//                                         top: BorderSide(
//                                           color: Color(0xffDBEEF9),
//                                           width: 1.0,
//                                         ),
//                                       )),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "${element?.typeName}",
//                                             style: GoogleFonts.inter(
//                                               textStyle: TextStyle(
//                                                   color: Color(0xff1B1B1B),
//                                                   fontSize: 12.sp,
//                                                   fontWeight: FontWeight.w500),
//                                             ),
//                                           ),
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
//                   watch.script?.isNotEmpty == false
//                       ? Container()
//                       : Expanded(
//                           child: TabBarView(
//                             controller: _tabController,
//                             children: [
//                               _buildLanguageScreen(context, 'English', () {
//                                 // Define the onTap action for the English screen, if any.
//                               }),
//                               _buildLanguageScreen(context, 'Hindi', () {
//                                 _tabController
//                                     .animateTo(0); // Switch to the English tab
//                               }),
//                               _buildLanguageScreen(context, 'Marathi', () {
//                                 _tabController
//                                     .animateTo(1); // Switch to the Hindi tab
//                               }),
//                             ],
//                           ),
//                         )
//                 ],
//               ),
//             ),
//           )
//         : TestWidget();
//   }

//   Widget _buildLanguageScreen(
//       BuildContext context, String language, VoidCallback onBackTap) {
//     final watch = context.watch<ScriptController>();
//     final read = context.read<ScriptController>();
//     bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

//     return Column(children: [
//       Container(
//         padding: EdgeInsets.only(left: 12.w, top: 20, bottom: 12.w, right: 12),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               onTap: onBackTap,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.0),
//                 child: SvgPicture.asset(
//                   'assets/icons/backword.svg',
//                   color: language == 'English'
//                       ? Colors.grey
//                       : Color.fromARGB(255, 3, 18, 228),
//                 ),
//               ),
//             ),
//             Text(
//               language,
//               style: GoogleFonts.inter(
//                 textStyle: TextStyle(
//                   color: Color(0xff413185),
//                   letterSpacing: .5,
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             if (language != 'Marathi')
//               InkWell(
//                 onTap: () {
//                   if (language == 'English') {
//                     _tabController.animateTo(1); // Switch to the Hindi tab
//                   } else if (language == 'Hindi') {
//                     _tabController.animateTo(2); // Switch to the Marathi tab
//                   }
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 18.0, right: 8.0),
//                   child: SvgPicture.asset('assets/icons/forword.svg'),
//                 ),
//               )
//             else
//               SvgPicture.asset(
//                 'assets/icons/forword.svg',
//                 color: Colors.grey,
//               ),
//           ],
//         ),
//       ),
//       Divider(
//         // indent: 15.w,
//         // endIndent: 15.w,
//         thickness: 2,
//         color: Color(0xffE3F5FF),
//       ),
//       Expanded(
//           child: watch.script?.isNotEmpty == false
//               ? Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       child: Image.asset(
//                         "assets/images/Group 1380.png",
//                         width: 150.w,
//                         height: 150.h,
//                       ),
//                     ),
//                   ],
//                 )
//               : Padding(
//                   padding: EdgeInsets.only(left: 18.0, right: 18.w),
//                   child: RawScrollbar(
//                       controller:
//                           _scrollController, // Use the same scroll controller
//                       thickness: 3.w,
//                       thumbColor: Colors.blue,
//                       child: ListView.builder(
//                           itemCount: watch.script?.length ?? 0,
//                           shrinkWrap: true,
//                           // physics: NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             final element = watch.script?[index];
//                             return Container(
//                               child: SingleChildScrollView(
//                                 controller:
//                                     _scrollController, // Use the same scroll controller
//                                 scrollDirection: Axis.vertical,
//                                 physics: const BouncingScrollPhysics(),
//                                 child: Column(
//                                   children: [
//                                     if (language == 'English')
//                                       HtmlWidget(
//                                           element?.scriptContentEnglish ?? '')
//                                     ///////////massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementumonsectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapi,mollis pretium. Integer tincidunt. Cras dapi, mollis pretium. Integer tincidunt. CrasNulla consequat massa quis enim. Donec pede justo, fring onsectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapi,mollis pretium. Integer tincidunt. Cras dapi, mollis pretium. Integer tincidunt. CrasNulla consequat massa quis enim. Donec pede justo, fring onsectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapi,mollis pretium. Integer tincidunt. Cras dapi, mollis pretium. Integer tincidunt. CrasNulla consequat massa quis enim. Donec pede justo, fring onsectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum eu pede mollis pretium. Integer tincidunt. Cras dapi,mollis pretium. Integer tincidunt. Cras dapi, mollis pretium. Integer tincidunt. CrasNulla consequat massa quis enim. Donec pede justo, fring ')
//                                     else if (language == 'Hindi')
//                                       HtmlWidget(
//                                           element?.scriptContentHindi ?? '')
//                                     else if (language == 'Marathi')
//                                       HtmlWidget(
//                                           element?.scriptContentMarathi ?? ''),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }))))
//     ]);
//   }
// }
