import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hakim/models/Ad.dart';

import '../../consts/networkConst.dart';

class AdsProvider with ChangeNotifier {
  List<Ad>? ads;

  final options = NetworkConst().options;

  getAds(int i) async {
    try {
      Dio dio = Dio(options);

      Response response = await dio
          .get("/api/v1/ad", queryParameters: {"page": i, "limit": 3});
      if (response.statusCode == 200) {
        final map = response.data['data'];

        ads = map.map((i) => Ad.fromMap(i)).toList().cast<Ad>();

        notifyListeners();
        return 'success';
      } else {
        print(response.data.toString());
        return response.data.toString();
      }
    } catch (e) {
      print(e);

      return e.toString();
    }
  }

  // searchHospitals(int i, String name) async {
  //   try {
  //     Dio dio = Dio(options);
  //  var regex = "regex";
  //     var optionss = "options";
  //     Response response = await dio
  //         .get("/api/v1/hospital", queryParameters: {"page": i, "limit": 8,
  //          'name': {'\$$regex': name, "\$$optionss": 'i'}});
  //     if (response.statusCode == 200) {
  //       final map = response.data['data'];

  //       searchedHospitals =
  //           map.map((i) => Hospital.fromJson(i)).toList().cast<Hospital>();

  //       notifyListeners();
  //       return 'success';
  //     } else {
  //       print(response.data.toString());
  //       return response.data.toString();
  //     }
  //   } catch (e) {
  //             print(e);

  //     return e.toString();
  //   }
  // }

//   getNearHospitals() async {
//     try {
//       Dio dio = Dio(options);

//       Response response = await dio
//           .get("/api/v1/hospital/near");
//       if (response.statusCode == 200) {
//         final map = response.data['data'];

//         hospitals =
//             map.map((i) => Hospital.fromJson(i)).toList().cast<Hospital>();

//         notifyListeners();
//         return 'success';
//       } else {
//         print(response.data.toString());
//         return response.data.toString();
//       }
//     } catch (e) {
//               print(e);

//       return e.toString();
//     }
//   }
// }

}
