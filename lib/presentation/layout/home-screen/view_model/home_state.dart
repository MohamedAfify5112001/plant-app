part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeChipsCategory extends HomeState {}

class IncrementState extends HomeState {}

class DecrementState extends HomeState {}

class GetPlantsSuccessState extends HomeState {
  List<PlantsData> plants;

  GetPlantsSuccessState(this.plants);
}

class GetPlantsErrorState extends HomeState {}

class GetPlantsLoadingState extends HomeState {}

class GetSeedsSuccessState extends HomeState {
  List<Seed> seeds;

  GetSeedsSuccessState(this.seeds);
}

class GetSeedsErrorState extends HomeState {}

class GetSeedsLoadingState extends HomeState {}

class GetToolsSuccessState extends HomeState {
  List<Tool> tools;

  GetToolsSuccessState(this.tools);
}

class GetToolsErrorState extends HomeState {}

class GetToolsLoadingState extends HomeState {}
