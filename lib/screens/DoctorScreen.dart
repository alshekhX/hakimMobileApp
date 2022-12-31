import 'package:flutter/material.dart';
import 'package:hakim/customeIcons.dart/icons.dart';
import 'package:hakim/models/Doctor.dart';
import 'package:hakim/screens/providers/doctorsProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../consts/HakimColors.dart';
import 'doctorsWidget/DoctorCard.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  void initState() {
    getDoctor();
    // TODO: implement initState
    super.initState();
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
          title: const Text('ألاطباء')

          //  Text(
          //   'الحكيم',
          //   style: GoogleFonts.tajawal(
          //       fontSize: 32.sp,
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold),
          // ),
          ),
      body:  doctors!=null?  Column(children: [
        SizedBox(height: 15.sp),
         Consumer(   builder: (context, doctorseProv, _) {



                    List<Widget> doctorsWidgets = [];

                    for (int i = 0; i < doctors!.length; i++) {
                      doctorsWidgets.add(DoctorCard(name: doctors![i].firstName! + ' ' +doctors![i].lastName!, image: doctors![i].photo!, icon: Icons.access_time_rounded, rank: doctors![i].rank!, category: doctors![i].category!));
                    }

                    return Column(
                      children: doctorsWidgets,
                    );
                  })]):Container(child: Center(child: CircularProgressIndicator()),),
    );
  }
}
