import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hakim/customeIcons.dart/icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../consts/HakimColors.dart';
import 'doctorsWidget/DoctorCard.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({super.key});

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50.sp,
          backgroundColor: HakimColors.hakimPrimaryColor,
          title: const Text('المستشفيات')),
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 15.sp), HospitalCard(location:  "الخرطوم, بري",
            description:                         "افضل الأطباء والإختصاصيون. بالإضافة للأجهزة الحديثة والمتكاملة. طاقم ممرضين ذو خبرة وكفاءة عالية. كما يوجد اسرّة حديثة.",
            name:  'مستشفى رويال كير',
            image: 'https://t3.ftcdn.net/jpg/00/45/20/70/360_F_45207005_oWfbp8uUsuEV74nNLbGS4HyrybFXQek4.jpg',),
            
            
            HospitalCard(location:  "أمدرمان, العرضة",
            description:                         "افضل الأطباء والإختصاصيون. بالإضافة للأجهزة الحديثة والمتكاملة. طاقم ممرضين ذو خبرة وكفاءة عالية. كما يوجد اسرّة حديثة.",
            name: "مستشفى علياء",
            image: 'https://media.gettyimages.com/id/1312706413/photo/modern-hospital-building.jpg?s=612x612&w=gi&k=20&c=1-EC4Mxf--5u4ItDIzrIOrduXlbKRnbx9xWWtiifrDo=',),
            HospitalCard(location:  "أمدرمان, العرضة",
            description:                         "افضل الأطباء والإختصاصيون. بالإضافة للأجهزة الحديثة والمتكاملة. طاقم ممرضين ذو خبرة وكفاءة عالية. كما يوجد اسرّة حديثة.",
            name: "مستشفى علياء",
            image: 'https://media.gettyimages.com/id/1312706413/photo/modern-hospital-building.jpg?s=612x612&w=gi&k=20&c=1-EC4Mxf--5u4ItDIzrIOrduXlbKRnbx9xWWtiifrDo=',)],
        ),
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String name;
  final String image;
  final String location;
  final String description;
  const HospitalCard({
    Key? key, required this.name, required this.image, required this.location, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 15.sp),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 20.6.h,
                width: 34.w,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 50.w,
                height: 20.6.h,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       name,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff707070),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(description,
                        style: TextStyle(
                            fontSize: 10.sp, color: Color(0xff8E8B8B)),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Align(
                            
                            alignment: Alignment.topCenter,
                            child: Icon(Icons.pin_drop,size: 15.sp,color: HakimColors.hakimPrimaryColor,)),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                             location,
                              style: TextStyle(
                                  fontSize: 12.sp, color: Color(0xff8E8B8B)),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            children: [
              Spacer(),
              Container(
                  height: 4.h,
                  width: 50.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("تواصل",style: TextStyle(fontSize: 11.sp),),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                        backgroundColor: HakimColors.doctorButton,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  )),
            ],
          ),
          SizedBox(
            height: 2.5.h,
          )
        ],
      ),
    );
  }
}
