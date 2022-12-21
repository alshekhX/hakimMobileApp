import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakim/consts/HakimColors.dart';
import 'package:hakim/screens/CategoryScreen.dart';
import 'package:hakim/screens/HospitalsScreen.dart';
import 'package:hakim/tools/mainClipper.dart';
import 'package:sizer/sizer.dart';

import 'homePageWidget/CircularImages.dart';
import 'homePageWidget/MainCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 30.h,
                  width: 100.w,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff00C7C7),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(500),
                        bottomRight: Radius.circular(500),
                      ),
                    ),
                    height: 25.h,
                    width: 100.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35.sp,
                        ),
                        Image.asset('assets/mainLogo.png')
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                      child: Container(
                        color: Colors.white,
                        height: 45.sp,
                        child: TextField(
                          onSubmitted: ((value) async {}),
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            fillColor: Colors.black,
                            hintStyle: TextStyle(color: Colors.grey),
                            focusColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 30.sp,
                            ),
                            focusedBorder: OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide: BorderSide(
                                    color: Color(0xffBEBEBE), width: 1.0),
                                borderRadius: BorderRadius.circular(30)),
                            enabledBorder: OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide: BorderSide(
                                    color: Color(0xffBEBEBE), width: 1.0),
                                borderRadius: BorderRadius.circular(30)),
                            hintText: 'إبحث عن طبيب',
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 30.sp,
            ),
            Container(
              color: HakimColors.greySurr,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Row(
                  children: [
                    InkWell(
                       onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Hospitals()));
                      },

                      child: HakimMainCard(
                        title: 'المستشفيات',
                        icon: Icons.local_hospital_outlined,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CatergoryScreen()));
                      },
                      child: HakimMainCard(
                        title: 'الأطباء',
                        icon: Icons.medical_information_outlined,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    HakimMainCard(
                      title: 'العلاج المنزلي',
                      icon: Icons.local_hospital_outlined,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Text(
                  "مقالات طبية",
                  style: TextStyle(
                      color: HakimColors.MainfontColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(
              height: 6.sp,
            ),

            Container(
              color: HakimColors.greySurr,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w, top: 6.sp, bottom: 6.sp),
                child: Container(
                  height: 28.w,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MedicalArticle(
                        image:
                            'https://fortisbangalore.com/frontend/locationimage/fortis-hospital-bannerghatta-road-bangalore-karnataka.jpg',
                      ),
                      MedicalArticle(
                        image:
                            'https://bizimages.withfloats.com/actual/61c4aca554ff6b0001c29f23.jpg',
                      ),
                      MedicalArticle(
                        image:
                            'https://fortisbangalore.com/frontend/locationimage/fortis-hospital-bannerghatta-road-bangalore-karnataka.jpg',
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20.sp,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Text(
                  " أبرز الأطباء",
                  style: TextStyle(
                      color: HakimColors.MainfontColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(
              height: 6.sp,
            ),

            Container(
              color: HakimColors.greySurr,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w, top: 6.sp, bottom: 6.sp),
                child: Container(
                  height: 28.w,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MedicalArticle(
                        image:
                            'https://fortisbangalore.com/frontend/locationimage/fortis-hospital-bannerghatta-road-bangalore-karnataka.jpg',
                      ),
                      MedicalArticle(
                        image:
                            'https://bizimages.withfloats.com/actual/61c4aca554ff6b0001c29f23.jpg',
                      ),
                      MedicalArticle(
                        image:
                            'https://fortisbangalore.com/frontend/locationimage/fortis-hospital-bannerghatta-road-bangalore-karnataka.jpg',
                      )
                    ],
                  ),
                ),
              ),
            )

            //            Padding(
            //           padding:  EdgeInsets.only(left: 5.w,right: 5.w),
            //           child: Row(children: [
            //             Container(
            //               height: 30.h,
            //               color: Colors.grey.shade200,
            //               width: 29.w,
            //               child: Column(children: [

            //                 SizedBox(height: 16.sp,),
            //                 Text('الأطباء',style: GoogleFonts.tajawal(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),

            //                                 SizedBox(height: 16.sp,),
            //                                 Icon(Icons.medical_information_rounded,size: 32.sp,),
            // ],),
            //             ),
            //             SizedBox(width: 1.5.w,),
            //             Container(
            //               height: 30.h,
            //               color: Colors.grey.shade200,
            //               width: 29.w,
            //               child: Column(children: [

            //                 SizedBox(height: 16.sp,),
            //                 Text('الأطباء',style: GoogleFonts.tajawal(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),)],),

            //             ),
            //             SizedBox(width: 1.5.w,),
            //               Container(
            //               height: 30.h,
            //               color: Colors.grey.shade200,
            //               width: 29.w,
            //               child:Column(children: [

            //                 SizedBox(height: 16.sp,),
            //                 Text('الأطباء',style: GoogleFonts.tajawal(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),)],),

            //             ),

            //           ],),
            //         )

            //           Align(alignment: Alignment.topRight,
            //                                     child:                 Text('الاطباء',style: GoogleFonts.tajawal(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),
            // ))
          ],
        ),
      ),
    );
  }
}
