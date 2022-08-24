import 'package:plant_app/presentation/shared/constants/constants.dart';

class Seed {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Seed({this.seedId, this.name, this.description, this.imageUrl});

  factory Seed.fromJson(Map<String, dynamic> json) => Seed(
        seedId: json['seedId'],
        name: json['name'],
        description: json['description'],
        imageUrl: AppConstants.BASEURL + json['imageUrl'],
      );
}
