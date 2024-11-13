import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/home/controller/home_controller.dart';
import 'package:ydcpl_application/screens/home/view/home_view.dart';
import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/customebar.dart';

class Notificatio0nView extends StatefulWidget {
  const Notificatio0nView({super.key});

  @override
  State<Notificatio0nView> createState() => _Notificatio0nViewState();
}

class _Notificatio0nViewState extends State<Notificatio0nView> {
  List<Map<String, String>> items = List.generate(5, (index) {
    return {
      'title': 'Hello Good Morning! ${index + 1}',
      'description':
          'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
      'date': '27 Feb,2024',
    };
  });

  @override
  Widget build(BuildContext context) {
    final readMain = context.read<MainScreenController>();
    final watch = context.watch<HomeController>();
    bool isOnline = Provider.of<ConnectivityService>(context).isOnline;

    return isOnline
        ? Scaffold(
            backgroundColor: Color(0xffF7F9FB),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.w),
              child: PrimaryAppBar(
                  // action: SvgPicture.asset(
                  //   'assets/icons/bell.svg',
                  //   // width: 20.w,
                  //   // height: 18.h,
                  // ),
                  // : Container(),
                  onBackBtnPressed: () {
                    readMain.onNavigation(
                        2, const HomePageScreenView(), context);
                  },
                  // isProfileIconEnabled: true,
                  isBackButtonEnabled: true,
                  title: '${watch.appBar?.nameAppBar ?? ''}'

                  // title: Image.asset(
                  //   'assets/images/image 1 (1).png',
                  //   height: 15.w,
                  // ),
                  ),
            ),
            body: WillPopScope(
              onWillPop: () async {
                readMain.onNavigation(1, HomePageScreenView(), context, false);
                // It worked for me instead of above line
                //            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreenView()),);
                //       Navigator.pop(context);
                return false;
              },
              child: Container(
                padding: EdgeInsets.only(left: 14.w, right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Notifications ",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color(0xff1B1B1B),
                            letterSpacing: .5,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 10),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: Key(items[index]['title']!),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                margin: EdgeInsets.only(bottom: 10.w),

                                // margin: EdgeInsets.all(8),
                                // height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFCBCB).withOpacity(0.6),
                                  border: Border.all(
                                    width: 0.78,
                                    style: BorderStyle.solid,
                                    color: Color(0xffFFCBCB),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                alignment: Alignment.centerRight,
                                // padding: EdgeInsets.only(right: 20.w),
                                child: Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: SvgPicture.asset(
                                    "assets/icons/Vector (14).svg",
                                  ),
                                ),
                              ),
                              onDismissed: (direction) {
                                setState(() {
                                  items.removeAt(index);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10.w),
                                // height: 105.h,
                                width: double.infinity.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffE3F5FF).withOpacity(0.6),
                                  border: Border.all(
                                    width: 0.78,
                                    style: BorderStyle.solid,
                                    color: Color(0xff8CD4FD),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(items[index]['title']!,
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      Container(
                                        width: 268.w,
                                        child: Text(
                                            items[index]['description']!,
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(items[index]['date']!,
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        : TestWidget();
  }
}
