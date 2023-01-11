
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:hakim/models/HomeCare.dart';
import 'package:hakim/screens/widget/phoneTileWidget.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class HomeCareDes extends StatefulWidget {
  const HomeCareDes({super.key, required this.homeCare});
    final HomeCare homeCare;


  @override
  State <HomeCareDes> createState() =>  HomeCareDesState();
}

class  HomeCareDesState extends State <HomeCareDes> {

    List<Widget>? homeCaImages;
  List<Widget>? homeCaNumbers;
 
  @override
  Widget build(BuildContext context) {
    homeCaImages = widget.homeCare.assets!
        .map((e) =>
            Image.network('http://192.168.43.250:9000/uploads/photos/' + e))
        .toList();
    homeCaNumbers =
        widget.homeCare.phone!.map((e) => PhoneTile(phone: e)).toList();
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
                children: homeCaImages!,

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
                name: widget.homeCare.name!,
              ),
              hzPading: 5.w,
            ),
            SizedBox(
              height: 20.sp,
            ),
            AppHorzintalpadding(
                widget: Text(widget.homeCare.description!,
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
              children: homeCaNumbers!,
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
                widget: Card(
                    elevation: 5,
                    child: Image.network(
                        'https://static1.xdaimages.com/wordpress/wp-content/uploads/2019/06/google-maps-india.jpg')),
                hzPading: 10.w),
            AppHorzintalpadding(
              widget: Row(
                children: [
                  Icon(
                    Ionicons.location_outline,
                    color: Colors.black.withOpacity(.60),
                    size: 15.sp,
                  ),
                  SizedBox(
                    width: 1.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.5.sp),
                    child: Text(widget.homeCare.location!,
                        style: TextStyle(
                            color: Colors.black.withOpacity(.60),
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              hzPading: 10.w,
            ),
            SizedBox(
              height: 20.sp,
            )
          ],
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
