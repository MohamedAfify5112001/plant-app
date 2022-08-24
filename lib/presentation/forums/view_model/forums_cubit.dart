import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../application/local-storage/prefs.dart';
import '../../../data/network/dio_helper.dart';
import '../../../domain/forum_model.dart';
import '../../shared/constants/constants.dart';

part 'forums_state.dart';

class ForumsCubit {
  static Future<List<Forum>> getAllForums() async {
    try {
      Response res = await DioHelper.getData(
          path: AppConstants.ENDPOINTFORUMS,
          token: CacheHelper.getValue(key: "token"));

      if (res.statusCode == 200) {
        List data = res.data['data'];
        List<Forum> forums =
            data.map((forum) => Forum.fromJson(forum)).toList();
        return forums;
      }
    } on DioError catch (e) {
      print("Error ${e.message}");
    }
    return Future.value(null);
  }

  static Future<List<Forum>> getMyForums() async {
    try {
      Response res = await DioHelper.getData(
          path: AppConstants.ENDPOINTFORUMSFORME,
          token: CacheHelper.getValue(key: "token"));

      if (res.statusCode == 200) {
        List data = res.data['data'];
        List<Forum> myForums =
            data.map((forum) => Forum.fromJson(forum)).toList();
        return myForums;
      }
    } on DioError catch (e) {
      print("Error ${e.message}");
    }
    return Future.value(null);
  }
}
