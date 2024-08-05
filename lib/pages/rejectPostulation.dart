// ignore_for_file: must_be_immutable, file_names, prefer_void_to_null, deprecated_member_use, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/jobs.dart';
import 'package:frontend/classes/postulations.dart';
import 'package:frontend/pages/jobPostulations.dart';
import 'package:frontend/services/postulations.services.dart';

class RejectPostulation extends StatefulWidget {
  Company loggedCompany;
  Postulation reqPost;
  Job reqJob;
  RejectPostulation(this.loggedCompany, this.reqPost, this.reqJob, {super.key});

  @override
  State<RejectPostulation> createState() => _RejectPostulationState();
}

class _RejectPostulationState extends State<RejectPostulation> {
  bool age = false,
      acadTrain = false,
      finished = false,
      information = false,
      other = false;
  String motivo = "", textoMotivo = "";
  Postulation? nPost;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(206, 144, 32, 1),
          title: const Text(
            'Negar postulación',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
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
                  Text(
                    "Motivo de rechazo",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30.0,
                        color: Color.fromRGBO(226, 144, 32, 1),
                        fontFamily: 'PlaypenSans'),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: age,
                          activeColor: Color.fromRGBO(226, 144, 32, 1),
                          onChanged: (newBool) {
                            setState(() {
                              age = newBool!;
                              if (age) {
                                acadTrain = !age;
                                finished = !age;
                                information = !age;
                                other = !age;
                                motivo = "Edad fuera de rango";
                                textoMotivo = "";
                              } else {
                                motivo = "";
                                textoMotivo = "";
                              }
                            });
                          }),
                      Text(
                        "Fuera de rango de edad",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: acadTrain,
                          activeColor: Color.fromRGBO(226, 144, 32, 1),
                          onChanged: (newBool) {
                            setState(() {
                              acadTrain = newBool!;
                              if (acadTrain) {
                                age = !acadTrain;
                                finished = !acadTrain;
                                information = !acadTrain;
                                other = !acadTrain;
                                motivo = "Formación académica";
                                textoMotivo = "";
                              } else {
                                motivo = "";
                                textoMotivo = "";
                              }
                            });
                          }),
                      Text(
                        "Formacion académica",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: finished,
                          activeColor: Color.fromRGBO(226, 144, 32, 1),
                          onChanged: (newBool) {
                            setState(() {
                              finished = newBool!;
                              if (finished) {
                                age = !finished;
                                acadTrain = !finished;
                                information = !finished;
                                other = !finished;
                                motivo = "Plaza ya no disponible";
                                textoMotivo = "";
                              } else {
                                motivo = "";
                                textoMotivo = "";
                              }
                            });
                          }),
                      Text(
                        "Plaza ya no disponible",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: information,
                          activeColor: Color.fromRGBO(226, 144, 32, 1),
                          onChanged: (newBool) {
                            setState(() {
                              information = newBool!;
                              if (information) {
                                age = !information;
                                acadTrain = !information;
                                finished = !information;
                                other = !information;
                                motivo = "Información incompleta";
                                textoMotivo = "";
                              } else {
                                motivo = "";
                                textoMotivo = "";
                              }
                            });
                          }),
                      Text(
                        "Información incompleta",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: other,
                          activeColor: Color.fromRGBO(226, 144, 32, 1),
                          onChanged: (newBool) {
                            setState(() {
                              other = newBool!;
                              if (other) {
                                age = !other;
                                acadTrain = !other;
                                finished = !other;
                                information = !other;
                                motivo = "Otro";
                                textoMotivo = "";
                              } else {
                                motivo = "";
                                textoMotivo = "";
                              }
                            });
                          }),
                      Text(
                        "Otro",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  other
                      ? Column(
                          children: [
                            Padding(padding: EdgeInsets.all(8)),
                            Text(
                              'Especifíque el motivo',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            TextFormField(
                              minLines: 1,
                              maxLines: 10,
                              decoration: InputDecoration(
                                hintText: 'Motivo',
                                icon: Icon(
                                  Icons.info_outline,
                                  color: Color.fromRGBO(226, 144, 32, 1),
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              onChanged: (valor) {
                                textoMotivo = valor;
                              },
                            ),
                          ],
                        )
                      : Container(),
                  Padding(padding: EdgeInsets.all(8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            motivo != ""
                                ? motivo != "Otro"
                                    ? showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Negar postulación",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        226, 144, 32, 1),
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            content: Text(
                                                "¿Está seguro de realizar esta acción?",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18)),
                                            backgroundColor: Colors.white70,
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  nPost = Postulation(
                                                      id: widget.reqPost.id,
                                                      idUsuario: widget
                                                          .reqPost.idUsuario,
                                                      idEmpleo: widget
                                                          .reqPost.idEmpleo,
                                                      estado: "Negada",
                                                      motivoRechazo: motivo,
                                                      estadoPostulacion: widget
                                                          .reqPost
                                                          .estadoPostulacion,
                                                      fechaPostulacion: widget
                                                          .reqPost
                                                          .fechaPostulacion,
                                                      v: widget.reqPost.v);
                                                  editPostulation(nPost!);
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              "Postulación negada",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          144,
                                                                          32,
                                                                          1),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700)),
                                                          content: Text(
                                                              "Se ha negado la postulación por $motivo",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      18)),
                                                          backgroundColor:
                                                              Colors.white70,
                                                          actions: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                editPostulation(
                                                                    nPost!);
                                                                Timer(
                                                                    Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute<
                                                                              void>(
                                                                          builder:
                                                                              (BuildContext context) {
                                                                    return JobPostulations(
                                                                        widget
                                                                            .reqJob,
                                                                        widget
                                                                            .loggedCompany);
                                                                  }));
                                                                });
                                                              },
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white70),
                                                              child: Text(
                                                                'Aceptar',
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            1,
                                                                            167,
                                                                            211,
                                                                            1),
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white70),
                                                child: Text(
                                                  'Continuar',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          1, 167, 211, 1),
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.all(5)),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white70),
                                                child: Text(
                                                  'Cancelar',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          226, 144, 32, 1),
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ],
                                          );
                                        })
                                    : textoMotivo != ""
                                        ? showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Negar postulación",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "¿Está seguro de realizar esta acción?",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          nPost = Postulation(
                                                              id: widget
                                                                  .reqPost.id,
                                                              idUsuario: widget
                                                                  .reqPost
                                                                  .idUsuario,
                                                              idEmpleo: widget
                                                                  .reqPost
                                                                  .idEmpleo,
                                                              estado: "Negada",
                                                              motivoRechazo:
                                                                  textoMotivo,
                                                              estadoPostulacion:
                                                                  widget.reqPost
                                                                      .estadoPostulacion,
                                                              fechaPostulacion:
                                                                  widget.reqPost
                                                                      .fechaPostulacion,
                                                              v: widget
                                                                  .reqPost.v);
                                                          motivo = textoMotivo;
                                                          editPostulation(
                                                              nPost!);
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      "Postulación negada",
                                                                      style: TextStyle(
                                                                          color: Color.fromRGBO(
                                                                              226,
                                                                              144,
                                                                              32,
                                                                              1),
                                                                          fontWeight:
                                                                              FontWeight.w700)),
                                                                  content: Text(
                                                                      "Se ha negado la postulación por $motivo",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                              18)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white70,
                                                                  actions: [
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        editPostulation(
                                                                            nPost!);
                                                                        Timer(
                                                                            Duration(seconds: 1),
                                                                            () {
                                                                          Navigator.of(context).push(MaterialPageRoute<void>(builder:
                                                                              (BuildContext context) {
                                                                            return JobPostulations(widget.reqJob,
                                                                                widget.loggedCompany);
                                                                          }));
                                                                        });
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor:
                                                                              Colors.white70),
                                                                      child:
                                                                          Text(
                                                                        'Aceptar',
                                                                        style: TextStyle(
                                                                            color: Color.fromRGBO(
                                                                                1,
                                                                                167,
                                                                                211,
                                                                                1),
                                                                            fontSize:
                                                                                22,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              });
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white70),
                                                        child: Text(
                                                          'Continuar',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      1,
                                                                      167,
                                                                      211,
                                                                      1),
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white70),
                                                        child: Text(
                                                          'Cancelar',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      226,
                                                                      144,
                                                                      32,
                                                                      1),
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            })
                                        : showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Error al negar postulación",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "Ingrese un motivo de rechazo!",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white70),
                                                    child: Text(
                                                      'Aceptar',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              1, 167, 211, 1),
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            })
                                : showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            "Error al negar postulación",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    226, 144, 32, 1),
                                                fontWeight: FontWeight.w700)),
                                        content: Text(
                                            "Seleccione un motivo de rechazo!",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18)),
                                        backgroundColor: Colors.white70,
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.white70),
                                            child: Text(
                                              'Aceptar',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      1, 167, 211, 1),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                          },
                          child: Text(
                            "Negar",
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1),
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          )),
                      Padding(padding: EdgeInsets.only(left: 15)),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Text(
                            "Cancelar",
                            style: TextStyle(
                                color: Color.fromRGBO(226, 144, 32, 1),
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return JobPostulations(widget.reqJob, widget.loggedCompany);
    }));
    return true;
  }
}
