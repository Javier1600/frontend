// ignore_for_file: camel_case_types, file_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, prefer_void_to_null

import 'package:flutter/material.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/userProfile.dart';

class homePageUser extends StatefulWidget {
  User loggedUser;
  homePageUser(this.loggedUser, {super.key});
  @override
  State<homePageUser> createState() => _homePageUserState();
}

class _homePageUserState extends State<homePageUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
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
            Container(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          minimumSize: MaterialStateProperty.all(Size(200, 50)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return userProfile(widget.loggedUser);
                        }));
                      },
                      child: Text(
                        "Mi perfil",
                        style: TextStyle(
                            color: Color.fromRGBO(206, 144, 32, 1),
                            fontSize: 34,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ]),
            )
          ]),
        ),
      ),
      appBar: AppBar(
        title: const Text('Resumen'),
      ),
      body: Container(),
    );
  }
}
