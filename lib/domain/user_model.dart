import 'package:plant_app/presentation/shared/constants/constants.dart';

class User {
  String userId;
  String firstName;
  String lastName;
  String email;
  String imageUrl;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['userId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        imageUrl: json['imageUrl'],
      );
}
