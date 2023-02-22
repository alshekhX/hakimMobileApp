import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hakim/models/HomeCare.dart';
import 'package:hakim/screens/homeCareScreens/HomeCareDes.dart';
import 'package:hakim/screens/providers/HomeCareProvider.dart';
import 'package:hakim/screens/widget/hakimLoadingIndicator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../consts/HakimColors.dart';
import '../../consts/networkConst.dart';
class HomeCares extends StatefulWidget {
  const HomeCares({super.key});

  @override
  State<HomeCares> createState() => _HomeCaresState();
}

class _HomeCaresState extends State<HomeCares> {


  @override
  void initState() {
    getHomeCares();
    // TODO: implement initState
    super.initState();
  }
  int pageNumber = 1;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<HomeCare>? homeCares;

  getHomeCares() async {
    // String cate = Provider.of<ArticlePrvider>(context, listen: false).category;

    String res =
        await Provider.of<HomeCareProvider>(context, listen: false).getHomeCare(1);
              print(res);

    if (res == 'success') {
      homeCares = Provider.of<HomeCareProvider>(context, listen: false).homeCares;
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
          title: const Text('العلاج المنزلي')),
      body: homeCares!=null? SmartRefresher(
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
            children: [SizedBox(height: 15.sp),       Consumer(   builder: (context, homeCareProv, _) {
                      List<Widget> homeCareWidgets = [];
      
                      for (int i = 0; i < homeCares!.length; i++) {
                        homeCareWidgets.add(
                          InkWell(
                          onTap: () {
      
       Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeCareDes(
                                          homeCare: homeCares![i],
                                        )));
      
      
      
                          },
                          child: HomeCareCard(
                              name: homeCares![i].name!,
                              image: NetworkConst().photoUrl +homeCares![i].assets![0],
                              location: homeCares![i].location!,
                              description: homeCares![i].description!),
                        ));
                      }
      
                      return Column(
                        children: homeCareWidgets,
                      );
                    })],
          ),
        ),
      ):HaLoadingIndicator(),
    );
  }
  
  void _onLoading() async {
    pageNumber++;
    // monitor network fetch
    await Provider.of<HomeCareProvider>(context, listen: false)
        .getHomeCare(pageNumber);
    homeCares!.addAll(
        Provider.of<HomeCareProvider>(context, listen: false).homeCares!);
    setState(() {});

    // // if failed,use loadFailed(),if no data return,use LoadNodata()
    // if (mounted) setState(() {});
    // _refreshController.loadComplete();
  }
}

class HomeCareCard extends StatelessWidget {
  final String name;
  final String image;
  final String location;
  final String description;
  const HomeCareCard({
    Key? key, required this.name, required this.image, required this.location, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Container(
                color: Colors.white,

        child: Padding(
          
          padding: EdgeInsets.fromLTRB(5.w, 15.sp, 5.w, 15.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 2,color: Color(0xff00C7C7)),
                    borderRadius: BorderRadius.circular(15),
                    
                    image: DecorationImage(image: NetworkImage(
                      image,
                    ),
                                      fit: BoxFit.cover,
)
                    ),

                    height: 20.6.h,
                    width: 34.w,
                   
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
                            height: 8.h,
                            child: Text(description,
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
                                      width: 30.w,
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
                              ),
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
                            backgroundColor: HakimColors.hakimPrimaryColor,
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
