import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hakim/screens/HospitalScreens/HospitalDesScreen.dart';
import 'package:hakim/screens/providers/hospitalProvider.dart';
import 'package:hakim/screens/widget/hakimLoadingIndicator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../consts/HakimColors.dart';
import '../../consts/networkConst.dart';
import '../../models/Hospital.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({super.key});

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  void initState() {
    getHospitals();
    // TODO: implement initState
    super.initState();
  }

  int pageNumber = 1;

  List<Hospital>? hospitals;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  getHospitals() async {
    // String cate = Provider.of<ArticlePrvider>(context, listen: false).category;

    String res = await Provider.of<HospitalProvider>(context, listen: false)
        .getHospitals(1);

    if (res == 'success') {
      // ignore: use_build_context_synchronously
      hospitals =
          Provider.of<HospitalProvider>(context, listen: false).hospitals;
      setState(() {});
    } else {
      print(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50.sp,
          backgroundColor: HakimColors.hakimPrimaryColor,
          title: const Text('المستشفيات')),
      body: hospitals != null
          ? SmartRefresher(
              onLoading: _onLoading,
              enablePullUp: true,
              enablePullDown: false,
              controller: _refreshController,
              footer: ClassicFooter(
                loadingIcon: LoadingAnimationWidget.discreteCircle(
                    color: HakimColors.hakimPrimaryColor, size: 20.sp),
                canLoadingText: '',
                loadingText: "جاري التحميل",
                noDataText: 'لا توجد بيانات',
                idleText: 'إسحب لأعلى',
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15.sp),
                    Consumer<HospitalProvider>(
                        builder: (context, hospitalProv, _) {
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
                          child: HospitalCard(
                              name: hospitals![i].name!,
                              distnce: 0,
                              image: NetworkConst().photoUrl +
                                  hospitals![i].assets![0],
                              location: hospitals![i].location!,
                              description: hospitals![i].description!),
                        ));
                      }

                      return Column(
                        children: hospitalWidgets,
                      );
                    })
                  ],
                ),
              ),
            )
          : HaLoadingIndicator(),
    );
  }

  void _onLoading() async {
    pageNumber++;
    // monitor network fetch
    await Provider.of<HospitalProvider>(context, listen: false)
        .getHospitals(pageNumber);
    hospitals!.addAll(
        Provider.of<HospitalProvider>(context, listen: false).hospitals!);
    setState(() {});

    // // if failed,use loadFailed(),if no data return,use LoadNodata()
    // if (mounted) setState(() {});
    // _refreshController.loadComplete();
  }
}

class HospitalCard extends StatelessWidget {
  final String name;
  final String image;
  final String location;
  final String description;
  final double distnce;
  const HospitalCard({
    Key? key,
    required this.name,
    required this.image,
    required this.location,
    required this.description,
    required this.distnce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.w, 15.sp, 5.w, 10.sp),
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
                          Container(
                            height: 5.h,
                            child: AutoSizeText(
                              name,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xff707070),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Container(
                            height: 10.h,
                            child: Text(
                              description,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 10.sp, color: Color(0xff8E8B8B)),
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Icon(
                                    Ionicons.location_outline,
                                    size: 12.sp,
                                    color: HakimColors.hakimPrimaryColor,
                                  )),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 42.w,
                                  child: AutoSizeText(
                                    location,
                                    maxLines: 1,
                                    minFontSize: 2,
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff8E8B8B)),
                                  ),
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
                  distnce == 0
                      ? Container()
                      : Text(
                          'تبعد عنك ${distnce.toString().substring(0,4)} كيلومتر',
                          style: TextStyle(
                              color: HakimColors.hakimPrimaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                  Spacer(),
                  Container(
                      height: 4.h,
                      width: 50.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "تواصل",
                          style: TextStyle(fontSize: 11.sp),
                        ),
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
        ),
      ),
    );
  }
}
