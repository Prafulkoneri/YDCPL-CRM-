import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
import 'package:ydcpl_application/widgets/buttons.dart';
import 'package:ydcpl_application/widgets/textfield.dart';

class AddContactBottom extends StatefulWidget {
  final String? customerId;
  final String? loanId;
  const AddContactBottom({Key? key, this.customerId, required this.loanId})
      : super(key: key);

  @override
  State<AddContactBottom> createState() => _AddContactBottomState();
}

class _AddContactBottomState extends State<AddContactBottom> {
  // bool _isExpanded = false;
  // void initState() {
  //   log(widget.customerId ?? '');
  //   log(widget.loanId ?? '');
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     context
  //         .read<HomeDetailsController>()
  //         .initState(context, widget.customerId, widget.loanId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeDetailsController>();
    final read = context.read<HomeDetailsController>();
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 250.h,
        decoration: BoxDecoration(
            color: Color(0xffE7F6FF).withOpacity(0.7),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.w, top: 20.w, right: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Contact",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color(0xff413185),
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
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: Color(0xff8CD4FD)),
            Container(
              padding: EdgeInsets.only(left: 28.w, top: 10.w, right: 28.w),
              child: PrimarySTextFormField(
                textInputType: TextInputType.number,
                controller: watch.addMobileController,
                titleHeader: 'Contact',
                hintText: "Enter Mobile No.",
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffE7F6FF)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 28.w, top: 20.w, right: 18.w),
              child: PrimaryButton(
                child: Text(
                  'Submit',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                width: 150.w,
                borderColor: Color(0xff413185),
                color: Color(0xff413185),
                onTap: () {
                  print(watch.addMobileController);
                  print(watch.loanId);
                  // return;
                  read.AddMobileNumber(
                      context, watch.loanId, watch.addMobileController);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
