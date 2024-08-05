// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names, must_be_immutable, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:frontend/classes/externalCompany.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/AdminExternalCompany.dart';
import 'package:frontend/services/externalCompany.services.dart';

class AddExternalCompany extends StatefulWidget {
  User loggedUser;
  AddExternalCompany(this.loggedUser, {super.key});

  @override
  State<AddExternalCompany> createState() => _AddJobState();
}

class _AddJobState extends State<AddExternalCompany> {
  //Variable que contiene todos las publicaciones actuales de la base
  late Future<List<ExternalCompany>> externalCompanies;
  //Variable para iterar la lista de usuarios de la base
  List<ExternalCompany>? eCList = [];
  //Variables para los valores de los campo
  String nombreEmpresa = '';
  String descripcionPublicacion = '';
  String url = '';
  //Variable para controlar el registro en caso de usuario repetido
  bool publishedJob = false;
  @override
  void initState() {
    externalCompanies = getAllExternalCompanies();
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
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return AdminExternalCompanies(widget.loggedUser);
                  }));
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
          future: externalCompanies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              eCList = snapshot.data;
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
                          "Publicar",
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
                            'Nompre empresa o sitio',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Nombre empresa',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(Icons.account_balance_outlined)),
                            onChanged: (valor) => setState(() {
                              nombreEmpresa = valor;
                            }),
                          ),
                          Text(
                            'Descripción',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            minLines: 1,
                            maxLines: 10,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Descripción',
                              icon: Icon(Icons.numbers_outlined),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (valor) {
                              descripcionPublicacion = valor;
                            },
                          ),
                          Text(
                            'URL',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.description_outlined),
                            ),
                            onChanged: (valor) => setState(() {
                              url = valor;
                            }),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    //Verifico que se ingresaron todos los campos
                                    if (nombreEmpresa != "" &&
                                        descripcionPublicacion != '' &&
                                        url != '') {
                                      ExternalCompany newExternal =
                                          ExternalCompany(
                                              id: "",
                                              nombreEmpresa: nombreEmpresa,
                                              descripcionPublicacion:
                                                  descripcionPublicacion,
                                              url: url,
                                              v: 0);
                                      createExternalCompany(newExternal);
                                      AddAlert(
                                          "Exito",
                                          "Se ha publicado de forma exitosa",
                                          true);
                                    } else {
                                      //Muestro una alerta pidiendo ingresar todos los campos
                                      AddAlert(
                                          "Error",
                                          "Ingrese todos los campos solicitados",
                                          false);
                                    }
                                  },
                                  child: Text(
                                    'Publicar',
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
          }),
    );
  }
}
