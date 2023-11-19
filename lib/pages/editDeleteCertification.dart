// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:frontend/classes/certifications.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/editCertificacion.dart';
import 'package:frontend/pages/userProfile.dart';
import 'package:frontend/services/certifications.services.dart';
import 'package:url_launcher/url_launcher.dart';

class EditDeleteCertification extends StatefulWidget {
  User user;
  List<Certification>? cList;
  EditDeleteCertification(this.cList, this.user, {super.key});

  @override
  State<EditDeleteCertification> createState() =>
      _EditDeleteCertificationState();
}

AbrirURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo abrir la URL: $url';
  }
}

class _EditDeleteCertificationState extends State<EditDeleteCertification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        foregroundColor: Color.fromRGBO(1, 167, 211, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
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
                "Certificados registrados",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                    color: Color.fromRGBO(226, 144, 32, 1),
                    fontFamily: 'PlaypenSans'),
              ),
            ]),
          ),
          Column(
            children: Certificaciones(widget.cList, context, widget.user),
          )
        ]),
      ),
    );
  }
}

List<Widget> Certificaciones(
    List<Certification>? cert, BuildContext context, User user) {
  List<Widget> cRet = [];
  if (cert != null) {
    for (Certification certificacion in cert) {
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
                        return EditCertification(user, certificacion);
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
                              title: Text("Se eliminara el certificado!",
                                  style: TextStyle(
                                      color: Color.fromRGBO(226, 144, 32, 1),
                                      fontWeight: FontWeight.w700)),
                              content: Text(
                                  "¿Está seguro de eliminar el certificado?",
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
                                            title: Text("Certificado eliminado",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        226, 144, 32, 1),
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            content: Text(
                                                "Se ha eliminado el certificado",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            backgroundColor: Colors.white70,
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  deleteCertification(
                                                      certificacion);
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute<void>(
                                                          builder: (BuildContext
                                                              context) {
                                                    return userProfile(user);
                                                  }));
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