import 'package:flutter/material.dart';

import '../screens/users_screen.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(user.username),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.network(
                user.urlAvatar,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                user.username,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
}
