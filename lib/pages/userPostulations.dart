// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, prefer_void_to_null

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/jobs.dart';
import 'package:frontend/classes/postulations.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/homePageUser.dart';
import 'package:frontend/pages/jobDetails.dart';
import 'package:frontend/pages/loginUser.dart';
import 'package:frontend/pages/userProfile.dart';
import 'package:frontend/pages/viewJobsUser.dart';
import 'package:frontend/services/company.services.dart';
import 'package:frontend/services/jobs.services.dart';
import 'package:frontend/services/postulations.services.dart';

class UserPostulations extends StatefulWidget {
  User user;
  UserPostulations(this.user, {super.key});

  @override
  State<UserPostulations> createState() => _UserPostulationsState();
}

class _UserPostulationsState extends State<UserPostulations> {
  //Variable que contiene todos los trabajos publicados almacenados en la base
  late Future<List<Job>> jobs;
  //Variable para iterar la lista de los trabajos publicados de la base
  List<Job>? jList = [];
  //Variable que contiene las postulaciones del usuario
  late Future<List<Postulation>> userPostulations;
  //Variable para iterar las postulaciones del usario
  List<Postulation> uPList = [];
  //Variable que contiene todos los trabajos publicados almacenados en la base
  late Future<List<Company>> companies;
  //Variable para iterar la lista de los trabajos publicados de la base
  List<Company>? cList = [];

  @override
  void initState() {
    jobs = getAllJobs();
    userPostulations = getUserPostulations(widget.user.id);
    companies = getAllCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
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
                                return homePageUser(widget.user);
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
                                return userProfile(widget.user);
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
                                return UserJobsView(widget.user);
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
            'Mis postulaciones',
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
                future: jobs,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    jList = snapshot.data;
                    return FutureBuilder(
                        future: userPostulations,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            uPList = snapshot.data;
                            return FutureBuilder(
                              future: companies,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  cList = snapshot.data;
                                  return SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Container(
                                              padding: EdgeInsets.all(10),
                                              child: Container(
                                                  child: Column(
                                                children: Postulations(
                                                    jList,
                                                    uPList,
                                                    cList,
                                                    widget.user,
                                                    context),
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
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
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
                        });
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
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return homePageUser(widget.user);
    }));
    return true;
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

List<Widget> Postulations(List<Job>? jobs, List<Postulation>? userPost,
    List<Company>? companies, User user, context) {
  List<Widget> pRet = [];
  for (Postulation post in userPost!) {
    for (Job job in jobs!) {
      if (int.tryParse(job.numeroVacantes) != 0) {
        if (post.idEmpleo == job.id) {
          Company? comp;
          for (Company c in companies!) {
            if (c.id == job.idEmpresa) {
              comp = c;
            }
          }
          pRet.add(Container(
            padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(8.0, 8.0),
                      blurRadius: 15.0)
                ]),
            child: Column(
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "${job.puesto}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        color: Colors.black,
                        fontFamily: 'PlaypenSans'),
                  ),
                  TextSpan(
                    text: " (${job.modalidad})",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.black54,
                        fontFamily: 'PlaypenSans'),
                  ),
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Empresa: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.black,
                        fontFamily: 'PlaypenSans'),
                  ),
                  TextSpan(
                    text: "${comp!.nombreEmpresa}",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontFamily: 'PlaypenSans'),
                  ),
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Estado: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.black,
                        fontFamily: 'PlaypenSans'),
                  ),
                  TextSpan(
                    text: "${post.estado}",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: post.estado == 'En espera'
                            ? Color.fromRGBO(1, 167, 211, 1)
                            : post.estado == 'Aceptada'
                                ? Colors.green
                                : Colors.red,
                        fontFamily: 'PlaypenSans',
                        fontWeight: FontWeight.w700),
                  ),
                ])),
                Text(
                  'Fecha postulación:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.clip),
                  maxLines: 3,
                ),
                Text(
                  FormatoFecha(post.fechaPostulacion),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    overflow: TextOverflow.clip,
                  ),
                  maxLines: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                          return JobDetails(job);
                        }));
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Se eliminará esta postulación!",
                                    style: TextStyle(
                                        color: Color.fromRGBO(226, 144, 32, 1),
                                        fontWeight: FontWeight.w700)),
                                content: Text(
                                    "¿Está seguro de eliminar esta postulación?",
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
                                                  "Postulación eliminada",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          226, 144, 32, 1),
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              content: Text(
                                                  "Se ha eliminado la postulación",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18)),
                                              backgroundColor: Colors.white70,
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    deletePostulation(post);
                                                    Timer(Duration(seconds: 2),
                                                        () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute<
                                                                  void>(
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                        return UserPostulations(
                                                            user);
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white70),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Text(
                                      'Eliminar',
                                      style: TextStyle(
                                          color: Color.fromRGBO(1, 167, 211, 1),
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
                                          color: Color.fromRGBO(1, 167, 211, 1),
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
          pRet.add(Padding(padding: EdgeInsets.only(top: 10)));
        }
      }
    }
  }
  return pRet;
}
