import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:streams/model/user_model.dart';

class UserService {
  static var _url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<UserModel>> browse() async {
    http.Response response = await http.get(_url);
    String content = response.body;
    List collection = jsonDecode(content);

    List<UserModel> _users =
        collection.map((item) => UserModel.fromJson(item)).toList();
    return _users;
  }
}
