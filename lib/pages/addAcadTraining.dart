// ignore_for_file: file_names, must_be_immutable, prefer_void_to_null
// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names
import 'package:frontend/classes/acadTrainings.dart';
import 'package:frontend/classes/schools.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/userProfile.dart';
import 'package:frontend/services/acadTrainings.services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';

class AddAcadTraining extends StatefulWidget {
  User user;
  School school;
  AddAcadTraining(this.user, this.school, {super.key});

  @override
  State<AddAcadTraining> createState() => _AddAcadTrainingState();
}

class _AddAcadTrainingState extends State<AddAcadTraining> {
  //Variable que contiene todos los acadTraining registrados del usuario de la base
  late Future<List<AcadTraining>> acadTrainings;
  //Variable para iterar la lista de usuarios de la base
  List<AcadTraining>? aTList = [];
  //Variables para los valores de los campos
  String tituloObtenido = '';
  String fechaInicio = '';
  String fechaFin = '';
  //Controladores de textos para las contraseñas y la fecha de nacimiento
  final TextEditingController DateController = TextEditingController();
  //Variable para controlar el registro en caso de usuario repetido
  bool registeredAcadTraining = false;
  //Mascara del campo fecha
  var dateMaskFormatter = MaskTextInputFormatter(
      mask: '##-##-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    acadTrainings = getUserAcadTraining(widget.user.id);
    print(widget.school.nombreInstitucion);
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
                    return userProfile(widget.user);
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
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          foregroundColor: Color.fromRGBO(1, 167, 211, 1),
        ),
        body: FutureBuilder(
            future: acadTrainings,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                aTList = snapshot.data;
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
                            "Formación Académica",
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
                              'Título del certificado',
                              style: TextStyle(
                                  color: Color.fromRGBO(1, 167, 211, 1)),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Titulo',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  icon: Icon(Icons.description_outlined)),
                              onChanged: (valor) => setState(() {
                                tituloObtenido = valor;
                              }),
                            ),
                            Text(
                              'Fecha inicio',
                              style: TextStyle(
                                  color: Color.fromRGBO(1, 167, 211, 1)),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [dateMaskFormatter],
                              decoration: InputDecoration(
                                hintText: 'DD-MM-AAAA',
                                icon: Icon(Icons.calendar_month_outlined),
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              onChanged: (valor) {
                                fechaInicio = valor;
                              },
                            ),
                            Text(
                              'Fecha fin',
                              style: TextStyle(
                                  color: Color.fromRGBO(1, 167, 211, 1)),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [dateMaskFormatter],
                              decoration: InputDecoration(
                                hintText: 'DD-MM-AAAA',
                                icon: Icon(Icons.calendar_month_outlined),
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              onChanged: (valor) {
                                fechaFin = valor;
                              },
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
                                      if (tituloObtenido != '' &&
                                          fechaInicio != '' &&
                                          fechaFin != '') {
                                        //Verifica si el certificado ingresado existe
                                        for (AcadTraining aT in aTList!) {
                                          if (aT.tituloObtenido !=
                                              tituloObtenido) {
                                            registeredAcadTraining = false;
                                          } else {
                                            registeredAcadTraining = true;
                                          }
                                        }
                                        if (registeredAcadTraining) {
                                          AddAlert(
                                              "Error",
                                              "Ya se encuentra registrado",
                                              false);
                                        } else {
                                          AcadTraining newAcadTraining =
                                              AcadTraining(
                                                  id: '0',
                                                  idInstitucion:
                                                      widget.school.id,
                                                  tituloObtenido:
                                                      tituloObtenido,
                                                  idUsuario: widget.user.id,
                                                  fechaInicio:
                                                      DateFormat("dd-MM-yyyy")
                                                          .parse(fechaInicio),
                                                  fechaFin:
                                                      DateFormat("dd-MM-yyyy")
                                                          .parse(fechaFin),
                                                  v: 0);
                                          createAcadTraining(newAcadTraining);
                                          AddAlert(
                                              "Exito",
                                              "Se ha registrado de forma exitosa",
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
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return userProfile(widget.user);
    }));
    return true;
  }
}
