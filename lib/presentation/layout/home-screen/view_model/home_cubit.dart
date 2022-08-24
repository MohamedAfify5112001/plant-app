import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/application/local-storage/prefs.dart';
import 'package:plant_app/data/network/dio_helper.dart';
import 'package:plant_app/domain/seeds_model.dart';
import 'package:plant_app/presentation/shared/constants/constants.dart';

import '../../../../domain/plants_model.dart';
import '../../../../domain/tools_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int currIndex = 0;
  int initCount = 1;

  HomeCubit() : super(HomeInitial());

  void increment() {
    initCount++;
    emit(IncrementState());
  }

  void decrement() {
    initCount--;
    emit(DecrementState());
  }

  void changeIndex(int index) {
    currIndex = index;
    emit(ChangeChipsCategory());
  }

  void getPlants() async {
    emit(GetPlantsLoadingState());
    try {
      Response res = await DioHelper.getData(
          path: AppConstants.ENDPOINTPLANTS,
          token: CacheHelper.getValue(key: "token"));
      if (res.statusCode == 200) {
        List allPlantsInfo = res.data["data"];
        List<PlantsData> plants =
            allPlantsInfo.map((e) => PlantsData.fromJson(e)).toList();
        emit(GetPlantsSuccessState(plants));
      }
    } on DioError catch (e) {
      print("Error ${e.toString()}");
      emit(GetPlantsErrorState());
    }
  }

  void getSeeds() async {
    emit(GetSeedsLoadingState());
    try {
      Response res = await DioHelper.getData(
          path: AppConstants.ENDPOINTSEEDS,
          token: CacheHelper.getValue(key: "token"));
      if (res.statusCode == 200) {
        List $Seeds = res.data["data"];
        List<Seed> seeds = $Seeds.map((e) => Seed.fromJson(e)).toList();
        emit(GetSeedsSuccessState(seeds));
      }
    } on DioError catch (e) {
      print("Error ${e.toString()}");
      emit(GetSeedsErrorState());
    }
  }

  void getTools() async {
    emit(GetToolsLoadingState());
    try {
      Response res = await DioHelper.getData(
          path: AppConstants.ENDPOINTTOOLS,
          token: CacheHelper.getValue(key: "token"));
      if (res.statusCode == 200) {
        List $Tools = res.data["data"];
        List<Tool> tools = $Tools.map((e) => Tool.fromJson(e)).toList();
        emit(GetToolsSuccessState(tools));
      }
    } on DioError catch (e) {
      print("Error ${e.toString()}");
      emit(GetToolsErrorState());
    }
  }
}
