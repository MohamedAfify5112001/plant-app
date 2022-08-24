class RegisterRequest {
  String firstName;
  String lastName;
  String email;
  String password;

  RegisterRequest(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };
  }
}

class GoogleRegister {
  String img;
  String id;
  String firstName;
  String lastName;
  String email;

  GoogleRegister(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.img,
      required this.id});

  Map<String, dynamic> toJsonGoogle() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "picture": img
    };
  }
}

class LoginRequest {
  String email;
  String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}

class PostRequest {
  String title;
  String description;
  String img;

  PostRequest(
      {required this.description, required this.title, required this.img});

  Map<String, dynamic> toJson() {
    return {"email": title, "password": description, "imageBase64": img};
  }
}
