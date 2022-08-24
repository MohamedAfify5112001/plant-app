part of 'forums_cubit.dart';

abstract class ForumsState {}

class ForumsInitial extends ForumsState {}

class GetForumsLoading extends ForumsState {}

class GetForumsSuccess extends ForumsState {
  List<Forum> forums;

  GetForumsSuccess(this.forums);
}
class GetForumsError extends ForumsState {}

class ChangedChips extends ForumsState {}


class GetMyForumsLoading extends ForumsState {}


class GetMyForumsSuccess extends ForumsState {
  List<Forum> forums;

  GetMyForumsSuccess(this.forums);
}
class GetMyForumsError extends ForumsState {}
