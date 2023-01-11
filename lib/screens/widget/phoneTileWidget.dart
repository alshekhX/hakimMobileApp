
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../HospitalDesScreen.dart';

class PhoneTile extends StatelessWidget {
  final String phone;
  const PhoneTile({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppHorzintalpadding(
        widget: Container(
            padding: EdgeInsets.only(bottom: 10.sp),
            height: 40.sp,
            child: Row(
              children: [
                Text(
                  phone,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.60),
                      fontWeight: FontWeight.w900,
                      fontSize: 11.sp),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green.shade400,
                      border: Border.all(width: 0, color: Colors.white)),
                  height: 40.sp,
                  width: 40.sp,
                  child: Center(
                      child: Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 20.sp,
                  )),
                ),
                SizedBox(
                  width: 5.w,
                )
              ],
            )),
        hzPading: 5.w);
  }
}
