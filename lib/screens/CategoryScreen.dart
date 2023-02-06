import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakim/consts/HakimColors.dart';
import 'package:hakim/screens/DoctorScreen.dart';
import 'package:hakim/screens/selectionClass/DocCategoryClass.dart';
import 'package:hakim/screens/widget/apppBar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CatergoryScreen extends StatefulWidget {
  const CatergoryScreen({super.key});

  @override
  State<CatergoryScreen> createState() => _CatergoryScreenState();
}

class _CatergoryScreenState extends State<CatergoryScreen> {
  List<Widget>? category;
  @override
  Widget build(BuildContext context) {
    category = DocCategory.medicalProduct
        .map(
          (e) => InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Doctors()));
              },
              child: CategoryListTile(title: e.category, icon: e.categoryIcon)),
        )
        .toList();
    

    return Scaffold(
      appBar: ReusableWidgets.getAppBar('أقسام الأطباء', false, context),
      body: SingleChildScrollView(child: Padding(
        padding:  EdgeInsets.only(top: 10.sp),
        child: Column(children: category!),
      )),
    );
  }
}

class CategoryListTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryListTile({
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
              width: 8.w,
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
              title,
              style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  color: HakimColors.MainfontColor,
                  fontWeight: FontWeight.w500),
            )
          ]),
        ),
      ),
    );
  }
}
