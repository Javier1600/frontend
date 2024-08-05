// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, prefer_void_to_null

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/externalCompany.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/CreateExternalCompany.dart';
import 'package:frontend/pages/editExternalCompany.dart';
import 'package:frontend/services/externalCompany.services.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminExternalCompanies extends StatefulWidget {
  User loggedUser;
  AdminExternalCompanies(this.loggedUser, {super.key});

  @override
  State<AdminExternalCompanies> createState() => _AdminExternalCompaniesState();
}

AbrirURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo abrir la URL: $url';
  }
}

class _AdminExternalCompaniesState extends State<AdminExternalCompanies> {
  //Variable que contiene todos las publicaciones actuales de la base
  late Future<List<ExternalCompany>> externalCompanies;
  //Variable para iterar la lista de usuarios de la base
  List<ExternalCompany>? eCList = [];
  @override
  void initState() {
    externalCompanies = getAllExternalCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.white,
          foregroundColor: Color.fromRGBO(1, 167, 211, 1)),
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
                const Text(
                  "Empleos",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40.0,
                      color: Color.fromRGBO(1, 167, 211, 1)),
                  textAlign: TextAlign.center,
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                    text: "Chavez",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40.0,
                        color: Color.fromRGBO(226, 144, 32, 1),
                        fontFamily: 'PlaypenSans'),
                  ),
                  TextSpan(
                    text: "pamba",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40.0,
                        color: Color.fromRGBO(1, 167, 211, 1),
                        fontFamily: 'PlaypenSans'),
                  ),
                ])),
                Divider(
                  color: Color.fromRGBO(226, 144, 32, 1),
                ),
                Text(
                  "Publicaciones registradas",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                      color: Color.fromRGBO(226, 144, 32, 1),
                      fontFamily: 'PlaypenSans'),
                ),
              ]),
            ),
            Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                        return AddExternalCompany(widget.loggedUser);
                      }));
                    },
                    child: Text(
                      'Publicar',
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
              future: externalCompanies,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  eCList = snapshot.data;
                  return Column(
                    children: ExternalCompanies(
                      eCList,
                      context,
                      widget.loggedUser,
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
            )
          ]),
        ),
      ),
    );
  }
}

List<Widget> ExternalCompanies(
    List<ExternalCompany>? eCompanies, BuildContext context, User loggedUser) {
  List<Widget> cRet = [];
  if (eCompanies != null) {
    for (ExternalCompany eC in eCompanies) {
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
            Text(
              '${eC.nombreEmpresa}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.clip),
              maxLines: 3,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit_square,
                      color: Colors.black38,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                        return EditExternalCompany(loggedUser, eC);
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
                              title: Text("Se eliminara la publicación",
                                  style: TextStyle(
                                      color: Color.fromRGBO(226, 144, 32, 1),
                                      fontWeight: FontWeight.w700)),
                              content: Text(
                                  "¿Está seguro de eliminar la publicación?",
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
                                            title: Text("Publicación eliminada",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        226, 144, 32, 1),
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            content: Text(
                                                "Se ha eliminado la publicación",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18)),
                                            backgroundColor: Colors.white70,
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  deleteExternalCompany(eC);
                                                  Timer(Duration(seconds: 2),
                                                      () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute<void>(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return AdminExternalCompanies(
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
                                                style: ElevatedButton.styleFrom(
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
                  ),
                ],
              ),
            ),
            Text(
              'Descripción: ',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              eC.descripcionPublicacion,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 20,
              ),
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
                    AbrirURL(eC.url);
                  },
                  child: Text(
                    'Ver página',
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
      cRet.add(Padding(padding: EdgeInsets.only(top: 10)));
    }
  }
  if (cRet.isEmpty) {
    cRet.add(Container(
      alignment: Alignment.center,
      child: Text("Sin publicaciones",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
    ));
  }
  return cRet;
}
