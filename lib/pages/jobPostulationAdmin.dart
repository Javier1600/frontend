// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, prefer_void_to_null

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/jobs.dart';
import 'package:frontend/classes/postulations.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/adminJobs.dart';
import 'package:frontend/services/postulations.services.dart';
import 'package:frontend/services/user.services.dart';

class JobPostulationsAdmin extends StatefulWidget {
  Job job;
  User loggeUser;
  JobPostulationsAdmin(this.job, this.loggeUser, {super.key});

  @override
  State<JobPostulationsAdmin> createState() => _JobPostulationsAdminState();
}

String FormatoFecha(DateTime fecha) {
  //Mes y dia
  if (fecha.day < 10 && fecha.month < 10) {
    return "0${fecha.day}/0${fecha.month}/${fecha.year}";
    //Solo dia
  } else if (fecha.day < 10 && fecha.month >= 10) {
    return "0${fecha.day}/${fecha.month}/${fecha.year}";
  } else if (fecha.day >= 10 && fecha.month < 10) {
    //Solo mes
    return "${fecha.day}/0${fecha.month}/${fecha.year}";
  } else {
    //Ninguno
    return "${fecha.day}/${fecha.month}/${fecha.year}";
  }
}

class _JobPostulationsAdminState extends State<JobPostulationsAdmin> {
  //Variable que contiene todos los trabajos publicados almacenados en la base
  late Future<List<User>> users;
  //Variable para iterar la lista de los trabajos publicados de la base
  List<User>? uList = [];
  //Variable que contiene las postulaciones del usuario
  late Future<List<Postulation>> userPostulations;
  //Variable para iterar las postulaciones del usario
  List<Postulation> jPList = [];
  @override
  void initState() {
    users = getAllUsers();
    userPostulations = getJobPostulations(widget.job.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(1, 167, 211, 1),
          title: const Text(
            'Postulaciones',
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
                future: users,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    uList = snapshot.data;
                    return FutureBuilder(
                        future: userPostulations,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            jPList = snapshot.data;
                            return SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                            child: Column(
                                          children: Postulations(
                                              uList,
                                              jPList,
                                              widget.loggeUser,
                                              widget.job,
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
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                CircularProgressIndicator(
                                  color: Colors.black,
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
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        CircularProgressIndicator(
                          color: Colors.black,
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
      return AdminJobs(widget.loggeUser);
    }));
    return true;
  }
}

List<Widget> Postulations(List<User>? users, List<Postulation>? jobPost,
    User loggedUser, Job job, context) {
  List<Widget> pRet = [];
  for (Postulation post in jobPost!) {
    for (User user in users!) {
      //Valio el estado de la postulacion
      if (post.estado != "") {
        if (post.idUsuario == user.id) {
          pRet.add(Container(
            padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: post.estadoPostulacion == "Activo"
                    ? Colors.white
                    : Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(8.0, 8.0),
                      blurRadius: 15.0)
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 35,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Eliminar",
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
                                                        return JobPostulationsAdmin(
                                                            job, user);
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
                    )
                  ],
                ),
                Text(
                  "Postulante:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 20,
                    overflow: TextOverflow.clip,
                  ),
                  maxLines: 3,
                ),
                Text(
                  "${user.nombre} ${user.apellido}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    overflow: TextOverflow.clip,
                  ),
                  maxLines: 3,
                ),
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
              ],
            ),
          ));
          pRet.add(Padding(padding: EdgeInsets.only(top: 10)));
        }
      }
    }
  }
  if (pRet.isEmpty) {
    pRet.add(Container(
      alignment: Alignment.center,
      child: Text("Sin postulaciones",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
    ));
  }
  return pRet;
}
