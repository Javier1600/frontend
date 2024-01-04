// ignore_for_file: camel_case_types, file_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, prefer_void_to_null, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/uExploreCompanyProfile.dart';
import 'package:frontend/pages/homePageUser.dart';
import 'package:frontend/pages/loginUser.dart';
import 'package:frontend/pages/userPostulations.dart';
import 'package:frontend/pages/userProfile.dart';
import 'package:frontend/pages/userProfileUser.dart';
import 'package:frontend/pages/viewJobsUser.dart';
import 'package:frontend/services/company.services.dart';
import 'package:frontend/services/user.services.dart';

class ExplorePageUser extends StatefulWidget {
  User loggedUser;
  ExplorePageUser(this.loggedUser, {super.key});
  @override
  State<ExplorePageUser> createState() => _ExplorePageUserState();
}

class _ExplorePageUserState extends State<ExplorePageUser> {
  //variable que contiene todos los usuarios de la base
  late Future<List<User>> users;
  late List<User>? uList = [];
  //variable que contiene todos las companias de la base
  late Future<List<Company>> companies;
  late List<Company>? cList = [];
  @override
  void initState() {
    users = getAllUsers();
    companies = getAllCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Color.fromRGBO(1, 167, 211, 1),
          title: const Text(
            'Explorar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Container(
            color: Colors.white,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 4.0)),
                width: 200,
                height: 200,
                child: const ClipOval(
                    child: Image(
                  image: AssetImage('assets/img/hombre.png'),
                  fit: BoxFit.contain,
                )),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(1, 167, 211, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 70)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return homePageUser(widget.loggedUser);
                              }));
                            },
                            child: Text(
                              "Inicio",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(1, 167, 211, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 70)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return userProfile(widget.loggedUser);
                              }));
                            },
                            child: Text(
                              "Mi perfil",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(1, 167, 211, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 70)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return UserJobsView(widget.loggedUser);
                              }));
                            },
                            child: Text(
                              "Empleos",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(1, 167, 211, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 70)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return UserPostulations(widget.loggedUser);
                              }));
                            },
                            child: Text(
                              "Postulaciones",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(1, 167, 211, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 70)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            onPressed: () {
                              _onCloseSession(context);
                            },
                            child: Text(
                              "Cerrar sesión",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ]),
              )
            ]),
          ),
        ),
        body: FutureBuilder(
          future: users,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              uList = snapshot.data;
              return FutureBuilder(
                future: companies,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    cList = snapshot.data;
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Usuarios",
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 167, 211, 1),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.40,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children:
                                    Users(uList, widget.loggedUser, context),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Empresas",
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 167, 211, 1),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: Companies(
                                    cList, widget.loggedUser, context),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Obteniendo datos",
                          style: TextStyle(
                              color: Color.fromRGBO(1, 167, 211, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        CircularProgressIndicator(
                          color: Color.fromRGBO(1, 167, 211, 1),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Obteniendo datos",
                    style: TextStyle(
                        color: Color.fromRGBO(1, 167, 211, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  CircularProgressIndicator(
                    color: Color.fromRGBO(1, 167, 211, 1),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return homePageUser(widget.loggedUser);
    }));
    return true;
  }

  Future<bool> _onCloseSession(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("¿Está  seguro de cerrar sesión?",
                style: TextStyle(
                    color: Color.fromRGBO(226, 144, 32, 1),
                    fontWeight: FontWeight.w700)),
            backgroundColor: Colors.white70,
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                        return loginPage();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white60),
                    child: Text(
                      'Sí',
                      style: TextStyle(
                          color: Color.fromRGBO(1, 167, 211, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white60),
                    child: Text(
                      'No',
                      style: TextStyle(
                          color: Color.fromRGBO(1, 167, 211, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
    return exitApp;
  }
}

List<Widget> Users(List<User>? users, User loggedUser, context) {
  List<Widget> uRet = [];
  for (User u in users!) {
    if (u.usuario != loggedUser.usuario && u.estado != "Inactivo") {
      uRet.add(Padding(padding: EdgeInsets.all(8)));
      uRet.add(Container(
        width: MediaQuery.of(context).size.height * 0.33,
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border:
                Border.all(color: Color.fromRGBO(1, 167, 211, 1), width: 4.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(8.0, 8.0),
                  blurRadius: 15.0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 4.0)),
              width: 100,
              height: 100,
              child: const ClipOval(
                  child: Image(
                image: AssetImage('assets/img/hombre.png'),
                fit: BoxFit.contain,
              )),
            ),
            Text(
              "${u.nombre} ${u.apellido}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            IconButton(
              icon: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return userProfileUser(loggedUser, u, false, false);
                }));
              },
            ),
          ],
        ),
      ));
    }
  }
  return uRet;
}

List<Widget> Companies(List<Company>? companies, User loggedUser, context) {
  List<Widget> cRet = [];
  for (Company c in companies!) {
    if (c.estado != "Inactivo") {
      cRet.add(Padding(padding: EdgeInsets.all(8)));
      cRet.add(Container(
        width: MediaQuery.of(context).size.height * 0.33,
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border:
                Border.all(color: Color.fromRGBO(1, 167, 211, 1), width: 4.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(8.0, 8.0),
                  blurRadius: 15.0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 4.0)),
              width: 100,
              height: 100,
              child: const ClipOval(
                  child: Image(
                image: AssetImage('assets/img/empresa.png'),
                fit: BoxFit.contain,
              )),
            ),
            Text(
              c.nombreEmpresa,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            IconButton(
              icon: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return UserExploreCompanyProfile(loggedUser, c);
                }));
              },
            ),
          ],
        ),
      ));
    }
  }
  return cRet;
}
