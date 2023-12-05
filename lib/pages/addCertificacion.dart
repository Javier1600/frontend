// ignore_for_file: file_names, must_be_immutable, prefer_void_to_null, deprecated_member_use
// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names
import 'package:frontend/classes/certifications.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/userProfile.dart';
import 'package:frontend/services/certifications.services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';

class AddCertification extends StatefulWidget {
  User user;
  AddCertification(this.user, {super.key});

  @override
  State<AddCertification> createState() => _AddCertificacionState();
}

class _AddCertificacionState extends State<AddCertification> {
  //Variable que contiene todos los certificados registrados del usuario de la base
  late Future<List<Certification>> certs;
  //Variable para iterar la lista de usuarios de la base
  List<Certification>? cList = [];
  //Variables para los valores de los campos
  String titulo = '';
  String url = '';
  String fechaExpedicion = '';
  //Controladores de textos para las contraseñas y la fecha de nacimiento
  final TextEditingController DateController = TextEditingController();
  //Variable para controlar el registro en caso de usuario repetido
  bool registeredCertification = false;
  //Mascara del campo fecha
  var dateMaskFormatter = MaskTextInputFormatter(
      mask: '##-##-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    certs = getUserCertifications(widget.user.id);
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
            future: certs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                cList = snapshot.data;
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
                            "Registro de nuevo certificado",
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
                                  hintText: 'Ttulo',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  icon: Icon(Icons.description_outlined)),
                              onChanged: (valor) => setState(() {
                                titulo = valor;
                              }),
                            ),
                            Text(
                              'URL',
                              style: TextStyle(
                                  color: Color.fromRGBO(1, 167, 211, 1)),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'URL',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(Icons.link_rounded),
                              ),
                              onChanged: (valor) => setState(() {
                                url = valor;
                              }),
                            ),
                            Text(
                              'Fecha de expedición',
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
                                fechaExpedicion = valor;
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
                                      if (titulo != '' &&
                                          url != '' &&
                                          fechaExpedicion != '') {
                                        //Verifica si el certificado ingresado existe
                                        for (Certification c in cList!) {
                                          if (c.titulo != titulo) {
                                            registeredCertification = false;
                                          } else {
                                            registeredCertification = true;
                                          }
                                        }
                                        if (registeredCertification) {
                                          AddAlert(
                                              "Error",
                                              "El certificado ya se encuentra registrado",
                                              false);
                                        } else {
                                          Certification newCert = Certification(
                                              id: '0',
                                              titulo: titulo,
                                              url: url,
                                              idUsuario: widget.user.id,
                                              fechaExpedicion:
                                                  DateFormat("dd-MM-yyyy")
                                                      .parse(fechaExpedicion),
                                              v: 0);
                                          print(
                                              '${newCert.fechaExpedicion.toIso8601String()} ');
                                          createCertification(newCert);
                                          AddAlert(
                                              "Exito",
                                              "Se ha registrado el certificado de forma exitosa",
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
