import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hakim/models/Doctor.dart';

class DoctorsProvider with ChangeNotifier {
  List<Doctor>? doctors;

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

  getDoctor(int i) async {
    // try {
    Dio dio = Dio(options);

    Response response =
        await dio.get("/api/v1/doctor", queryParameters: {"page": i, "limit": 8});
    if (response.statusCode == 200) {
      final map = response.data['data'];

      doctors = map.map((i) => Doctor.fromJson(i)).toList().cast<Doctor>();

      print(doctors![0].username);
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
