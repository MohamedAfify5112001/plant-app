part of 'add_post_cubit.dart';

abstract class AddPostState {}

class AddPostInitial extends AddPostState {}

class AddPostLoading extends AddPostState{}
class AddPostSuccess extends AddPostState{}
class AddPostError extends AddPostState{}

class InitializeImage extends AddPostState{}
