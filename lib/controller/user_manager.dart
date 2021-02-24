import 'dart:async';

import 'package:streams/controller/user_service.dart';
import 'package:streams/model/user_model.dart';

class UserManager {
  Stream<List<UserModel>> get userList async* {
    List<UserModel> list = await UserService.browse();
    for (var i = 0; i < list.length; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      yield list.sublist(0, i + 1);
    }

    //yield await UserService.browse();
  }

  final StreamController<int> _userCount = StreamController();

  UserManager() {
    userList.listen(
      (list) => _userCount.add(list.length),
    );
  }
  Stream<int> get userCount => _userCount.stream;
}
