// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, prefer_void_to_null

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/schools.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/addSchool.dart';
import 'package:frontend/pages/adminPostulations.dart';
import 'package:frontend/pages/adminProfile.dart';
import 'package:frontend/pages/editSchool.dart';
import 'package:frontend/pages/explorePageAdmin.dart';
import 'package:frontend/pages/homePageAdmin.dart';
import 'package:frontend/pages/loginUser.dart';
import 'package:frontend/pages/viewJobsUser.dart';
import 'package:frontend/services/schools.services.dart';

class AdminSchools extends StatefulWidget {
  User loggedUser;

  AdminSchools(this.loggedUser, {super.key});

  @override
  State<AdminSchools> createState() => _AdminSchoolsState();
}

class _AdminSchoolsState extends State<AdminSchools> {
  //Variable que contiene todos los certificados registrados del usuario de la base
  late Future<List<School>> schools;
  //Variable para iterar la lista de usuarios de la base
  List<School>? sList = [];

  @override
  void initState() {
    schools = getAllSchools();
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(1, 167, 211, 1)),
                          minimumSize: MaterialStateProperty.all(Size(200, 70)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return homePageAdmin(widget.loggedUser);
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(1, 167, 211, 1)),
                          minimumSize: MaterialStateProperty.all(Size(200, 70)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return AdminProfile(widget.loggedUser);
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(1, 167, 211, 1)),
                          minimumSize: MaterialStateProperty.all(Size(200, 70)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(1, 167, 211, 1)),
                          minimumSize: MaterialStateProperty.all(Size(200, 70)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return AdminPostulations(widget.loggedUser);
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(1, 167, 211, 1)),
                          minimumSize: MaterialStateProperty.all(Size(200, 70)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return ExplorePageAdmin(widget.loggedUser);
                        }));
                      },
                      child: Text(
                        "Explorar",
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(1, 167, 211, 1)),
                          minimumSize: MaterialStateProperty.all(Size(200, 70)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)))),
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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 167, 211, 1),
        title: const Text(
          'Instituciones',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(children: [
            FutureBuilder(
              future: schools,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  sList = snapshot.data;
                  return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                  child: Column(
                                children:
                                    Schools(sList, context, widget.loggedUser),
                              )))));
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
          ]),
        ),
      ),
    );
  }

  _onCloseSession(BuildContext context) {
    showDialog(
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
  }
}

List<Widget> Schools(
    List<School>? schools, BuildContext context, User loggedUser) {
  List<Widget> cRet = [];
  cRet.add(Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return AddSchool(loggedUser, loggedUser, false, false, true);
                }));
              },
              child: Text(
                'Agregar',
                style: TextStyle(
                    color: Color.fromRGBO(1, 167, 211, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            )
          ],
        ),
        Padding(padding: EdgeInsetsDirectional.all(8))
      ],
    ),
  ));
  if (schools != null) {
    for (School school in schools) {
      cRet.add(Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: school.estado == "Activo" ? Colors.white : Colors.black12,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(8.0, 8.0),
                  blurRadius: 15.0)
            ]),
        child: Column(
          children: [
            Text(
              '${school.nombreInstitucion}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.clip),
              maxLines: 3,
            ),
            Container(
                alignment: Alignment.topCenter,
                child: Text(
                  '${school.ubicacion}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      overflow: TextOverflow.clip),
                  maxLines: 4,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit_square,
                    color: Colors.black54,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return EditSchool(loggedUser, school);
                    }));
                  },
                ),
                school.estado == "Activo"
                    ? IconButton(
                        icon: Icon(
                          Icons.lock_outline_sharp,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      "Se inhabilitará esta institución!",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(226, 144, 32, 1),
                                          fontWeight: FontWeight.w700)),
                                  content: Text(
                                      "¿Está seguro de inhabilitar esta institución?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                  backgroundColor: Colors.white70,
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Institución inhabilitada",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "Se ha inhabilitado la institución",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      School updatedSchool = School(
                                                          id: school.id,
                                                          nombreInstitucion: school
                                                              .nombreInstitucion,
                                                          ubicacion:
                                                              school.ubicacion,
                                                          estado: "Inactivo",
                                                          v: 0);
                                                      editSchool(updatedSchool);
                                                      Timer(
                                                          Duration(seconds: 2),
                                                          () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute<
                                                                    void>(
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                          return AdminSchools(
                                                              loggedUser);
                                                        }));
                                                      });
                                                    },
                                                    child: Text(
                                                      'Aceptar',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              1, 167, 211, 1),
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white70),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Text(
                                        'Sí',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70),
                                    ),
                                  ],
                                );
                              });
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.lock_open_outlined,
                          color: Colors.green,
                          size: 30,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Se habilitará esta institución!",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(226, 144, 32, 1),
                                          fontWeight: FontWeight.w700)),
                                  content: Text(
                                      "¿Está seguro de habilitar esta institución?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                  backgroundColor: Colors.white70,
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Institución habilitada",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "Se ha habilitado la institución",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      School updatedSchool = School(
                                                          id: school.id,
                                                          nombreInstitucion: school
                                                              .nombreInstitucion,
                                                          ubicacion:
                                                              school.ubicacion,
                                                          estado: "Activo",
                                                          v: 0);
                                                      editSchool(updatedSchool);
                                                      Timer(
                                                          Duration(seconds: 2),
                                                          () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute<
                                                                    void>(
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                          return AdminSchools(
                                                              loggedUser);
                                                        }));
                                                      });
                                                    },
                                                    child: Text(
                                                      'Aceptar',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              1, 167, 211, 1),
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white70),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Text(
                                        'Sí',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
              ],
            ),
          ],
        ),
      ));
      cRet.add(Padding(padding: EdgeInsets.only(top: 10)));
    }
  }
  return cRet;
}
