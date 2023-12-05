// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, prefer_void_to_null
// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names
import 'package:frontend/classes/users.dart';
import 'package:frontend/classes/workExperience.dart';
import 'package:frontend/pages/userProfile.dart';
import 'package:frontend/services/workExperiences.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';

class AddWorkExperience extends StatefulWidget {
  User user;
  AddWorkExperience(this.user, {super.key});

  @override
  State<AddWorkExperience> createState() => _AddworkExperienceState();
}

class _AddworkExperienceState extends State<AddWorkExperience> {
  //Variable que contiene todos los certificados registrados del usuario de la base
  late Future<List<WorkExperience>> wExperiences;
  //Variable para iterar la lista de usuarios de la base
  List<WorkExperience>? wEList = [];
  //Variables para los valores de los campos
  String puesto = '';
  String ambitoLaboral = '';
  String empresa = '';
  String fechaInicio = '';
  String fechaFin = '';
  String descripcionResponsabilidades = '';
  //Controladores de textos para las contraseñas y la fecha de nacimiento
  final TextEditingController DateController = TextEditingController();
  //Variable para controlar el registro en caso de usuario repetido
  bool registeredWorkExp = false;
  //Mascara del campo fecha
  var dateMaskFormatter = MaskTextInputFormatter(
      mask: '##-##-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    wExperiences = getUserWorkExperiences(widget.user.id);
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
            future: wExperiences,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                wEList = snapshot.data;
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
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25.0,
                                color: Color.fromRGBO(226, 144, 32, 1),
                                fontFamily: 'PlaypenSans'),
                          ),
                          Text(
                            "Experiencia Laboral",
                            maxLines: 2,
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
                              'Puesto desempeñado',
                              style: TextStyle(
                                  color: Color.fromRGBO(1, 167, 211, 1)),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Gerente',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  icon: Icon(Icons.work_outline)),
                              onChanged: (valor) => setState(() {
                                puesto = valor;
                              }),
                            ),
                            Text(
                              'Ambito Laboral',
                              style: TextStyle(
                                  color: Color.fromRGBO(1, 167, 211, 1)),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Educación',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(Icons.topic_outlined),
                              ),
                              onChanged: (valor) => setState(() {
                                ambitoLaboral = valor;
                              }),
                            ),
                            Text(
                              'Empresa',
                              style: TextStyle(
                                  color: Color.fromRGBO(1, 167, 211, 1)),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Empresa',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(Icons.home_work_outlined),
                              ),
                              onChanged: (valor) => setState(() {
                                empresa = valor;
                              }),
                            ),
                            Text(
                              'Fecha inicial',
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
                              'Fecha finalización',
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
                            Text(
                              'Responsabilidades a cargo',
                              style: TextStyle(
                                  color: Color.fromRGBO(1, 167, 211, 1)),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(Icons.info_outline_rounded),
                              ),
                              onChanged: (valor) => setState(() {
                                descripcionResponsabilidades = valor;
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
                                      if (puesto != '' &&
                                          ambitoLaboral != '' &&
                                          fechaInicio != '' &&
                                          fechaFin != '' &&
                                          empresa != '' &&
                                          descripcionResponsabilidades != '') {
                                        WorkExperience newWExp = WorkExperience(
                                            id: '0',
                                            puesto: puesto,
                                            descripcionResponsabilidades:
                                                descripcionResponsabilidades,
                                            ambitoLaboral: ambitoLaboral,
                                            empresa: empresa,
                                            fechaInicio:
                                                DateFormat("dd-MM-yyyy")
                                                    .parse(fechaInicio),
                                            fechaFin: DateFormat("dd-MM-yyyy")
                                                .parse(fechaFin),
                                            idUsuario: widget.user.id,
                                            v: 0);
                                        createWorkExp(newWExp);
                                        AddAlert(
                                            "Exito",
                                            "Se ha registrado la experiencia laboral de forma exitosa",
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
