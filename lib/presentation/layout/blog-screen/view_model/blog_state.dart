part of 'blog_cubit.dart';

abstract class BlogState {}

class BlogInitial extends BlogState {}

class GetPlantsBlogSuccessState extends BlogState {
  Blog blog;

  GetPlantsBlogSuccessState(this.blog);
}

class GetPlantsBlogErrorState extends BlogState {}

class GetPlantsBlogLoadingState extends BlogState {}
