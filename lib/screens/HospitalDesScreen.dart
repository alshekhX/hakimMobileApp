import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class HospitalDes extends StatefulWidget {
  const HospitalDes({super.key});

  @override
  State<HospitalDes> createState() => _HospitalDesState();
}

class _HospitalDesState extends State<HospitalDes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                indicatorColor: Colors.blue,

                /// The color to paint behind th indicator.
                indicatorBackgroundColor: Colors.grey,

                /// The widgets to display in the [ImageSlideshow].
                /// Add the sample image file into the images folder
                children: [
                  Image.network(
                    'https://th-thumbnailer.cdn-si-edu.com/Eaei75J6_mySD_k8hla28--tpZU=/fit-in/1600x0/https%3A%2F%2Ftf-cmsv2-smithsonianmag-media.s3.amazonaws.com%2Ffiler%2Fb4%2Fc6%2Fb4c65fd0-01ba-4262-9b3d-f16b53bca617%2Fistock-172463472.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://www.who.int/images/default-source/wpro/health-topic/hospitals/f8-11102016-my-6042.tmb-1024v.jpg?sfvrsn=57e1f33d_3',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://images.livemint.com/img/2022/05/15/1600x900/Hospital_1652642151769_1652642165405.jpg',
                    fit: BoxFit.cover,
                  ),
                ],

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
                name: 'إسم المستشفى',
              ),
              hzPading: 5.w,
            ),
            SizedBox(
              height: 20.sp,
            ),
            AppHorzintalpadding(
                widget: Text(
                    'تينتقل نتقفىث ثنتقىفثتقن ثنتقىفثتنقف نثتقىفتثنقف ثنتقىفتنثقف نثتقىفتنثقف نثتقىفتنثقف ثنتقفىنتثقف نثتقىفتنثقفى ثنقت فىنتثق ف',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.60),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600)),
                hzPading: 5.w),
            SizedBox(
              height: 30.sp,
            ),
            AppHorzintalpadding(
                widget: HakimMainText(name: 'تواصل'), hzPading: 5.w),
            SizedBox(
              height: 20.sp,
            ),
            Column(
              children: [
                phoneTile(phone: '09923490343',),
                                phoneTile(phone: '09923490343',),
                                                phoneTile(phone: '09923490343',),


               ],
            ),
            SizedBox(
              height: 30.sp,
            ),
            AppHorzintalpadding(
                widget: HakimMainText(name: 'الموقع'), hzPading: 5.w),
            SizedBox(
              height: 20.sp,
            ),
            AppHorzintalpadding(
                widget: Card(elevation: 5, child: Image.network('https://static1.xdaimages.com/wordpress/wp-content/uploads/2019/06/google-maps-india.jpg')),
                hzPading: 10.w),
                AppHorzintalpadding(widget: Row(children: [Icon(Ionicons.location_outline,color: Colors.black.withOpacity(.60),size: 15.sp,),SizedBox(width: 1.sp,),
                
                Padding(
                  padding: EdgeInsets.only(top: 7.5.sp),
                  child: Text('الخرطوم, بري المعرض, بالقرب من برج ألأمراء' ,
                    style: TextStyle(
                          color: Colors.black.withOpacity(.60),
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600)),
                )],),hzPading: 10.w,)
,
                SizedBox(height: 20.sp,)
          ],
        ),
      ),
    );
  }
}

class phoneTile extends StatelessWidget {
  final String phone;
  const phoneTile({
    Key? key, required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppHorzintalpadding(
        widget: Container(
            padding: EdgeInsets.only(bottom: 10.sp),
            height: 40.sp,
            child: Row(
              children: [
                Text(phone,style: TextStyle(color: Colors.black.withOpacity(.60),fontWeight: FontWeight.w900,fontSize: 11.sp),),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                                      color: Colors.green.shade400,

                    border: Border.all(width: 0,color: Colors.white)
                  ),
                  height: 40.sp,
                  width: 40.sp,
                  child: Center(
                      child: Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 20.sp,
                  )),
                ),
                SizedBox(width: 5.w,)
              ],
            )),
        hzPading: 5.w);
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
