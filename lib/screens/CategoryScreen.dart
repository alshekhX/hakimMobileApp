import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakim/consts/HakimColors.dart';
import 'package:hakim/customeIcons.dart/icons.dart';
import 'package:hakim/screens/DoctorScreen.dart';
import 'package:sizer/sizer.dart';

class CatergoryScreen extends StatefulWidget {
  const CatergoryScreen({super.key});

  @override
  State<CatergoryScreen> createState() => _CatergoryScreenState();
}

class _CatergoryScreenState extends State<CatergoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50.sp,
        backgroundColor: HakimColors.hakimPrimaryColor,
        title:Image.asset('assets/appBar.png')
        
        //  Text(
        //   'الحكيم',
        //   style: GoogleFonts.tajawal(
        //       fontSize: 32.sp,
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold),
        // ),
      ),
      body: Column(children: [
        SizedBox(
          height: 10.sp,
        ),
        InkWell(
          child: CategoryListTile(title: 'الباطنية',icon: MyFlutterApp.stomach_care_1607886,
          
          
          
          
          ),
          onTap: (() {
             Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Doctors()));
            
          }),),
                CategoryListTile(title: 'العظام',icon: MyFlutterApp.haircare_1607909,)
,        CategoryListTile(title: 'أذن وأنف وحنجرة',icon: MyFlutterApp.cardiogram_1607908,)
,        CategoryListTile(title: 'الجهاز التنفسي',icon: MyFlutterApp.respiratory_care_1607889,)
,        CategoryListTile(title: 'الباطنية',icon: Icons.stadium_outlined,)

      ]),
    );
  }
}

class CategoryListTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryListTile({
    Key? key, required this.title, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Container(
        color: HakimColors.greySurr,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          child: Row(children: [
            SizedBox(
              width: 5.w,
            ),
            Icon(
              icon,
              size: 24.sp,
              color: HakimColors.hakimPrimaryColor,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              'الباطنية',
              style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  color: HakimColors.MainfontColor,
                  fontWeight: FontWeight.w500),
            )
          ]),
        ),
      ),
    );
  }
}
