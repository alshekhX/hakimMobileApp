import 'package:flutter/widgets.dart';
import 'package:hakim/customeIcons.dart/icons.dart';

class DocCategory {
  final String category;
  final IconData categoryIcon;

  DocCategory(this.category, this.categoryIcon);

 static List<DocCategory> carEngineList = [
    DocCategory("الجهاز الهضمي", MyFlutterApp.stomach_care_1607886),
    DocCategory("العظام والمفاصل",MyFlutterApp.joint_care_1607902),
    DocCategory("الكبد", MyFlutterApp.medical_sign_1607900),
    DocCategory("القلب", MyFlutterApp.heart_care_1607906),
    DocCategory('الكلى', MyFlutterApp.respiratory_care_1607889),
    DocCategory('أمراض الدم', MyFlutterApp.full_body_checkup_1607910),
    DocCategory('الأطفال', MyFlutterApp.medicine_1607897),
    DocCategory('نساء وتوليد',MyFlutterApp.protection_1607891),
    DocCategory('الصحة النفسية',MyFlutterApp.consult_doctor_1607918),
        DocCategory('الجهاز التناسلي',MyFlutterApp.sexual_wellness_1607888),

    
  ];
}
