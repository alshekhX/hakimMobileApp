import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakim/consts/networkConst.dart';
import 'package:hakim/customeIcons.dart/icons.dart';
import 'package:hakim/models/Doctor.dart';
import 'package:hakim/screens/widget/apppBar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../consts/HakimColors.dart';
import '../HospitalScreens/HospitalDesScreen.dart';
import '../selectionClass/DocCategoryClass.dart';

class DoctorDescription extends StatelessWidget {
  final Doctor doctor;
  const DoctorDescription({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar('معلومات الطبيب', false, context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.5.h,
            ),
            Container(
              child: CircleAvatar(
                radius: 50.sp,
                backgroundColor: HakimColors.hakimPrimaryColor,
                child: Container(
                  child: CircleAvatar(
                    radius: 48.sp,
                    backgroundImage: NetworkImage(NetworkConst().photoUrl+doctor.photo!),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            HakimMainText(name:doctor.firstName! + " "+ doctor.lastName!),
            SizedBox(
              height: 6.h,
            ),
           
            DoctorListTile(
              icon: DocCategory.medicalProduct
                  .where((element) => element.category == doctor.category)
                  .toList()[0]
                  .categoryIcon,
              title:doctor.category!,
            ),
             DoctorListTile(
              icon: MyFlutterApp.consult_doctor_1607918,
              title:
                 doctor.rank!,
            ),
            
            DoctorListTile(
              icon: Ionicons.pencil_outline,
              title:
                  doctor.description!,
            ),
        SizedBox(
              height: 6.h,
            ),
      
             Container(
              
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff00C7C7),
                        border: Border.all(width: 0, color: Colors.white)),
                    height: 8.h,
                    width: 35.w,
                    child: Center(
                        child: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 30.sp,
                    )),
                  ),
                    SizedBox(
              height: 6.h,
            ),
      
          ],
        ),
      ),
    );
  }
}

class DoctorListTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const DoctorListTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.sp),
      child: Container(
        color: HakimColors.greySurr,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          child: Row(children: [
            SizedBox(
              width: 14.w,
            ),
            Icon(
              icon,
              size: 20.sp,
              color: HakimColors.hakimPrimaryColor,
            ),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: 70.w,
              child: Text(
                title,
                style: GoogleFonts.tajawal(
                    fontSize: 14.sp,
                    color: Color(0xff707070),
                    fontWeight: FontWeight.w500),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
