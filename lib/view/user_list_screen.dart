import 'package:flutter/material.dart';
import 'package:streams/controller/user_manager.dart';
import 'package:streams/model/user_model.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  UserManager manager = UserManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blueGrey,
        title: Text('Practicing Streams'),
        actions: [
          StreamBuilder<int>(
            stream: manager.userCount,
            builder: (context, snapshot) {
              return Chip(
                label: Text(
                  (snapshot.data ?? 0).toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                backgroundColor: Colors.deepOrange,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: manager.userList,
          builder:
              (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
            List<UserModel> users = snapshot.data;
            return ListView.separated(
              itemCount: users.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                UserModel _user = users[index];
                return ListTile();
              },
            );
          }),
    );
  }
}
