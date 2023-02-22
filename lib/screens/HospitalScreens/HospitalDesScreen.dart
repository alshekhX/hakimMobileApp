import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:hakim/consts/HakimColors.dart';
import 'package:hakim/models/Hospital.dart';
import 'package:hakim/screens/widget/mapHolder.dart';
import 'package:hakim/screens/widget/phoneTileWidget.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../consts/networkConst.dart';

class HospitalDes extends StatefulWidget {
  const HospitalDes({super.key, required this.hospital});

  final Hospital hospital;

  @override
  State<HospitalDes> createState() => _HospitalDesState();
}

class _HospitalDesState extends State<HospitalDes> {
  List<Widget>? hosImages;
  List<Widget>? hosNumbers;

  @override
  Widget build(BuildContext context) {
    hosImages = widget.hospital.assets!
        .map((e) => Image.network(
              NetworkConst().photoUrl  + e,
              fit: BoxFit.cover,
            ))
        .toList();
    print('tjghghjfgh');

    print(widget.hospital.phone!.length);

    hosNumbers =
        widget.hospital.phone!.map((e) => PhoneTile(phone: e,color: HakimColors.hakimPrimaryColor,)).toList();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
                child: ImageSlideshow(
                  /// Width of the [ImageSlideshow].
                  width: double.infinity,

                  /// Height of the [ImageSlideshow].
                  height: 200,

                  /// The page to show when first creating the [ImageSlideshow].
                  initialPage: 0,

                  /// The color to paint the indicator.
                  indicatorColor: HakimColors.hakimPrimaryColor,

                  /// The color to paint behind th indicator.
                  indicatorBackgroundColor: Colors.grey,

                  /// The widgets to display in the [ImageSlideshow].
                  /// Add the sample image file into the images folder
                  children: hosImages!,

                  /// Called whenever the page in the center of the viewport changes.
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },

                  /// Auto scroll interval.
                  /// Do not auto scroll with null or 0.
                  autoPlayInterval: 3000,

                  /// Loops back to first slide.
                  isLoop: true,
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              AppHorzintalpadding(
                widget: HakimMainText(
                  name: widget.hospital.name!,
                ),
                hzPading: 7.w,
              ),
              SizedBox(
                height: 10.sp,
              ),
              Container(
                width: 100.w,
                decoration: BoxDecoration(                color: Colors.white,
                boxShadow: [


                  BoxShadow(
    color: Colors.grey.shade300,
    spreadRadius: 0,
    blurStyle: BlurStyle.outer,
    blurRadius: 0,
    offset: const Offset(-1, 1),
  )
                ]
),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  child: AppHorzintalpadding(
                      widget: Text(widget.hospital.description!,
                          style: TextStyle(
                              color: Colors.black.withOpacity(.60),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600)),
                      hzPading: 7.w),
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              AppHorzintalpadding(
                  widget: HakimMainText(name: 'تواصل'), hzPading: 7.w),
              SizedBox(
                height: 10.sp,
              ),
              Column(
                children: hosNumbers!,
              ),
              SizedBox(
                height: 30.sp,
              ),
              AppHorzintalpadding(
                  widget: HakimMainText(name: 'الموقع'), hzPading: 7.w),
              SizedBox(
                height: 20.sp,
              ),
              Container(
  decoration: BoxDecoration(                color: Colors.white,
                boxShadow: [


                  BoxShadow(
    color: Colors.grey.shade300,
    spreadRadius: 0,
    blurStyle: BlurStyle.outer,
    blurRadius: 0,
    offset: const Offset(-1, 1),
  )
                ]
),                
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  child: AppHorzintalpadding(
                      widget: Column(
                        children: [
                          Card(
                              elevation: 5,
                              child: Container(
                                
                                
                                  width: 90.w,
                                  height: 30.h,
                                  child: MapHolder(
                                    lat: widget.hospital.position!.coordinates[0],
                                    long: widget.hospital.position!.coordinates[1],
                                  ))),
                                  Row(
                  children: [
                    Icon(
                      Ionicons.location_outline,
                      color: HakimColors.hakimPrimaryColor,
                      size: 15.sp,
                    ),
                    SizedBox(
                      width: 1.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.5.sp),
                      child: Text(widget.hospital.location!,
                          style: TextStyle(
                              color: Colors.black.withOpacity(.60),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
                        ],
                      ),
                      hzPading: 10.w),
                ),
              ),
                SizedBox(
                height: 20.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HakimMainText extends StatelessWidget {
  final String name;
  const HakimMainText({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          color: Colors.black.withOpacity(.87),
          fontSize: 16.sp,
          fontWeight: FontWeight.w700),
    );
  }
}

class AppHorzintalpadding extends StatelessWidget {
  final Widget widget;
  final double hzPading;
  const AppHorzintalpadding({
    Key? key,
    required this.widget,
    required this.hzPading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: hzPading), child: widget);
  }
}
