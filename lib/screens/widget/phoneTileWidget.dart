import 'package:flutter/material.dart';
import 'package:hakim/consts/HakimColors.dart';
import 'package:sizer/sizer.dart';

import '../HospitalScreens/HospitalDesScreen.dart';

class PhoneTile extends StatelessWidget {
  final String phone;
  final Color color;
  const PhoneTile({
    Key? key,
    required this.phone, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 5.sp),
      child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              blurRadius: 0,
              offset: const Offset(-1, 1),
            )
          ]),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: AppHorzintalpadding(
                widget: Container(
                    padding: EdgeInsets.only(bottom: 0.sp),
                    child: Row(
                      children: [
                        Text(
                          phone,
                          style: TextStyle(
                              color: Colors.black.withOpacity(.60),
                              fontWeight: FontWeight.w900,
                              fontSize: 12.sp),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.sp),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: color,
                                border:
                                    Border.all(width: 0, color: Colors.white)),
                            height: 35.sp,
                            width: 50.sp,
                            child: Center(
                                child: Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 20.sp,
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        )
                      ],
                    )),
                hzPading: 7.w),
          )),
    );
  }
}
