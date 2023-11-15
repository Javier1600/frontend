// ignore_for_file: camel_case_types, file_names, must_be_immutable, prefer_const_constructors, prefer_void_to_null, avoid_unnecessary_containers, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:frontend/classes/workExperience.dart';
import 'package:frontend/services/workExperiences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:frontend/classes/acadTrainings.dart';
import 'package:frontend/classes/certifications.dart';
import 'package:frontend/classes/schools.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/services/acadTrainings.services.dart';
import 'package:frontend/services/certifications.services.dart';
import 'package:frontend/services/schools.services.dart';

class userProfile extends StatefulWidget {
  //Variables para construir el drawer y el perfil
  User loggedUser, reqUser;
  userProfile(this.loggedUser, this.reqUser, {super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

int CalcularEdad(fechaNacimiento) {
  return DateTime.now().difference(fechaNacimiento).inDays ~/ 365;
}

String NombreInstitucion(id, List<School>? lista) {
  String nombre = '';
  for (var s in lista!) {
    if (s.id == id) {
      nombre = s.nombreInstitucion;
    }
  }
  return nombre;
}

AbrirURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo abrir la URL: $url';
  }
}

class _userProfileState extends State<userProfile> {
  //variable que contiene la formacion academica del usuario
  late Future<List<AcadTraining>> acadTraining;
  late List<AcadTraining>? aTList = [];
  //variable que contiene las certoficaciones del usuario
  late Future<List<Certification>> certifications;
  late List<Certification>? certList = [];
  //variable que contiene las certoficaciones del usuario
  late Future<List<School>> schools;
  late List<School>? sList = [];
  //variable que contiene la experiencia laboral del usuario
  late Future<List<WorkExperience>> workExp;
  late List<WorkExperience>? wEList = [];
  @override
  void initState() {
    acadTraining = getUserAcadTraining(widget.reqUser.id);
    certifications = getUserCertifications(widget.reqUser.id);
    schools = getAllSchools();
    workExp = getUserWorkExperiences(widget.reqUser.id);
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
                  border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0), width: 2.0)),
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
                          return userProfile(widget.loggedUser, widget.reqUser);
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
        title: const Text(
          "Mi perfil",
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder(
        future: acadTraining,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            aTList = snapshot.data;
            return FutureBuilder(
              future: certifications,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  certList = snapshot.data;
                  return FutureBuilder(
                    future: schools,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      sList = snapshot.data;
                      if (snapshot.hasData) {
                        return FutureBuilder(
                          future: workExp,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              wEList = snapshot.data;
                              return SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    width: 2.0)),
                                            width: 150,
                                            height: 150,
                                            child: const ClipOval(
                                                child: Image(
                                              image: AssetImage(
                                                  'assets/img/hombre.png'),
                                              fit: BoxFit.contain,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Divider(
                                            color: Color.fromRGBO(
                                                226, 144, 32, 1)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Text(
                                            "Datos personales",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    1, 167, 211, 1),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nombre: ',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              '${widget.loggedUser.nombre} ${widget.loggedUser.apellido}',
                                              style: TextStyle(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Fecha de nacimiento: ',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              '${widget.reqUser.fechaNacimiento.day}-${widget.reqUser.fechaNacimiento.month}-${widget.reqUser.fechaNacimiento.year}',
                                              style: TextStyle(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Edad: ',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              '${CalcularEdad(widget.reqUser.fechaNacimiento)} años',
                                              style: TextStyle(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Contacto: ',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              '${widget.reqUser.telefono}',
                                              style: TextStyle(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Column(children: [
                                        Divider(
                                            color: Color.fromRGBO(
                                                226, 144, 32, 1)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5.0, bottom: 5.0),
                                          child: Text(
                                            "Formación Académica",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    1, 167, 211, 1),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Column(
                                          children:
                                              FormacionAcademica(aTList, sList),
                                        )
                                      ]),
                                    ),
                                    Container(
                                      child: Column(children: [
                                        Divider(
                                            color: Color.fromRGBO(
                                                226, 144, 32, 1)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5.0, bottom: 5.0),
                                          child: Text(
                                            "Certificaciones",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    1, 167, 211, 1),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Column(
                                          children: Certificaciones(certList),
                                        )
                                      ]),
                                    ),
                                    Container(
                                      child: Column(children: [
                                        Divider(
                                            color: Color.fromRGBO(
                                                226, 144, 32, 1)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5.0, bottom: 5.0),
                                          child: Text(
                                            "Experiencia laboral",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    1, 167, 211, 1),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Column(
                                          children: ExpLaboral(wEList),
                                        ),
                                      ]),
                                    )
                                  ]),
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
                CircularProgressIndicator(
                  color: Color.fromRGBO(1, 167, 211, 1),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Widget> FormacionAcademica(List<AcadTraining>? aT, List<School>? s) {
  List<Widget> fA = [];
  if (aT != null) {
    for (var acadTraining in aT) {
      fA.add(Container(
        child: Column(
          children: [
            Text(
              '${acadTraining.tituloObtenido}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.clip),
              maxLines: 3,
            ),
            Text(
              NombreInstitucion(acadTraining.idInstitucion, s),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                overflow: TextOverflow.clip,
              ),
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Fecha de inicio: ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${acadTraining.fechaInicio.day}-${acadTraining.fechaInicio.month}-${acadTraining.fechaInicio.year}',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Fecha obtenido: ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${acadTraining.fechaFin.day}-${acadTraining.fechaFin.month}-${acadTraining.fechaFin.year}',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
    }
  }
  return fA;
}

List<Widget> Certificaciones(List<Certification>? cert) {
  List<Widget> cRet = [];
  if (cert != null) {
    for (var certificacion in cert) {
      cRet.add(Container(
        child: Column(
          children: [
            Text(
              '${certificacion.titulo}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.clip),
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Fecha obtenido: ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${certificacion.fechaExpedicion.day}-${certificacion.fechaExpedicion.month}-${certificacion.fechaExpedicion.year}',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'URL: ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    AbrirURL(certificacion.url);
                  },
                  child: Text(
                    'Ver certificado',
                    style: TextStyle(
                      color: Color.fromRGBO(1, 167, 211, 1),
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ));
    }
  }
  return cRet;
}

List<Widget> ExpLaboral(List<WorkExperience>? expLab) {
  List<Widget> expRet = [];
  if (expLab != null) {
    for (var experience in expLab) {
      expRet.add(Container(
        child: Column(
          children: [
            Text(
              '${experience.puesto}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.clip),
              maxLines: 3,
            ),
            Text(
              "${experience.empresa}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                overflow: TextOverflow.clip,
              ),
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Ámbito: ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${experience.ambitoLaboral}',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Fecha inicio: ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${experience.fechaInicio.day}-${experience.fechaInicio.month}-${experience.fechaInicio.year}',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Fecha fin: ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${experience.fechaFin.day}-${experience.fechaFin.month}-${experience.fechaFin.year}',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Responsabilidades: ',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '${experience.descripcionResponsabilidades}',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                ),
                maxLines: 10,
              ),
            ),
          ],
        ),
      ));
    }
  }
  return expRet;
}
