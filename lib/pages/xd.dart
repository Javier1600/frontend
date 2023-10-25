// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/services/user.services.dart';

class MyApp extends StatefulWidget {
  String idUser;

  MyApp(this.idUser, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<User>> users;
  @override
  void initState() {
    users = getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent, width: 2.0)),
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    const ClipOval(
                      child: Image(
                        image: AssetImage("assets/img/userIcon.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(widget.idUser),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.blueAccent)),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(1),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.white;
                          }
                          return Colors.black;
                        },
                      ),
                    ),
                    child: const Text(
                      "Mi perfil",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ),
            ]),
          ),
        ),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: FutureBuilder(
          future: users,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: userList(snapshot.data),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

List<Widget> userList(List<User>? data) {
  List<Widget> users = [];
  if (data != null) {
    for (var user in data) {
      users.add(Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2.0),
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  child: Text(
                      "${user.nombre.substring(0, 1)} ${user.apellido.substring(0, 1)}")),
              title: Text("${user.nombre} ${user.apellido}"),
              subtitle: Text(user.telefono),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/3722/3722014.png",
                              width: 30,
                              height: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/32/32355.png",
                              width: 30,
                              height: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/3221/3221803.png",
                              width: 30,
                              height: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ));
    }
  }
  return users;
}
