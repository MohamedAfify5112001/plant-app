import 'package:plant_app/domain/plants_model.dart';
import 'package:plant_app/domain/seeds_model.dart';
import 'package:plant_app/domain/tools_model.dart';

class Blog {
  List<PlantsData>? plants;
  List<Seed>? seeds;
  List<Tool>? tools;

  Blog.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = [];
      json['plants'].forEach((v) {
        plants!.add(PlantsData.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = [];
      json['seeds'].forEach((v) {
        seeds!.add(Seed.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = [];
      json['tools'].forEach((v) {
        tools!.add(Tool.fromJson(v));
      });
    }
  }
}
