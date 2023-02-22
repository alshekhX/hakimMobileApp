import 'package:flutter/material.dart';

import 'package:hakim/consts/HakimColors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text( 'عن التطبيق',style:TextStyle(color: HakimColors().greyText),),backgroundColor: Color(0xffF5F5F5),
      
    ),
    body: Container(color: Colors.white),
    );
  }
}