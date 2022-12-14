
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MedicalArticle extends StatelessWidget {
  final String image;
  const MedicalArticle({
    Key? key,required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: Container(
          clipBehavior: Clip.hardEdge,

        height: 28.w,
        width: 56.w,
        // ignore: sort_child_properties_last
        child: Image.network(image,fit: BoxFit.cover,),
        decoration: BoxDecoration(
          
            border: Border.all(width: 0,color: Colors.grey.shade100),
            borderRadius: BorderRadius.circular(17)),
      ),
    );
  }
}
