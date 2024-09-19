class User {
  final String? name;
  final String email;
  final String accessToken;

  User({this.name, required this.email, required this.accessToken});

  User.init()
      : name = "",
        email = "",
        accessToken = "";

  @override
  String toString() {
    return '''{"name":"$name","email":"$email","accessToken":"$accessToken"}''';
  }

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        email = json["email"],
        accessToken = json["accessToken"];

  Map<String, dynamic> toJson(User user) {
    return {
      "name": user.name,
      "email": user.email,
      "accessToken": user.accessToken
    };
  }
}
