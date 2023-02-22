import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:hakim/consts/HakimColors.dart';
import 'package:hakim/models/Ad.dart';
import 'package:hakim/screens/HospitalScreens/SearchResultSc.dart';
import 'package:hakim/screens/doctorsScreens/CategoryScreen.dart';
import 'package:hakim/screens/doctorsScreens/DoctorDesScreen.dart';
import 'package:hakim/screens/homeCareScreens/HomeCareDes.dart';
import 'package:hakim/screens/homeCareScreens/HomeCareScreen.dart';
import 'package:hakim/screens/HospitalScreens/HospitalsScreen.dart';
import 'package:hakim/screens/homePageWidget/homeCareHome.dart';
import 'package:hakim/screens/providers/HomeCareProvider.dart';
import 'package:hakim/screens/providers/adsProvider.dart';
import 'package:hakim/screens/providers/doctorsProvider.dart';
import 'package:hakim/screens/providers/hospitalProvider.dart';
import 'package:hakim/screens/widget/hakimLoadingIndicator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../consts/networkConst.dart';
import '../customeIcons.dart/icons.dart';
import '../models/Doctor.dart';
import '../models/HomeCare.dart';
import '../models/Hospital.dart';
import 'HospitalScreens/HospitalDesScreen.dart';
import 'homePageWidget/CircularImages.dart';
import 'homePageWidget/MainCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeCare>? homeCares;

  getHomeCares() async {
    // String cate = Provider.of<ArticlePrvider>(context, listen: false).category;

    String res = await Provider.of<HomeCareProvider>(context, listen: false)
        .getHomeCare(1);
    print(res);

    if (res == 'success') {
      homeCares =
          Provider.of<HomeCareProvider>(context, listen: false).homeCares;
      setState(() {});
    } else {
      print(res);
    }
  }

  List<Doctor>? doctors;

  getDoctor() async {
    // String cate = Provider.of<ArticlePrvider>(context, listen: false).category;

    String res =
        await Provider.of<DoctorsProvider>(context, listen: false).getDoctor(1);
    print(res);

    if (res == 'success') {
      // ignore: use_build_context_synchronously
      doctors = Provider.of<DoctorsProvider>(context, listen: false).doctors;
      print(doctors);
      setState(() {});
    } else {
      print(res);
    }
  }

  getHospitals() async {
    // String cate = Provider.of<ArticlePrvider>(context, listen: false).category;

    String res = await Provider.of<HospitalProvider>(context, listen: false)
        .getHospitals(1);
    print(res);

    if (res == 'success') {
      // ignore: use_build_context_synchronously
      hospitals =
          Provider.of<HospitalProvider>(context, listen: false).hospitals;
      setState(() {});
    } else {
      print(res);
    }
  }

  List<Ad>? ads;

  getAds() async {
    // String cate = Provider.of<ArticlePrvider>(context, listen: false).category;

    String res =
        await Provider.of<AdsProvider>(context, listen: false).getAds(1);
    print(res);

    if (res == 'success') {
      // ignore: use_build_context_synchronously
      ads = Provider.of<AdsProvider>(context, listen: false).ads;
      setState(() {});
    } else {
      print(res);
    }
  }

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHospitals();
    getHomeCares();
    getDoctor();
    getAds();
  }

  List<Hospital>? hospitals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: Drawer(
        width: 70.w,
        child: SafeArea(
          child: Container(
            color: HakimColors.hakimPrimaryColor,
            child: ListView(children: [
              SizedBox(
                height: 20.h,
              ),
              drawerListTile(
                title: 'المستشفيات',
                screen: Hospitals(),
              ),
              drawerListTile(
                title: 'الأطباء',
                screen: CatergoryScreen(),
              ),
              drawerListTile(
                title: 'العلاج المنزلي',
                screen: HomeCares(),
              ),
              drawerListTile(
                title: 'عن التطبيق',
                screen: CatergoryScreen(),
              ),
              drawerListTile(
                title: ' السياسات والأحكام',
                screen: CatergoryScreen(),
              ),
              drawerListTile(
                title: 'الضبط',
                screen: CatergoryScreen(),
              ),
            ]),
          ),
        ),
      ),
      body: SafeArea(
        child: hospitals != null && homeCares != null && doctors != null
            ? Container(
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
                                  Row(
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.fromLTRB(
                                            15.sp, 5.sp, 7.w, 0),
                                        icon: Icon(
                                          Ionicons.menu,
                                          size: 30.sp,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          globalKey.currentState!.openDrawer();
                                        },
                                      ),
                                      Spacer(),
                                    ],
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  height: 45.sp,
                                  child: TextField(
                                    onSubmitted: ((value) async {}),
                                    readOnly: true,
                                    onTap: (() => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchedResult()))),
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
                                              color: Color(0xffBEBEBE),
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      enabledBorder: OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: BorderSide(
                                              color: Color(0xffBEBEBE),
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      hintText: 'إبحث عن مستشفى قريبة',
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
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
                                  icon: MyFlutterApp.hospital_1607903,
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
                                          builder: (context) =>
                                              CatergoryScreen()));
                                },
                                child: HakimMainCard(
                                  title: 'الأطباء',
                                  icon: MyFlutterApp.consult_doctor_1607918,
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
                                          builder: (context) =>
                                              const HomeCares()));
                                },
                                child: HakimMainCard(
                                  title: 'العلاج المنزلي',
                                  icon: MyFlutterApp.medical_sign_1607900,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: HakimColors.greySurr,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 5.w, top: 15.sp, bottom: 15.sp, left: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  "مساحة إعلانية",
                                  style: TextStyle(
                                      color: Color(0xffBEBEBE),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Consumer<AdsProvider>(
                                  builder: (context, adProvider, _) {
                                List<Widget> adsWidgets = [];

                                if (ads != null) {
                                  for (int i = 0; i < ads!.length; i++) {
                                    if (ads![i].type == 'image') {
                                      adsWidgets.add(
                                        Image.network(
                                          NetworkConst().photoUrl +
                                              ads![i].assets![0],
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                  }
                                }
                                return Center(
                                  child: SizedBox(
                                    height: 30.h,
                                    child: ads == null
                                        ? Center(
                                            child: LoadingAnimationWidget
                                                .twoRotatingArc(
                                              color:
                                                  HakimColors.hakimPrimaryColor,
                                              size: 50,
                                            ),
                                          )
                                        : ImageSlideshow(
                                            /// Width of the [ImageSlideshow].
                                            width: double.infinity,

                                            /// Height of the [ImageSlideshow].

                                            /// The page to show when first creating the [ImageSlideshow].
                                            initialPage: 0,

                                            /// The color to paint the indicator.
                                            indicatorColor:
                                                HakimColors.hakimPrimaryColor,

                                            /// The color to paint behind th indicator.
                                            indicatorBackgroundColor:
                                                Colors.grey,

                                            /// The widgets to display in the [ImageSlideshow].
                                            /// Add the sample image file into the images folder
                                            children: adsWidgets,

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
                                );
                              })
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
                            " المستشفيات",
                            style: TextStyle(
                                color: HakimColors.MainfontColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Consumer<HospitalProvider>(
                        builder: ((context, value, child) {
                          List<Widget> hospitalWidgets = [];

                          for (int i = 0; i < hospitals!.length; i++) {
                            hospitalWidgets.add(InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HospitalDes(
                                              hospital: hospitals![i],
                                            )));
                              },
                              child: hospitalHomeCard(
                                name: hospitals![i].name!,
                                image: NetworkConst().photoUrl +
                                    hospitals![i].assets![0],
                                location: hospitals![i].location!,
                              ),
                            ));
                          }

                          return Container(
                            color: HakimColors.greySurr,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 5.w, top: 15.sp, bottom: 15.sp),
                              child: Container(
                                height: 28.w,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: hospitalWidgets,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Text(
                            "  العيادات المنزلية",
                            style: TextStyle(
                                color: HakimColors.MainfontColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Consumer<HomeCareProvider>(
                        builder: ((_, value, child) {
                          List<Widget> homeCareW = [];

                          for (int i = 0; i < homeCares!.length; i++) {
                            homeCareW.add(InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeCareDes(
                                              homeCare: homeCares![i],
                                            )));
                              },
                              child: HomeCareHome(
                                name: homeCares![i].name!,
                                image: NetworkConst().photoUrl +
                                    homeCares![i].assets![0],
                                location: homeCares![i].location!,
                              ),
                            ));
                          }

                          return Container(
                            color: HakimColors.greySurr,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 5.w, top: 15.sp, bottom: 15.sp),
                              child: Container(
                                height: 28.w,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: homeCareW,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: HakimColors.greySurr,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 5.w, top: 15.sp, bottom: 15.sp, left: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  "مساحة إعلانية",
                                  style: TextStyle(
                                      color: Color(0xffBEBEBE),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Consumer<AdsProvider>(
                                  builder: (context, adProvider, _) {
                                List<Widget> adsWidgets = [];

                                if (ads != null) {
                                  for (int i = 0; i < ads!.length; i++) {
                                    if (ads![i].type == 'video') {







                                    }
                                  }
                                }
                                return Center(
                                  child: SizedBox(
                                    height: 30.h,
                                    child: ads == null
                                        ? Center(
                                            child: LoadingAnimationWidget
                                                .twoRotatingArc(
                                              color:
                                                  HakimColors.hakimPrimaryColor,
                                              size: 50,
                                            ),
                                          )
                                        :
                                        
                                        // ads!.where((element) => element.type=="video",).toList().length!=0
                                      
                                        VideoPlayer( VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',videoPlayerOptions: VideoPlayerOptions())      ..initialize())    ),
                                );
                              })
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
                            "أبرز الأطباء",
                            style: TextStyle(
                                color: HakimColors.MainfontColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Consumer<DoctorsProvider>(builder: ((_, value, child) {
                        List<Widget> doctorsW = [];

                        for (int i = 0; i < doctors!.length; i++) {
                          doctorsW.add(InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoctorDescription(
                                            doctor: doctors![i],
                                          )));
                            },
                            child: DoctorHomeCard(
                              name: doctors![i].firstName!,
                              image: doctors![i].photo!,
                              rank: doctors![i].rank!,
                              category: doctors![i].category!,
                            ),
                          ));
                        }
                        return Container(
                          color: HakimColors.greySurr,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 5.w, top: 15.sp, bottom: 15.sp),
                            child: Container(
                              height: 23.h,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: doctorsW,
                              ),
                            ),
                          ),
                        );
                      })),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
              )
            : HaLoadingIndicator(),
      ),
    );
  }
}

class drawerListTile extends StatelessWidget {
  final String title;
  final Widget screen;
  const drawerListTile({
    Key? key,
    required this.title,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.sp),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorHomeCard extends StatelessWidget {
  final String image;
  final String category;
  final String name;

  final String rank;

  const DoctorHomeCard({
    Key? key,
    required this.image,
    required this.category,
    required this.rank,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Container(
        width: 25.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 14.h,
              width: 21.w,
              child: CircleAvatar(
                backgroundColor: HakimColors.hakimPrimaryColor,
                child: Container(
                  height: 13.h,
                  width: 20.w,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(NetworkConst().photoUrl + image),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5.sp,
            ),
            AutoSizeText(
              name,
              style: TextStyle(
                  color: Colors.black.withOpacity(.87),
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              width: 5.sp,
            ),
            Text(
              rank,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Color(0xff8E8B8B),
                  fontWeight: FontWeight.w700),
            ),
            Text(
              category,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: HakimColors.hakimPrimaryColor,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
