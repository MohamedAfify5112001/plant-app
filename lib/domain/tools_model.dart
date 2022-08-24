import 'package:plant_app/presentation/shared/constants/constants.dart';

class Tool {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  Tool({this.toolId, this.name, this.description, this.imageUrl});

  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
        toolId: json['toolId'],
        name: json['name'],
        description: json['description'],
        imageUrl: AppConstants.BASEURL + json['imageUrl'],
      );
}
