import 'package:ahmed/models/user/user_model.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget
{
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Ahmed Mahran',
      phone: '+2001097901402',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Mahran',
      phone: '+2001055251402',
    ),
    UserModel(
      id: 3,
      name: 'Mohamed Khaled ',
      phone: '+2001055255322',
    ),
    UserModel(
      id: 1,
      name: 'Ahmed Mahran',
      phone: '+2001097901402',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Mahran',
      phone: '+2001055251402',
    ),
    UserModel(
      id: 3,
      name: 'Mohamed Khaled ',
      phone: '+2001055255322',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Mahran',
      phone: '+2001055251402',
    ),
    UserModel(
      id: 3,
      name: 'Mohamed Khaled ',
      phone: '+2001055255322',
    ),
    UserModel(
      id: 1,
      name: 'Ahmed Mahran',
      phone: '+2001097901402',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Mahran',
      phone: '+2001055251402',
    ),
    UserModel(
      id: 3,
      name: 'Mohamed Khaled ',
      phone: '+2001055255322',
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
          itemBuilder:(context,index)=> buildUserItem(users[index]),
          separatorBuilder: (context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20.0,),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ) ,
          itemCount: users.length,
      ),
    );
  }

Widget buildUserItem(UserModel user) =>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 20.0,
        child: Text(
          '${user.id}',
          style: TextStyle(fontSize:25.0,
              fontWeight: FontWeight.bold),
        ),

      )
      , SizedBox(
        width:20.0 ,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${user.name}',
            style: TextStyle(fontSize:25.0,
                fontWeight: FontWeight.bold),
          ),
          Text('${user.phone}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      )
    ],
  ),
);
}