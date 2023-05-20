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
      urlAvatar: 'https://cdn-icons-png.flaticon.com/128/8932/8932030.png',
    ),
    const User(
      username: 'German Example',
      email: 'German.example@example.com',
      urlAvatar: 'https://cdn-icons-png.flaticon.com/128/8932/8932030.png',
    ),
    const User(
      username: 'Alan Example',
      email: 'Alan.example@example.com',
      urlAvatar: 'https://cdn-icons-png.flaticon.com/128/8932/8932030.png',
    ),
    const User(
      username: 'Carlos Example',
      email: 'Carlos.example@example.com',
      urlAvatar: 'https://cdn-icons-png.flaticon.com/128/8932/8932030.png',
    ),
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<User> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = List.from(users);
  }

  void filterUsers(String query) {
    setState(() {
      filteredUsers = users
          .where((user) =>
              user.username.toLowerCase().contains(query.toLowerCase()) ||
              user.email.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: UserSearchDelegate(filterUsers: filterUsers),
              );
            },
            icon: const Icon(Icons.search_rounded),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          final user = filteredUsers[index];
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

class UserSearchDelegate extends SearchDelegate<String> {
  final Function(String) filterUsers;

  UserSearchDelegate({required this.filterUsers});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(); // Placeholder, replace with your search results
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            filterUsers(suggestion);
            close(context, suggestion);
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  bool get isClosed => query.isEmpty;

  List<String> get suggestions => [
        'Mattias Example',
        'German Example',
        'Alan Example',
        'Carlos Example',
      ]
          .where((user) => user.toLowerCase().contains(query.toLowerCase()))
          .toList();
}
