// ignore_for_file: file_names, must_be_immutable
// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names
import 'package:frontend/classes/schools.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/adminSchools.dart';
import 'package:frontend/pages/registeredSchools.dart';
import 'package:frontend/services/schools.services.dart';
import 'package:flutter/material.dart';

class AddSchool extends StatefulWidget {
  User loggedUser;
  User reqUser;
  bool fromAdminExplore;
  bool fromAdminProfile;
  bool fromAdminShools;
  AddSchool(this.loggedUser, this.reqUser, this.fromAdminExplore,
      this.fromAdminProfile, this.fromAdminShools,
      {super.key});

  @override
  State<AddSchool> createState() => _AddSchoolState();
}

class _AddSchoolState extends State<AddSchool> {
  //Variable que contiene todos los certificados registrados del usuario de la base
  late Future<List<School>> schools;
  //Variable para iterar la lista de usuarios de la base
  List<School>? sList = [];
  //Variables para los valores de los campos
  String nombreInstitucion = '';
  String ubicacion = '';
  String estado = 'Activo';
  //Variable para controlar el registro en caso de usuario repetido
  bool registeredSchool = false;
  //Mascara del campo fecha

  @override
  void initState() {
    schools = getAllSchools();
    super.initState();
  }

  void AddAlert(String title, String mensaje, bool navigate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,
              style: TextStyle(
                  color: Color.fromRGBO(226, 144, 32, 1),
                  fontWeight: FontWeight.w700)),
          content: Text(mensaje,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
          backgroundColor: Colors.white70,
          actions: [
            ElevatedButton(
              onPressed: () {
                if (navigate) {
                  if (widget.fromAdminShools) {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return AdminSchools(
                        widget.loggedUser,
                      );
                    }));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return RegisteredSchools(
                          widget.loggedUser,
                          widget.reqUser,
                          widget.fromAdminExplore,
                          widget.fromAdminProfile);
                    }));
                  }
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'Cerrar',
                style: TextStyle(
                    color: Color.fromRGBO(1, 167, 211, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        foregroundColor: Color.fromRGBO(1, 167, 211, 1),
      ),
      body: FutureBuilder(
          future: schools,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              sList = snapshot.data;
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 0),
                    ),
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
                          "Registro de nueva",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25.0,
                              color: Color.fromRGBO(226, 144, 32, 1),
                              fontFamily: 'PlaypenSans'),
                        ),
                        Text(
                          "Institución educativa",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25.0,
                              color: Color.fromRGBO(226, 144, 32, 1),
                              fontFamily: 'PlaypenSans'),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Nombre de la institución',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Nombre institución',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(Icons.description_outlined)),
                            onChanged: (valor) => setState(() {
                              nombreInstitucion = valor;
                            }),
                          ),
                          Text(
                            'Ubicacion',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Calle 1 y Calle 2',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.link_rounded),
                            ),
                            onChanged: (valor) => setState(() {
                              ubicacion = valor;
                            }),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    //Verifico que se ingresaron todos los campos
                                    if (nombreInstitucion != '' &&
                                        ubicacion != '') {
                                      //Verifica si La institución ingresado existe
                                      for (School s in sList!) {
                                        if (s.nombreInstitucion !=
                                                nombreInstitucion &&
                                            s.ubicacion != ubicacion) {
                                          registeredSchool = false;
                                        } else {
                                          registeredSchool = true;
                                        }
                                      }
                                      if (registeredSchool) {
                                        AddAlert(
                                            "Error",
                                            "La institución ya se encuentra registrado",
                                            false);
                                      } else {
                                        School newSchool = School(
                                            id: '0',
                                            nombreInstitucion:
                                                nombreInstitucion,
                                            ubicacion: ubicacion,
                                            estado: estado,
                                            v: 0);
                                        createSchool(newSchool);
                                        AddAlert(
                                            "Exito",
                                            "Se ha registrado la institución de forma exitosa",
                                            true);
                                      }
                                    } else {
                                      //Muestro una alerta pidiendo ingresar todos los campos
                                      AddAlert(
                                          "Error",
                                          "Ingrese todos los campos solicitados",
                                          false);
                                    }
                                  },
                                  child: Text(
                                    'Registrar',
                                    style: TextStyle(
                                        color: Color.fromRGBO(1, 167, 211, 1),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(
                                      color: Color.fromRGBO(226, 144, 32, 1),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
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
          }),
    );
  }
}
