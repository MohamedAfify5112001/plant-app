import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../application/local-storage/prefs.dart';
import '../../../../data/network/dio_helper.dart';
import '../../../../domain/blog_model.dart';
import '../../../../domain/plants_model.dart';
import '../../../shared/constants/constants.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());

  void getBlogs() async {
    emit(GetPlantsBlogLoadingState());
    try {
      Response res = await DioHelper.getData(
          path: AppConstants.ENDPOINTBLOGS,
          token: CacheHelper.getValue(key: "token"));
      if (res.statusCode == 200) {
        var blogs = res.data["data"];
        Blog $Blogs = Blog.fromJson(blogs);
        emit(GetPlantsBlogSuccessState($Blogs));
      }
    } on DioError catch (e) {
      print("Error ${e.toString()}");
      emit(GetPlantsBlogErrorState());
    }
  }
}
