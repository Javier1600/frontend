// ignore_for_file: camel_case_types, file_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/services/company.services.dart';
import 'package:frontend/services/user.services.dart';

class homePageUser extends StatefulWidget {
  User loggedUser;
  homePageUser(this.loggedUser, {super.key});
  @override
  State<homePageUser> createState() => _homePageUserState();
}

class _homePageUserState extends State<homePageUser> {
  late Future<List<User>> users;
  late Future<List<Company>> companies;
  late List<User>? uList = [];
  late List<Company>? cList = [];
  late String imgRoute = '';
  @override
  void initState() {
    UserSex();
    users = getAllUsers();
    companies = getAllCompanies();
    super.initState();
  }

  void UserSex() {
    imgRoute = 'assets/img/${widget.loggedUser.sexo}.png';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                width: 200,
                height: 200,
                child: const ClipOval(
                    child: Image(
                  image: AssetImage('assets/img/hombre.png'),
                  fit: BoxFit.contain,
                )),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                    '${widget.loggedUser.nombre} ${widget.loggedUser.apellido}'),
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
              uList = snapshot.data;
              return FutureBuilder(
                future: companies,
                builder: (context, snapshot) {
                  cList = snapshot.data;
                  return Container();
                },
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
