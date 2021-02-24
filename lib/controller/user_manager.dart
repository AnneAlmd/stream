import 'dart:async';

import 'package:streams/controller/user_service.dart';
import 'package:streams/model/user_model.dart';

class UserManager {
  Stream<List<UserModel>> get userList async* {
    yield await UserService.browse();
  }

  final StreamController<int> _userCount = StreamController();

  UserManager() {
    userList.listen(
      (list) => _userCount.add(list.length),
    );
  }
  Stream<int> get userCount => _userCount.stream;
}
