import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
import 'package:ydcpl_application/widgets/buttons.dart';
import 'package:ydcpl_application/widgets/textfield.dart';

class AddAddressBottom extends StatefulWidget {
  final String? loanId;

  const AddAddressBottom({super.key, this.loanId});

  @override
  State<AddAddressBottom> createState() => _AddAddressBottomState();
}

class _AddAddressBottomState extends State<AddAddressBottom> {
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeDetailsController>();
    final read = context.read<HomeDetailsController>();
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
          height: 380.h,
          // padding:
          //     EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

          decoration: BoxDecoration(
              color: Color(0xffE7F6FF).withOpacity(0.7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.w, top: 20.w, right: 18.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Address",
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
                          // height: 45.h,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 1, color: Color(0xff8CD4FD)),
                Container(
                  padding: EdgeInsets.only(left: 28.w, top: 10.w, right: 28.w),
                  child: PrimarySTextFormField(
                    onChanged: (value) {
                      read.checkAddressExist(context);
                    },
                    titleHeader: 'Address',
                    controller: watch.newaddressController,
                    hintText: "Enter address",
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 28.w, top: 10.w, right: 28.w),
                  child: PrimarySTextFormField(
                    titleHeader: 'Area',
                    controller: watch.areaController,
                    hintText: "Enter area",
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 28.w, top: 10.w, right: 28.w),
                  child: PincodePrimarySTextFormField(
                    textInputType: TextInputType.number,
                    titleHeader: 'Pincode',
                    controller: watch.pinCodeController,
                    hintText: "Enter pincode",
                  ),
                ),
                Column(
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
                        children: [],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.w, top: 20.w, right: 18.w),
                  child: PrimaryButton(
                    child: Text(
                      'Submit',
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
                      read.AddNewAddress(
                          context,
                          watch.loanId,
                          watch.newaddressController,
                          watch.areaController,
                          watch.pinCodeController);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
