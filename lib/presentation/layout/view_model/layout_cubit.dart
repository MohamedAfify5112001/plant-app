import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/presentation/layout/blog-screen/view/blog_screen.dart';
import 'package:plant_app/presentation/layout/home-screen/view/home_screen.dart';
import 'package:plant_app/presentation/layout/notification-screen/view/notification_screen.dart';
import 'package:plant_app/presentation/layout/scanner-screen/view/scanner_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  List<Widget> screens = [
    const HomeScreen(),
    const NotificationScreen(),
  ];

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currIndex = 0;

  void changeIndex(int index) {
    currIndex = index;
    emit(ChangeIndexState());
  }
}
