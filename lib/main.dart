import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/application/bloc_observer.dart';
import 'package:plant_app/application/local-storage/prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'application/app.dart';
import 'data/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  DioHelper.initDio();
  await CacheHelper.initPref();
  await Firebase.initializeApp();
  runApp(MyPlantApp());
}
