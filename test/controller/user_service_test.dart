import 'package:flutter_test/flutter_test.dart';
import 'package:streams/controller/user_service.dart';
import 'package:streams/model/user_model.dart';

main() {
  test(
    'testing api conection - return a list of users',
    () async {
      List<UserModel> users = await UserService.browse();
      expect(users[0].name, 'Leanne Graham');
    },
  );
}
