// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/acadTrainings.dart';
import 'package:frontend/classes/schools.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/editAcadTraining.dart';
import 'package:frontend/pages/userProfile.dart';
import 'package:frontend/services/acadTrainings.services.dart';

class EditDeleteAcadTraining extends StatefulWidget {
  User user;
  List<AcadTraining>? aTList;
  List<School>? sList;
  EditDeleteAcadTraining(this.aTList, this.user, this.sList, {super.key});

  @override
  State<EditDeleteAcadTraining> createState() => _EditDeleteAcadTrainingState();
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

String NombreInstitucion(id, List<School>? lista) {
  String nombre = '';
  for (var s in lista!) {
    if (s.id == id) {
      nombre = s.nombreInstitucion;
    }
  }
  return nombre;
}

class _EditDeleteAcadTrainingState extends State<EditDeleteAcadTraining> {
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
                  "Formación Académica",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                      color: Color.fromRGBO(226, 144, 32, 1),
                      fontFamily: 'PlaypenSans'),
                ),
                Text(
                  "registrada",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                      color: Color.fromRGBO(226, 144, 32, 1),
                      fontFamily: 'PlaypenSans'),
                ),
              ]),
            ),
            Column(
              children: AcadTrainings(
                  widget.aTList, context, widget.user, widget.sList),
            )
          ]),
        ),
      ),
    );
  }
}

List<Widget> AcadTrainings(List<AcadTraining>? acadTrainings,
    BuildContext context, User user, List<School>? lista) {
  List<Widget> aTRet = [];
  if (acadTrainings != null) {
    for (AcadTraining acadT in acadTrainings) {
      aTRet.add(Container(
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
              '${acadT.tituloObtenido}',
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
                        return EditAcadTraining(user, acadT);
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
                              title: Text("Se eliminará esta Formación!",
                                  style: TextStyle(
                                      color: Color.fromRGBO(226, 144, 32, 1),
                                      fontWeight: FontWeight.w700)),
                              content: Text(
                                  "¿Está seguro de eliminar esta Formación?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700)),
                              backgroundColor: Colors.white70,
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Formación eliminada",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        226, 144, 32, 1),
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            content: Text(
                                                "Se ha eliminado la formación",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            backgroundColor: Colors.white70,
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  deleteAcadTraining(acadT);
                                                  Timer(Duration(seconds: 2),
                                                      () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute<void>(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return userProfile(user);
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
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Institución: ',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                NombreInstitucion(acadT.idInstitucion, lista),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                    overflow: TextOverflow.clip),
                maxLines: 3,
              ),
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
                  FormatoFecha(acadT.fechaInicio),
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
                  FormatoFecha(acadT.fechaInicio),
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
          ],
        ),
      ));
      aTRet.add(Padding(padding: EdgeInsets.only(top: 10)));
    }
  }
  return aTRet;
}
