// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, prefer_void_to_null

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/jobs.dart';
import 'package:frontend/classes/postulations.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/homePageUser.dart';
import 'package:frontend/pages/jobDetails.dart';
import 'package:frontend/pages/loginUser.dart';
import 'package:frontend/pages/userPostulations.dart';
import 'package:frontend/pages/userProfile.dart';
import 'package:frontend/services/jobs.services.dart';
import 'package:frontend/services/postulations.services.dart';

class UserJobsView extends StatefulWidget {
  User user;

  UserJobsView(this.user, {super.key});

  @override
  State<UserJobsView> createState() => _UserJobsViewState();
}

class _UserJobsViewState extends State<UserJobsView> {
  //Variable que contiene todos los trabajos publicados almacenados en la base
  late Future<List<Job>> jobs;
  //Variable para iterar la lista de los trabajos publicados de la base
  List<Job>? jList = [];
  //Variable que contiene las postulaciones del usuario
  late Future<List<Postulation>> userPostulations;
  //Variable para iterar las postulaciones del usario
  List<Postulation> uPList = [];
  @override
  void initState() {
    jobs = getAllJobs();
    userPostulations = getUserPostulations(widget.user.id);
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
                                return UserPostulations(widget.user);
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
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(1, 167, 211, 1),
          title: const Text(
            'Empleos disponibles',
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
                            return SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                            child: Column(
                                          children: Jobs(jList, uPList,
                                              widget.user, context),
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

List<Widget> Jobs(
    List<Job>? jobs, List<Postulation>? userPost, User user, context) {
  List<Widget> cRet = [];
  if (jobs != null) {
    for (Job job in jobs) {
      if (int.tryParse(job.numeroVacantes) != 0 && job.estado == "Activo") {
        cRet.add(Container(
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
                  text: "Vacantes disponibles: ",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: 'PlaypenSans'),
                ),
                TextSpan(
                  text: "${job.numeroVacantes}",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: 'PlaypenSans'),
                ),
              ])),
              Text(
                'Descripción general',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.clip),
                maxLines: 3,
              ),
              Text(
                '${job.descripcion}',
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
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Generando postulación",
                                    style: TextStyle(
                                        color: Color.fromRGBO(226, 144, 32, 1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                content: Text(
                                    "¿Desea postular al empleo ${job.puesto}?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                backgroundColor: Colors.white70,
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      bool create = true;
                                      for (Postulation p in userPost!) {
                                        if (p.idEmpleo == job.id) {
                                          create = false;
                                          break;
                                        }
                                      }
                                      if (create) {
                                        Postulation newPost = Postulation(
                                            id: '',
                                            idUsuario: user.id,
                                            idEmpleo: job.id,
                                            estado: "En espera",
                                            motivoRechazo: "",
                                            estadoPostulacion: "Activo",
                                            fechaPostulacion:
                                                DateTime.now().toLocal(),
                                            v: 0);
                                        createPostulation(newPost);
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Postulación completada",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "Se ha postulado al empleo de forma exitosa!",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute<
                                                                  void>(
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                        return UserPostulations(
                                                            user);
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Ver postulaciones',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              1, 167, 211, 1),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white70),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10)),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute<
                                                                  void>(
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                        return UserJobsView(
                                                            user);
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Seguir postulando',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              1, 167, 211, 1),
                                                          fontSize: 18,
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
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Error",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "¡Ya cuenta con una postulación a éste empleo!",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'Cerrar',
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
                                      }
                                    },
                                    child: Text(
                                      'Sí',
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
                      child: Text(
                        'Me interesa',
                        style: TextStyle(
                            color: Color.fromRGBO(1, 167, 211, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                          return JobDetails(job);
                        }));
                      },
                      child: Text(
                        'Más detalles',
                        style: TextStyle(
                            color: Color.fromRGBO(226, 144, 32, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
        cRet.add(Padding(padding: EdgeInsets.only(top: 10)));
      }
    }
  }
  if (cRet.isEmpty) {
    cRet.add(Container(
      alignment: Alignment.center,
      child: Text("No existen empleos disponibles",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
    ));
  }
  return cRet;
}
