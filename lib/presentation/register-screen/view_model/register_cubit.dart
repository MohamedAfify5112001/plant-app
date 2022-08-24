import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:plant_app/data/network/dio_helper.dart';
import 'package:plant_app/data/request/request.dart';

import '../../../application/local-storage/prefs.dart';
import '../../../data/response/response.dart';
import '../../shared/constants/constants.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> signup(RegisterRequest request) async {
    emit(RegisterLoading());
    try {
      Response res = await DioHelper.postData(
          path: AppConstants.ENDPOINTSIGNUP, data: request.toJson());
      if (res.statusCode == 200) {
        final ResponseData responseRegister = ResponseData.formJson(res.data);
        CacheHelper.putValue(
            key: "token", val: res.data["data"]["accessToken"].toString());
        print(CacheHelper.getValue(key: "token"));
        emit(RegisterSuccess(responseRegister));
      }
    } on DioError catch (e) {
      print("ERROR ${e.message}");
      emit(RegisterError());
    }
  }
}
