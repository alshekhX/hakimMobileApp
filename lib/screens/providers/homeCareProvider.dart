import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hakim/models/Doctor.dart';
import 'package:hakim/models/HomeCare.dart';

import '../../consts/networkConst.dart';

class HomeCareProvider with ChangeNotifier {
  List<HomeCare>? homeCares;
  final options = NetworkConst().options;


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
