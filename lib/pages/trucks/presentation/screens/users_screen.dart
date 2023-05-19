// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import '../../../shared/widgets/side_menu.dart';
import '../widgets/user_page.dart';

// class ListUsers extends StatefulWidget {
//   const ListUsers({super.key});

//   @override
//   State<ListUsers> createState() => _ListUsersState();
// }

// class _ListUsersState extends State<ListUsers> {
//   TextEditingController textController = TextEditingController();
//   List<UserModel> usersTotal = [];
//   List<UserModel> users = [];

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   void init() async {
//     String urlUser = 'https://cdn-icons-png.flaticon.com/128/8932/8932030.png';
//     String urlUserNoExist =
//         'https://cdn-icons-png.flaticon.com/128/8932/8932030.png';

//     final list = [
//       UserModel(image: urlUserNoExist, name: 'Ethan Frost'),
//       UserModel(image: urlUser, name: 'Olivia Blake'),
//       UserModel(image: urlUser, name: 'Mason Sullivan'),
//       UserModel(image: urlUser, name: 'Ava Montgomery'),
//       UserModel(image: urlUser, name: 'Noah Anderson'),
//       UserModel(image: urlUser, name: 'Isabella Knight'),
//       UserModel(image: urlUser, name: 'Liam Donovan'),
//       UserModel(image: urlUser, name: 'Sophia Parker'),
//       UserModel(image: urlUser, name: 'Lucas Bennett'),
//       UserModel(image: urlUser, name: 'Mia Reynolds'),
//       UserModel(image: urlUser, name: 'Benjamin Hayes'),
//       UserModel(image: urlUser, name: 'Charlotte Mitchell'),
//       UserModel(image: urlUser, name: 'Henry Foster'),
//       UserModel(image: urlUser, name: 'Amelia Collins'),
//       UserModel(image: urlUser, name: 'Samuel Richardson'),
//     ];

//     setState(() {
//       usersTotal = list;
//     });
//   }

//   Future<bool> validateImageUrl(String image) async {
//     try {
//       final response = await http.head(Uri.parse(image));
//       return response.statusCode == 200;
//     } catch (e) {
//       return false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final scaffoldKey = GlobalKey<ScaffoldState>();
//     return Scaffold(
//       drawer: SideMenu(scaffoldKey: scaffoldKey),
//       appBar: AppBar(
//         title: const Text('User List'),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15),
//             child: TextFormField(
//               controller: textController,
//               onChanged: (value) {
//                 setState(() {
//                   users = value.isEmpty
//                       ? []
//                       : usersTotal
//                           .where((element) =>
//                               element.name.contains(value.toLowerCase()))
//                           .toList();
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'nombre del usuario',
//                 hintStyle: Theme.of(context).textTheme.bodySmall,
//               ),
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               itemCount: users.length,
//               padding: const EdgeInsets.all(15),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 15,
//               ),
//               itemBuilder: (context, index) {
//                 final user = users[index];
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: FutureBuilder<bool>(
//                     future: validateImageUrl(user.image),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       } else if (snapshot.hasError || snapshot.data == false) {
//                         return Center(
//                           child: Image.asset(
//                             'assets/avatar.png',
//                             fit: BoxFit.cover,
//                           ),
//                         );
//                       } else {
//                         return Image.network(
//                           user.image,
//                           fit: BoxFit.cover,
//                         );
//                       }
//                     },
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class UserModel {
//   String image;
//   String name;
//   UserModel({
//     required this.image,
//     required this.name,
//   });
// }

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
