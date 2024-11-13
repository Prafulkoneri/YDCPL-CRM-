import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class PrimaryCTextFormField extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;

  PrimaryCTextFormField(
      {Key? key,
      this.onTap,
      this.textStyle,
      this.borderColor,
      this.maxLines,
      this.height,
      this.width,
      this.hintStyle,
      this.color,
      this.enableBorder,
      this.suffix,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.textInputType,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleHeader != null
            ? Row(
                children: [
                  Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xff3A3A3A)),
                  ),
                ],
              )
            : Container(),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: textInputType,
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(1000),
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: EdgeInsets.only(left: 10.w),
              hintStyle: hintStyle ??
                  TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: borderColor ?? const Color(0xffDBEEF9),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? const Color(0xff8CD4FD),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PrimarySTextFormField extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextInputType? textInputType;
  final void Function()? onTap;

  PrimarySTextFormField(
      {Key? key,
      this.color,
      this.onTap,
      this.padding,
      this.height,
      this.width,
      this.hintFontSize,
      this.maxLines,
      this.enableBorder,
      this.suffix,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.textInputType,
      this.fontWeight,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            titleHeader != null
                ? Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff413185)),
                  )
                : Container(),
          ],
        ),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            onTap: onTap,
            maxLines: maxLines ?? 1,
            keyboardType: textInputType,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(1000),

              // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: padding ??
                  EdgeInsets.only(
                      left: 10.w, top: maxLines != null ? 30.w : 0.w),
              hintStyle: TextStyle(
                  fontSize: hintFontSize ?? 14.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: color ?? const Color(0xff949494)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xffDBEEF9)
                      : const Color(0xffDBEEF9),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xff8CD4FD)
                      : const Color(0xff8CD4FD),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MobileNoController extends ChangeNotifier {
  String flagIcon = "";
  String countryCode = "+91";

  void onCountrySelected(code, icon) {
    countryCode = "+" + code;
    flagIcon = icon;
    notifyListeners();
  }
}
////////////////////////////ShopConFig DropDown TextField/////////////////////

class PrimarySTextFormFieldShopConfig extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextInputType? textInputType;
  final void Function()? onTap;

  PrimarySTextFormFieldShopConfig(
      {Key? key,
      this.color,
      this.onTap,
      this.padding,
      this.height,
      this.width,
      this.hintFontSize,
      this.maxLines,
      this.enableBorder,
      this.suffix,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.textInputType,
      this.fontWeight,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            titleHeader != null
                ? Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xff3A3A3A)),
                  )
                : Container(),
          ],
        ),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            onTap: onTap,
            maxLines: maxLines ?? 1,
            keyboardType: textInputType,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              // lengthLimitingTextInputFormatter ??
              // LengthLimitingTextInputFormatter(1000),

              FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: padding ??
                  EdgeInsets.only(
                      left: 10.w, top: maxLines != null ? 30.w : 0.w),
              hintStyle: TextStyle(
                  fontSize: hintFontSize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: color ?? const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xffE0E0E0)
                      : const Color(0xffEFEFEF),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xffE0E0E0)
                      : const Color(0xffEFEFEF),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
///////////////////NEW/ 2/14/2024/////////////////////////////////////////

class PincodePrimarySTextFormField extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextInputType? textInputType;
  final void Function()? onTap;

  PincodePrimarySTextFormField(
      {Key? key,
      this.color,
      this.onTap,
      this.padding,
      this.height,
      this.width,
      this.hintFontSize,
      this.maxLines,
      this.enableBorder,
      this.suffix,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.textInputType,
      this.fontWeight,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            titleHeader != null
                ? Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff413185)),
                  )
                : Container(),
          ],
        ),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            onTap: onTap,
            maxLines: maxLines ?? 1,
            keyboardType: textInputType,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(6),

              // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: padding ??
                  EdgeInsets.only(
                      left: 10.w, top: maxLines != null ? 30.w : 0.w),
              hintStyle: TextStyle(
                  fontSize: hintFontSize ?? 14.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: color ?? const Color(0xff949494)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xffDBEEF9)
                      : const Color(0xffDBEEF9),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xff8CD4FD)
                      : const Color(0xff8CD4FD),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
