// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:ydcpl_application/screens/report/controller/report_controller.dart';

// class SConfirmedOrdersView extends StatefulWidget {
//   const SConfirmedOrdersView({super.key});

//   @override
//   State<SConfirmedOrdersView> createState() => _SConfirmedOrdersViewState();
// }

// class _SConfirmedOrdersViewState extends State<SConfirmedOrdersView> {
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<ReportViewController>();
//     final watch = context.watch<ReportViewController>();
//     final readMainScreen = context.read<MainScreenController>();
//     return SizedBox(
//       height: MediaQuery.of(context).size.height / 1.5,
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Image.asset(
//             //   "assets/images/empty_order.png",
//             //   width: 150.w,
//             //   height: 150.h,
//             // ),
//             SizedBox(
//               height: 10.h,
//             ),
//             Text(
//               "No Record Found",
//               style: GoogleFonts.dmSans(
//                 textStyle: TextStyle(
//                     color: Colors.black,
//                     letterSpacing: .5,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
