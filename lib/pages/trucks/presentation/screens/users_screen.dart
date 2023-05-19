// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../shared/widgets/side_menu.dart';
import '../widgets/user_page.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  List<User> users = [
    const User(
        username: 'Mattias Example',
        email: 'mattias.example@example.com',
        urlAvatar: 'https://cdn-icons-png.flaticon.com/128/8932/8932030.png'),
    const User(
        username: 'German Example',
        email: 'German.example@example.com',
        urlAvatar: 'https://cdn-icons-png.flaticon.com/128/8932/8932030.png'),
    const User(
        username: 'Alan Example',
        email: 'Alan.example@example.com',
        urlAvatar: 'https://cdn-icons-png.flaticon.com/128/8932/8932030.png'),
    const User(
        username: 'Carlos Example',
        email: 'Carlos.example@example.com',
        urlAvatar: 'https://cdn-icons-png.flaticon.com/128/8932/8932030.png'),
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(user.urlAvatar),
              ),
              title: Text(user.username),
              subtitle: Text(user.email),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserPage(user: user),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}

class User {
  final String username;
  final String email;
  final String urlAvatar;

  const User({
    required this.username,
    required this.email,
    required this.urlAvatar,
  });
}
