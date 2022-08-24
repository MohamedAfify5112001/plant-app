import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/data/request/request.dart';
import 'package:plant_app/presentation/shared/constants/constants.dart';

import '../../../application/local-storage/prefs.dart';
import '../../../data/network/dio_helper.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());

  late Uint8List bytes;
  String? img64;

  Future<void> getImage() async {
    var picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    if (image.path.isEmpty == false) {
      bytes = File(image.path).readAsBytesSync();
      img64 = base64Encode(bytes);
      print('IMAGE  => $img64');
      emit(InitializeImage());
    }
  }

  void createPost({required String description, required String title}) async
  {
    emit(AddPostLoading());
    print('IMAGE  => $img64');
    try {
      PostRequest postRequest = PostRequest(
          description: description,
          title: title,
          img: (img64 ?? ""));
      Response res = await DioHelper.postData(
          path: AppConstants.ENDPOINTFORUMS,
          data: postRequest.toJson(),
          token: CacheHelper.getValue(key: "token"));
      if (res.statusCode == 200) {
        emit(AddPostSuccess());
      }
    } catch (e) {
      print('Error => ${e.toString()}');
      emit(AddPostError());
    }
  }
}
