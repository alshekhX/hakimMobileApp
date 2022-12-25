import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hakim/models/Doctor.dart';
import 'package:hakim/models/HomeCare.dart';

class HomeCareProvider with ChangeNotifier {
  List<HomeCare>? homeCares;

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

  getHomeCare(int i) async {
    // try {
    Dio dio = Dio(options);

    Response response =
        await dio.get("/api/v1/homecare", queryParameters: {"page": i, "limit": 8});
    if (response.statusCode == 200) {
      final map = response.data['data'];

      homeCares = map.map((i) => HomeCare.fromJson(i)).toList().cast<HomeCare>();

      print(homeCares![0].name);
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
