import 'package:flutter/material.dart';
import 'package:hakim/screens/homePage.dart';
import 'package:sizer/sizer.dart';

import '../../consts/HakimColors.dart';
import 'package:ionicons/ionicons.dart';



class ReusableWidgets {
  static getAppBar(String title,bool center, BuildContext context) {

    return  AppBar(
          toolbarHeight: 50.sp,
          centerTitle: center,
          backgroundColor: HakimColors.hakimPrimaryColor,
          title:  Text(title));}
       
  
}