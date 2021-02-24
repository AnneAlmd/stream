class UserModel {
  final String name;
  final String email;
  final String phone;

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'];
}
