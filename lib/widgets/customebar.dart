import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryAppBar extends StatelessWidget {
  final String? title;
  final Widget? action;
  final bool? isBackButtonEnabled;
  final bool? isProfileIconEnabled;
  final EdgeInsets? titlePadding;
  void Function()? onActionTap;
  final void Function()? onBackBtnPressed;
  final void Function()? onProfileIconPressed;

  PrimaryAppBar({
    Key? key,
    this.isBackButtonEnabled,
    this.isProfileIconEnabled,
    required this.title,
    this.onBackBtnPressed,
    this.onProfileIconPressed,
    this.action,
    this.titlePadding,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarHeight: 65.w,
      leading: (isBackButtonEnabled ?? true)
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: onBackBtnPressed,
            )
          : (isProfileIconEnabled ?? false)
              ? IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/userprofile.svg',
                  ),
                  onPressed: onProfileIconPressed)
              : null,
      title: title != null
          ? Container(
              padding: titlePadding,
              child: Container(
                padding: EdgeInsets.only(
                    left: 20.w, top: 2, bottom: 2.w, right: 20.w),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 5, 52, 138),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Text(
                  maxLines: 2,
                  title!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            )
          : Container(
              child: Text(
                'Caller Script',
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                      color: Color(0xff413185),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ), // Show an empty container if title is null
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(0),
          bottom: Radius.circular(20),
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          gradient: LinearGradient(
            end: Alignment.centerRight,
            begin: Alignment.centerLeft,
            colors: <Color>[
              Color(0xffC5EAFF),
              Color(0xffFFFFFF),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: onActionTap,
          child: Container(
            color: Colors.transparent,
            height: 100.w,
            width: 100.w,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: action,
              ),
            ),
          ),
        )
      ],
    );
  }
}
