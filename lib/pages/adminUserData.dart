// ignore_for_file: camel_case_types, file_names, must_be_immutable, prefer_const_constructors, prefer_void_to_null, avoid_unnecessary_containers, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:frontend/classes/userPhoto.dart';
import 'package:frontend/pages/addCertificacion.dart';
import 'package:frontend/pages/addWorkExperience.dart';
import 'package:frontend/pages/editDeleteAcadTraining.dart';
import 'package:frontend/pages/editDeleteCertification.dart';
import 'package:frontend/pages/editDeleteWorkExperience.dart';
import 'package:frontend/pages/editUserPersonalData.dart';
import 'package:frontend/pages/explorePageAdmin.dart';
import 'package:frontend/pages/registeredSchools.dart';
import 'package:frontend/services/user.services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:frontend/classes/acadTrainings.dart';
import 'package:frontend/classes/certifications.dart';
import 'package:frontend/classes/schools.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/classes/workExperience.dart';
import 'package:frontend/services/workExperiences.dart';
import 'package:frontend/services/acadTrainings.services.dart';
import 'package:frontend/services/certifications.services.dart';
import 'package:frontend/services/schools.services.dart';

class AdminUserData extends StatefulWidget {
  //Variables para construir el drawer y el perfil
  User loggedUser;
  User reqUser;
  AdminUserData(this.loggedUser, this.reqUser, {super.key});

  @override
  State<AdminUserData> createState() => _AdminUserDataState();
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

class _AdminUserDataState extends State<AdminUserData> {
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
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(1, 167, 211, 1),
          title: const Text(
            'Admin Usuario',
            style: TextStyle(color: Colors.white),
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
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(8.0, 8.0),
                                                  blurRadius: 15.0)
                                            ]),
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    width: 170,
                                                    height: 170,
                                                    child: FutureBuilder(
                                                      future: getUserPhoto(
                                                          widget.reqUser.id),
                                                      builder:
                                                          (BuildContext context,
                                                              AsyncSnapshot
                                                                  snapshot) {
                                                        if (snapshot.hasData) {
                                                          UserPhoto
                                                              profileImage =
                                                              snapshot.data;
                                                          return ClipOval(
                                                              child:
                                                                  Image.network(
                                                            profileImage.foto,
                                                            fit: BoxFit.cover,
                                                          ));
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return ClipOval(
                                                              child: Image(
                                                            image: AssetImage(
                                                                'assets/img/ImagenUsuarioDefecto.jpg'),
                                                            fit: BoxFit.contain,
                                                          ));
                                                        }
                                                        return ClipOval(
                                                            child: Image(
                                                          image: AssetImage(
                                                              'assets/img/ImagenUsuarioDefecto.jpg'),
                                                          fit: BoxFit.contain,
                                                        ));
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "Datos personales",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        1, 167, 211, 1),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.edit_square,
                                                      color: Colors.black38,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute<
                                                                  Null>(
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                        return EditUserPersonalData(
                                                            widget.loggedUser,
                                                            widget.reqUser,
                                                            true,
                                                            false);
                                                      }));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Nombre: ',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '${widget.reqUser.nombre} ${widget.reqUser.apellido}',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontSize: 20,
                                                  ),
                                                )),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Fecha de nacimiento: ',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  FormatoFecha(widget
                                                      .reqUser.fechaNacimiento),
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontSize: 20,
                                                  ),
                                                )),
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
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  '${CalcularEdad(widget.reqUser.fechaNacimiento)} años',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
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
                                                  'Sexo: ',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  '${widget.reqUser.sexo}',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
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
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  '${widget.reqUser.telefono}',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Sobre mí: ',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '${widget.reqUser.descripcionPersonal}',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontSize: 20,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 5)),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 16.0,
                                            right: 16.0,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(8.0, 8.0),
                                                  blurRadius: 15.0)
                                            ]),
                                        child: Column(children: [
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
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.edit_square,
                                                    color: Colors.black38,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute<Null>(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return EditDeleteAcadTraining(
                                                          aTList,
                                                          widget.loggedUser,
                                                          widget.reqUser,
                                                          sList,
                                                          true,
                                                          false);
                                                    }));
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons
                                                        .add_to_photos_outlined,
                                                    color: Colors.black38,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute<Null>(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return RegisteredSchools(
                                                          widget.loggedUser,
                                                          widget.reqUser,
                                                          true,
                                                          false);
                                                    }));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: FormacionAcademica(
                                                aTList, sList),
                                          )
                                        ]),
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 5)),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 16.0,
                                            right: 16.0,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(8.0, 8.0),
                                                  blurRadius: 15.0)
                                            ]),
                                        child: Column(children: [
                                          Container(
                                            child: Text(
                                              "Certificaciones",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      1, 167, 211, 1),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.edit_square,
                                                    color: Colors.black38,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute<Null>(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return EditDeleteCertification(
                                                          certList,
                                                          widget.loggedUser,
                                                          widget.reqUser,
                                                          true,
                                                          false);
                                                    }));
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons
                                                        .add_to_photos_outlined,
                                                    color: Colors.black38,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute<Null>(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return AddCertification(
                                                          widget.loggedUser,
                                                          widget.reqUser,
                                                          true,
                                                          false);
                                                    }));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: Certificaciones(certList),
                                          )
                                        ]),
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 5)),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 16.0,
                                            right: 16.0,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(8.0, 8.0),
                                                  blurRadius: 15.0)
                                            ]),
                                        child: Column(children: [
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
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.edit_square,
                                                    color: Colors.black38,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute<Null>(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return EditDeleteWorkExperience(
                                                          wEList,
                                                          widget.loggedUser,
                                                          widget.reqUser,
                                                          true,
                                                          false);
                                                    }));
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons
                                                        .add_to_photos_outlined,
                                                    color: Colors.black38,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute<Null>(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return AddWorkExperience(
                                                          widget.loggedUser,
                                                          widget.reqUser,
                                                          true,
                                                          false);
                                                    }));
                                                  },
                                                ),
                                              ],
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
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return ExplorePageAdmin(widget.loggedUser);
    }));
    return true;
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
                  FormatoFecha(acadTraining.fechaInicio),
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
                  FormatoFecha(acadTraining.fechaFin),
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
  if (fA.isEmpty) {
    fA.add(Container(
      alignment: Alignment.center,
      child: Text("Sin formación académica",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
    ));
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
                  FormatoFecha(certificacion.fechaExpedicion),
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
  if (cRet.isEmpty) {
    cRet.add(Container(
      alignment: Alignment.center,
      child: Text("Sin certificaciones",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
    ));
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
                  FormatoFecha(experience.fechaInicio),
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
                  FormatoFecha(experience.fechaFin),
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
  if (expRet.isEmpty) {
    expRet.add(Container(
      alignment: Alignment.center,
      child: Text("Sin experiencia laboral",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
    ));
  }
  return expRet;
}
