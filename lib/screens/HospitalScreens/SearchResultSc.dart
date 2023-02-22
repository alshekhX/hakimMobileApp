import 'package:flutter/material.dart';
import 'package:hakim/consts/HakimColors.dart';
import 'package:hakim/consts/networkConst.dart';
import 'package:hakim/screens/HospitalScreens/HospitalDesScreen.dart';
import 'package:hakim/screens/HospitalScreens/HospitalsScreen.dart';
import 'package:hakim/screens/homePage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../models/Hospital.dart';
import '../providers/hospitalProvider.dart';
import '../widget/hakimLoadingIndicator.dart';

class SearchedResult extends StatefulWidget {
  const SearchedResult({super.key});

  @override
  State<SearchedResult> createState() => _SearchedResultState();
}

class _SearchedResultState extends State<SearchedResult> {
  @override
  void initState() {
    getHospitals();
    // TODO: implement initState
    super.initState();
  }

  int pageNumber = 1;
  TextEditingController searchC = TextEditingController();

  List<Hospital>? hospitals;
  List<Hospital>? searchedHospitals;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  getHospitals() async {
    // String cate = Provider.of<ArticlePrvider>(context, listen: false).category;

    String res = await Provider.of<HospitalProvider>(context, listen: false)
        .getNearHospitals();

    if (res == 'success') {
      // ignore: use_build_context_synchronously
      hospitals =
          Provider.of<HospitalProvider>(context, listen: false).hospitals;
      print(hospitals);
      setState(() {});
    } else {
      print(res);
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 15.sp),
                        Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 75.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              height: 45.sp,
                              child: TextField(
                                controller: searchC,
                                onSubmitted: ((value) async {
                                  CustomProgressDialog progressDialog =
                                      CustomProgressDialog(context,
                                          blur: 10,
                                          loadingWidget: HaLoadingIndicator());

                                  progressDialog.show();
                                  String res =
                                      await Provider.of<HospitalProvider>(
                                              context,
                                              listen: false)
                                          .searchHospitals(1, searchC.text);
                                  progressDialog.dismiss();

                                  if (res == 'success') {
                                    searchedHospitals =
                                        Provider.of<HospitalProvider>(context,
                                                listen: false)
                                            .searchedHospitals;

                                    setState(() {});
                                  } else {
                                    progressDialog.dismiss();

                                    await NAlertDialog(
                                      title: Text("خطأ",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xff707070),
                                              fontWeight: FontWeight.w600)),
                                      dialogStyle:
                                          DialogStyle(titleDivider: true),
                                      content: Text(
                                          "تأكد من تشغيل البيانات وحاول مجددا",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xff707070),
                                              fontWeight: FontWeight.w600)),
                                      actions: <Widget>[
                                        TextButton(
                                            child: const Text("إغلاق"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                      ],
                                    ).show(context);
                                  }
                                }),
cursorColor: HakimColors.hakimPrimaryColor.withOpacity(.8),
                                // onTap:  (() => Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchedResult()))),
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
                                  hintText: 'إبحث عن مستشفى',
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              child: Padding(
                                padding:  EdgeInsets.all(5.sp),
                                child: Icon(Ionicons.arrow_back),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage())),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 15.sp),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: searchedHospitals == null
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'الأقرب إليك',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w800,
                                        color: HakimColors.MainfontColor),
                                  ))
                              : SizedBox(
                                  child: Row(
                                    children: [
                                      Text(
                                        ' نتائج البحث',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w800,
                                            color: HakimColors.MainfontColor),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          searchedHospitals = null;
                                          setState(() {});
                                        },
                                        child: Text(
                                          ' عودة إلى الأقرب',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black
                                                  .withOpacity(.60)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ),
                        SizedBox(height: 15.sp),
                        searchedHospitals == null
                            ? Consumer<HospitalProvider>(
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
                                        image: NetworkConst().photoUrl +
                                            hospitals![i].assets![0],
                                        distnce: hospitals![i].distance!,
                                        location: hospitals![i].location!,
                                        description:
                                            hospitals![i].description!),
                                  ));
                                }

                                return Column(
                                  children: hospitalWidgets,
                                );
                              })
                            : Consumer<HospitalProvider>(
                                builder: (context, hospitalProv, _) {
                                List<Widget> hospitalWidgets = [];

                                for (int i = 0;
                                    i < searchedHospitals!.length;
                                    i++) {
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
                                        name: searchedHospitals![i].name!,
                                        image: NetworkConst().photoUrl +
                                            searchedHospitals![i].assets![0],
                                        distnce: 0,
                                        location:
                                            searchedHospitals![i].location!,
                                        description:
                                            searchedHospitals![i].description!),
                                  ));
                                }

                                return Column(
                                  children: hospitalWidgets,
                                );
                              })
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                color: HakimColors.hakimPrimaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          'جاري البحث',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        LoadingAnimationWidget.bouncingBall(
                            color: Colors.white, size: 20.sp),
                        Spacer()
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    SizedBox(
                        child: Center(
                            child: Lottie.asset('assets/loading.json',
                                width: 200.sp))),
                  ],
                ),
              ));
  }
}
