// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, prefer_void_to_null

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/jobs.dart';
import 'package:frontend/pages/addJob.dart';
import 'package:frontend/pages/companyProfile.dart';
import 'package:frontend/pages/editJob.dart';
import 'package:frontend/pages/explorePageCompany.dart';
import 'package:frontend/pages/homePageCompany.dart';
import 'package:frontend/pages/jobDetails.dart';
import 'package:frontend/pages/jobPostulations.dart';
import 'package:frontend/pages/loginUser.dart';
import 'package:frontend/services/jobs.services.dart';

class RegisteredJobs extends StatefulWidget {
  Company company;

  RegisteredJobs(this.company, {super.key});

  @override
  State<RegisteredJobs> createState() => _RegisteredJobsState();
}

class _RegisteredJobsState extends State<RegisteredJobs> {
  //Variable que contiene todos los trabajos publicados or la empresa de la base
  late Future<List<Job>> jobs;
  //Variable para iterar la lista de los trabajos publicados de la base
  List<Job>? jList = [];

  @override
  void initState() {
    jobs = getCompanyPublishedJobs(widget.company.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(206, 144, 32, 1),
          title: const Text(
            'Mis empleos',
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
                  shape: BoxShape.rectangle,
                ),
                width: 200,
                height: 200,
                child: Image(
                  image: AssetImage('assets/img/empresa.png'),
                  fit: BoxFit.contain,
                ),
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
                                        Color.fromRGBO(206, 144, 32, 1)),
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
                                return homePageCompany(widget.company);
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
                                        Color.fromRGBO(206, 144, 32, 1)),
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
                                return ExplorePageCompany(widget.company);
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(206, 144, 32, 1)),
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
                                return CompanyProfile(widget.company);
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
                                        Color.fromRGBO(206, 144, 32, 1)),
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
              ),
            ]),
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
              Center(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return AddJob(widget.company);
                        }));
                      },
                      child: Text(
                        'Publicar empleo',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ]),
              ),
              FutureBuilder(
                future: jobs,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    jList = snapshot.data;
                    return SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                    child: Column(
                                  children:
                                      Jobs(jList, context, widget.company),
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
      return homePageCompany(widget.company);
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

List<Widget> Jobs(List<Job>? jobs, BuildContext context, Company company) {
  List<Widget> cRet = [];
  if (jobs != null) {
    for (Job job in jobs) {
      cRet.add(Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
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
            Container(
              child: Row(
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
                      Icons.edit_square,
                      color: Colors.black38,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                        return EditJob(company, job);
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
                              title: Text("Se eliminará éste empleo!",
                                  style: TextStyle(
                                      color: Color.fromRGBO(226, 144, 32, 1),
                                      fontWeight: FontWeight.w700)),
                              content: Text(
                                  "¿Está seguro de eliminar éste empleo?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18)),
                              backgroundColor: Colors.white70,
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Empleo eliminado",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "Se ha eliminado el empleo",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      deleteJob(job);
                                                      Timer(
                                                          Duration(seconds: 2),
                                                          () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute<
                                                                    void>(
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                          return RegisteredJobs(
                                                              company);
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
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
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
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return JobPostulations(job, company);
                  }));
                },
                child: Text(
                  'Ver postulaciones',
                  style: TextStyle(
                      color: Color.fromRGBO(226, 144, 32, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            )
          ],
        ),
      ));
      cRet.add(Padding(padding: EdgeInsets.only(top: 10)));
    }
  }
  if (cRet.isEmpty) {
    cRet.add(Container(
      alignment: Alignment.center,
      child: Text("No existen empleos publicados",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
    ));
  }
  return cRet;
}
