import '../presentation/shared/constants/constants.dart';

class PlantsData {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  PlantsData(
      {this.plantId,
      this.name,
      this.description,
      this.imageUrl,
      this.waterCapacity,
      this.sunLight,
      this.temperature});

  factory PlantsData.fromJson(Map<String, dynamic> json) => PlantsData(
        plantId: json['plantId'],
        name: json['name'],
        description: json['description'],
        imageUrl: AppConstants.BASEURL + json['imageUrl'],
        waterCapacity: json['waterCapacity'],
        sunLight: json['sunLight'],
        temperature: json['temperature'],
      );
}
