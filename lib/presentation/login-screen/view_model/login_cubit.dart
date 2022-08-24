import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_app/application/local-storage/prefs.dart';
import 'package:plant_app/data/request/request.dart';

import '../../../data/network/dio_helper.dart';
import '../../../data/response/response.dart';
import '../../shared/constants/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final $GoogleLogin = GoogleSignIn();

  Future<void> signIn(LoginRequest request) async {
    emit(LoginLoading());
    try {
      Response res = await DioHelper.postData(
          path: AppConstants.ENDPOINTLOGIN, data: request.toJson());
      if (res.statusCode == 200) {
        final responseLogin = ResponseData.formJson(res.data);
        CacheHelper.putValue(
            key: "token", val: res.data["data"]["accessToken"].toString());
        print(CacheHelper.getValue(key: "token"));
        emit(LoginSuccess(responseLogin));
      }
    } on DioError catch (e) {
      print("ERROR ${e.message}");
      emit(LoginError(ErrorResponse(AppConstants.invalidRes)));
    }
  }

  Future<void> googleLogin() async {
    try {
      final userGoogle = await $GoogleLogin.signIn();
      if (userGoogle == null) return;
      final googleAuth = await userGoogle.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final GoogleRegister googleReg = GoogleRegister(
        firstName: userCredential.user!.displayName!.split(" ")[0],
        lastName: userCredential.user!.displayName!.split(" ")[1],
        email: userCredential.user!.email ?? "",
        img: userCredential.user!.photoURL ?? "",
        id: userCredential.user!.uid,
      );
      print("MY IMAGE => ${userCredential.user!.photoURL}");
      Response res = await DioHelper.postData(
          path: AppConstants.ENDPOINTGOOGLE, data: googleReg.toJsonGoogle());
      if (res.statusCode == 200) {
        CacheHelper.putValue(
            key: "token", val: res.data["data"]["accessToken"].toString());
      }
      emit(GoogleSignInSuccessState());
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }
}
