import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hakim/models/Doctor.dart';

import '../../consts/networkConst.dart';

class DoctorsProvider with ChangeNotifier {
  List<Doctor>? doctors;
  final options = NetworkConst().options;


  getDoctor(int i) async {
    // try {
    Dio dio = Dio(options);

    Response response =
        await dio.get("/api/v1/doctor", queryParameters: {"page": i, "limit": 8});
    if (response.statusCode == 200) {
      final map = response.data['data'];

      doctors = map.map((i) => Doctor.fromJson(i)).toList().cast<Doctor>();

      print(map);
      notifyListeners();
      return 'success';
    } else {
      return response.data.toString();
    }
    // } catch (e) {
    //   return e.toString();
    // }
  }

  getCatDoctors(int i ,String category) async {
    // try {
    Dio dio = Dio(options);

    Response response =
        await dio.get("/api/v1/doctor", queryParameters: {"page": i, "limit": 8,"category":category});
    if (response.statusCode == 200) {
      final map = response.data['data'];

      doctors = map.map((i) => Doctor.fromJson(i)).toList().cast<Doctor>();

      print(map);
      notifyListeners();
      return 'success';
    } else {
      return response.data.toString();
    }
    // } catch (e) {
    //   return e.toString();
    // }
  }

  
}
