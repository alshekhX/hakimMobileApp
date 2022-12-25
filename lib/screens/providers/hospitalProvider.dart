import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hakim/models/Doctor.dart';
import 'package:hakim/models/HomeCare.dart';
import 'package:hakim/models/Hospital.dart';

class HospitalProvider with ChangeNotifier {
  List<Hospital>? hospitals;

  // ignore: unnecessary_new
  BaseOptions options = new BaseOptions(
    baseUrl: "http://192.168.43.250:9000",
    connectTimeout: 30000,
    receiveTimeout: 30000,
    contentType: 'application/json',
    validateStatus: (status) {
      return status! < 600;
    },
  );

  getHospitals(int i) async {
    // try {
    Dio dio = Dio(options);

    Response response =
        await dio.get("/api/v1/hospital", queryParameters: {"page": i, "limit": 8});
    if (response.statusCode == 200) {
      final map = response.data['data'];

      hospitals = map.map((i) => Hospital.fromJson(i)).toList().cast<Hospital>();

      print(hospitals![0].name);
      notifyListeners();
      return 'success';
    } 
    else {
      return response.data.toString();
    }
    // } catch (e) {
    //   return e.toString();
    // }
  }



  
}
