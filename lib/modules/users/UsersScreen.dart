import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';
class UsersScreen extends StatelessWidget {
  List<UserModel> Users=[
    UserModel(
      id:1 ,
      name: 'Sara',
      phone: '+2083898509',
    ),
    UserModel(
      id: 2,
      name: 'Ahmed',
      phone: '+2083898509',
    ),
    UserModel(
      id: 3,
      name: 'mohamed',
      phone: '+2083898509',
    ),
    UserModel(
      id: 4,
      name: 'Amr',
      phone: '+2083898509',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index) => buildUsersItem(Users[index]),
          separatorBuilder: (context,index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 10,
            ),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          itemCount: Users.length,
      ),
    );
  }
  Widget buildUsersItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(18.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
