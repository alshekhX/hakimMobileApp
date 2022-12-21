import 'package:flutter/material.dart';
import 'package:hakim/customeIcons.dart/icons.dart';
import 'package:sizer/sizer.dart';

import '../consts/HakimColors.dart';
import 'doctorsWidget/DoctorCard.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50.sp,
          backgroundColor: HakimColors.hakimPrimaryColor,
          title: const Text('ألاطباء')

          //  Text(
          //   'الحكيم',
          //   style: GoogleFonts.tajawal(
          //       fontSize: 32.sp,
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold),
          // ),
          ),
      body: Column(children: [SizedBox(height: 15.sp), DoctorCard(
        name: 'شادية عمر',
        rank: 'أخصائي',
        category: 'باطنية',
        icon: MyFlutterApp.stomach_care_1607886,
        image:  'https://media.istockphoto.com/id/1366374033/photo/shot-of-a-young-doctor-using-a-digital-tablet-in-a-modern-hospital.jpg?b=1&s=170667a&w=0&k=20&c=I3nSyS-hAorfMhDCXrv16JyQ7VYgaFr7rrZDW2bC-qs=',

      ),
      DoctorCard(
        name: ' منزر أحمد',
        rank: 'أخصائي',
        category: 'عظام ومفاصل',
        icon: MyFlutterApp.joint_care_1607902,
        image:  'https://media.istockphoto.com/id/1203995945/photo/portrait-of-mature-male-doctor-wearing-white-coat-standing-in-hospital-corridor.jpg?s=612x612&w=0&k=20&c=Hk-dqLqHXyYa4aTqjieXNk9-HQSE8WEYUAjA1sXsy_s=',

      ),DoctorCard(
        name: ' نسرين يوسف الزين',
        rank: 'إستشاري',
        category: 'أسنان',
        icon: MyFlutterApp.oral_care_1607895,
        image:  'https://media.istockphoto.com/photos/doctor-holding-digital-tablet-at-meeting-room-picture-id1189304032?b=1&k=20&m=1189304032&s=612x612&w=0&h=3IlZQ_IDMJDkjPCThsflr8vmCZVPmxXPWLzsxb8rShQ=',

      )]),
    );
  }
}

