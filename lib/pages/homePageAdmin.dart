// ignore_for_file: camel_case_types, file_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, prefer_void_to_null, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/adminJobs.dart';
import 'package:frontend/pages/adminPostulations.dart';
import 'package:frontend/pages/adminProfile.dart';
import 'package:frontend/pages/adminReports.dart';
import 'package:frontend/pages/adminSchools.dart';
import 'package:frontend/pages/explorePageAdmin.dart';
import 'package:frontend/pages/loginUser.dart';

class homePageAdmin extends StatefulWidget {
  User loggedUser;
  homePageAdmin(this.loggedUser, {super.key});
  @override
  State<homePageAdmin> createState() => _homePageAdminState();
}

class _homePageAdminState extends State<homePageAdmin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.exit_to_app_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              _onBack(context);
            },
          ),
          surfaceTintColor: Colors.white,
          backgroundColor: Color.fromRGBO(1, 167, 211, 1),
          title: const Text(
            'Administración',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Center(
                child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return AdminProfile(widget.loggedUser);
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.28,
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Color.fromRGBO(1, 167, 211, 1),
                                width: 4.0),
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
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(1, 167, 211, 1),
                              ),
                              width: 100,
                              height: 100,
                              child: Image(
                                image: AssetImage('assets/img/usuario.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Mi perfil",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return AdminJobs(widget.loggedUser);
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.28,
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Color.fromRGBO(1, 167, 211, 1),
                                width: 4.0),
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
                              padding: EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(1, 167, 211, 1),
                              ),
                              width: 100,
                              height: 100,
                              child: Image(
                                image: AssetImage('assets/img/maletin.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Empleos",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return AdminPostulations(widget.loggedUser);
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.28,
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Color.fromRGBO(1, 167, 211, 1),
                                width: 4.0),
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
                              padding: EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(1, 167, 211, 1),
                              ),
                              width: 100,
                              height: 100,
                              child: Image(
                                image: AssetImage('assets/img/pregunta.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Postulaciones",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return ExplorePageAdmin(widget.loggedUser);
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.28,
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Color.fromRGBO(1, 167, 211, 1),
                                width: 4.0),
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
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(1, 167, 211, 1),
                              ),
                              width: 100,
                              height: 100,
                              child: Image(
                                image:
                                    AssetImage('assets/img/grupoUsuarios.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Explorar",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return AdminSchools(
                            widget.loggedUser,
                          );
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.28,
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Color.fromRGBO(1, 167, 211, 1),
                                width: 4.0),
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
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(1, 167, 211, 1),
                              ),
                              width: 100,
                              height: 100,
                              child: Image(
                                image: AssetImage('assets/img/graduacion.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Instituciones",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return AdminReports(
                            widget.loggedUser,
                          );
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.28,
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Color.fromRGBO(1, 167, 211, 1),
                                width: 4.0),
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
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(1, 167, 211, 1),
                              ),
                              width: 100,
                              height: 100,
                              child: Image(
                                image: AssetImage('assets/img/reportes.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Reportes",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onBack(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.28,
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Color.fromRGBO(1, 167, 211, 1),
                                width: 4.0),
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
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(226, 144, 32, 1),
                              ),
                              width: 100,
                              height: 100,
                              child: Image(
                                image:
                                    AssetImage('assets/img/cerrarSesion.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Cerrar sesión",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
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
