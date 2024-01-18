// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, prefer_void_to_null, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/postulations.dart';
import 'package:frontend/classes/userPhoto.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/adminJobs.dart';
import 'package:frontend/pages/adminPostulations.dart';
import 'package:frontend/pages/explorePageAdmin.dart';
import 'package:frontend/pages/homePageAdmin.dart';
import 'package:frontend/pages/loginUser.dart';
import 'package:frontend/services/company.services.dart';
import 'package:frontend/services/postulations.services.dart';
import 'package:frontend/services/user.services.dart';

class AdminReports extends StatefulWidget {
  User loggedUser;
  AdminReports(this.loggedUser, {super.key});

  @override
  State<AdminReports> createState() => _AdminReportsState();
}

class _AdminReportsState extends State<AdminReports> {
  File? imagen;
  String imageUrl = '';
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
                child: FutureBuilder(
                  future: getUserPhoto(widget.loggedUser.id),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      UserPhoto profileImage = snapshot.data;
                      return ClipOval(
                          child: Image.network(
                        profileImage.foto,
                        fit: BoxFit.cover,
                      ));
                    } else if (snapshot.hasError) {
                      return imagen == null
                          ? ClipOval(
                              child: Image(
                              image: AssetImage(
                                  'assets/img/ImagenUsuarioDefecto.jpg'),
                              fit: BoxFit.contain,
                            ))
                          : ClipOval(
                              child: Image.file(
                              imagen!,
                              fit: BoxFit.cover,
                            ));
                    }
                    return imagen == null
                        ? ClipOval(
                            child: Image(
                            image: AssetImage(
                                'assets/img/ImagenUsuarioDefecto.jpg'),
                            fit: BoxFit.contain,
                          ))
                        : ClipOval(
                            child: Image.file(
                            imagen!,
                            fit: BoxFit.cover,
                          ));
                  },
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
                                return AdminJobs(widget.loggedUser);
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
            'Reportes',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder(
                future: getAllUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<User>? users = snapshot.data;
                    return FutureBuilder(
                      future: getAllCompanies(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Company>? companies = snapshot.data;
                          return FutureBuilder(
                            future: getAllPostulations(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                List<Postulation>? postulations = snapshot.data;
                                return Column(
                                  children: reports(
                                      users, companies, postulations, context),
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
              )
            ],
          ),
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

  Future<bool> _onBack(BuildContext context) async {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return homePageAdmin(widget.loggedUser);
    }));
    return true;
  }
}

List<Widget> reports(List<User>? users, List<Company>? companies,
    List<Postulation>? postulations, context) {
  List<Widget> ret = [];
  int uCounter = 0, cCounter = 0;
  double waiting = 0, accepted = 0, denied = 0;
  for (int i = 0; i < users!.length; i++) {
    uCounter++;
  }
  for (int i = 0; i < companies!.length; i++) {
    cCounter++;
  }
  for (var post in postulations!) {
    post.estado == "En espera"
        ? waiting++
        : post.estado == "Aceptada"
            ? accepted++
            : denied++;
  }
  ret.add(Center(
    child: Column(
      children: [
        Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Usuarios registrados",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.28,
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: Color.fromRGBO(1, 167, 211, 1), width: 4.0),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  uCounter.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30.0,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                        Text(
                          "Clientes",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22.0,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 8)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.28,
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: Color.fromRGBO(1, 167, 211, 1), width: 4.0),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cCounter.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30.0,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                        Text(
                          "Empresas",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22.0,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Estadísticas postulaciones",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.45,
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: Color.fromRGBO(1, 167, 211, 1), width: 4.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(8.0, 8.0),
                              blurRadius: 15.0)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: PieChart(PieChartData(
                            sections: [
                              PieChartSectionData(
                                color: Colors.green,
                                value: accepted,
                                radius: 60,
                                title: accepted.toStringAsFixed(0),
                                titleStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffffffff)),
                              ),
                              PieChartSectionData(
                                color: Colors.red,
                                value: denied,
                                radius: 60,
                                title: denied.toStringAsFixed(0),
                                titleStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffffffff)),
                              ),
                              PieChartSectionData(
                                color: Colors.blue,
                                value: waiting,
                                radius: 60,
                                title: waiting.toStringAsFixed(0),
                                titleStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffffffff)),
                              ),
                            ],
                            centerSpaceRadius: 30, // Espacio central
                            sectionsSpace: 0,
                          )),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _legendItem('Aceptadas', Colors.green),
                              _legendItem('En espera', Colors.blue),
                              _legendItem('Negadas', Colors.red),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Motivos de rechazo",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.45,
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: Color.fromRGBO(1, 167, 211, 1), width: 4.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(8.0, 8.0),
                              blurRadius: 15.0)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: PieChart(PieChartData(
                            sections: [
                              PieChartSectionData(
                                color: Colors.green,
                                value: accepted,
                                radius: 60,
                                title: accepted.toStringAsFixed(0),
                                titleStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffffffff)),
                              ),
                              PieChartSectionData(
                                color: Colors.red,
                                value: denied,
                                radius: 60,
                                title: denied.toStringAsFixed(0),
                                titleStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffffffff)),
                              ),
                              PieChartSectionData(
                                color: Colors.blue,
                                value: waiting,
                                radius: 60,
                                title: waiting.toStringAsFixed(0),
                                titleStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffffffff)),
                              ),
                            ],
                            centerSpaceRadius: 30, // Espacio central
                            sectionsSpace: 0,
                          )),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _legendItem('Aceptadas', Colors.green),
                              _legendItem('En espera', Colors.blue),
                              _legendItem('Negadas', Colors.red),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ));
  return ret;
}

Widget _legendItem(String label, Color color) {
  return Row(
    children: [
      Container(
        width: 16,
        height: 16,
        color: color,
      ),
      SizedBox(width: 5),
      Text(label),
    ],
  );
}
