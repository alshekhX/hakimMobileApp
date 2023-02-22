
import 'package:flutter/material.dart';
import 'package:hakim/consts/HakimColors.dart';
import 'package:hakim/screens/homeCareScreens/HomeCareDes.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class HomeCareHome extends StatelessWidget {
  final String image;
    final String name;
  final String location;

  const HomeCareHome({
    Key? key,required this.image, required this.name, required this.location
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: Stack(
        
        children: [
          Container(
              clipBehavior: Clip.hardEdge,

            height: 28.w,
            width: 56.w,
            // ignore: sort_child_properties_last
            child: Image.network(image,fit: BoxFit.cover,),
            decoration: BoxDecoration(
              
                border: Border.all(width: 0,color: Colors.grey.shade100),
                borderRadius: BorderRadius.circular(17)),
          ),
          Positioned(
            
            bottom: 0,
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 5.sp,),

                  Row(children: [SizedBox(width: 5.w,),             Text(name,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.white),)
],),
SizedBox(height: 5.sp,),
   Row(children: [SizedBox(width:  5.w,),      Icon(Ionicons.location,size: 10,color: HakimColors.hakimPrimaryColor,),       Text(location,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700,color: Colors.white))
],),

                   
                ],
              ),
            
            decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.6),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(17),
                bottomRight: Radius.circular(17),
              )
            ),
            height:13.w,width: 56.w,))
        ],
      ),
    );
  }
}
