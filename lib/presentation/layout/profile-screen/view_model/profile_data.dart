import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:plant_app/domain/user_model.dart';

import '../../../../application/local-storage/prefs.dart';
import '../../../../data/network/dio_helper.dart';
import '../../../shared/constants/constants.dart';

class ProfileData {
  static Future<User> getUser() async {
    try {
      Response res = await DioHelper.getData(
          path: AppConstants.ENDPOINTUSER,
          token: CacheHelper.getValue(key: "token"));
      if (res.statusCode == 200) {
        User user = User.fromJson(res.data['data']);
        return user;
      }
    } on DioError catch (e) {
      print("Error ${e.toString()}");
    }
    return Future.value(null);
  }
}
