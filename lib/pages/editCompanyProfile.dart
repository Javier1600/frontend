// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last, must_be_immutable, non_constant_identifier_names, prefer_void_to_null
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:frontend/pages/companyProfile.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';

import 'package:frontend/services/company.services.dart';

class EditCompanyProfile extends StatefulWidget {
  Company reqCompany;
  EditCompanyProfile(this.reqCompany, {super.key});

  @override
  State<EditCompanyProfile> createState() => _EditCompanyProfileState();
}

class _EditCompanyProfileState extends State<EditCompanyProfile> {
  //Variable que contiene todos los usuarios actuales de la base
  late Future<List<Company>> users;
  //Variable para iterar la lista de usuarios de la base
  List<Company>? cList = [];
  //Variables para los valores de los campo
  String nombreEmpresa = '';
  String correo = '';
  String direccion = '';
  String telefono = '';
  String descripcion = '';
  String valores = '';
  String rol = 'Empresa';
  String usuario = '';
  String password = '';
  String confirmPassword = '';
  //Variable para controlar la edicion en caso de usuario repetido
  bool registeredCompany = false;
  //Mascara del campo telefono
  var phoneMaskFormatter = MaskTextInputFormatter(
      mask: '##########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  //Variable para el control de la contra y la confirmacion de contra
  bool passwordVisible = true;
  bool confPassVisible = true;
  @override
  void initState() {
    users = getAllCompanies();
    nombreEmpresa = widget.reqCompany.nombreEmpresa;
    correo = widget.reqCompany.correo;
    direccion = widget.reqCompany.direccion;
    telefono = widget.reqCompany.telefono;
    descripcion = widget.reqCompany.descripcion;
    valores = widget.reqCompany.valores;
    rol = widget.reqCompany.rol;
    usuario = widget.reqCompany.usuario;
    super.initState();
  }

  void EditAlert(
      String title, String mensaje, bool navigate, Company editedCompany) {
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
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return CompanyProfile(editedCompany);
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
        foregroundColor: Color.fromRGBO(226, 144, 32, 1),
      ),
      body: FutureBuilder(
          future: users,
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
                          "Editar empresa",
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
                            'Nombre de la empresa',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            initialValue: nombreEmpresa,
                            decoration: InputDecoration(
                                hintText: 'Nombre de la empresa',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(Icons.account_circle_outlined)),
                            onChanged: (valor) => setState(() {
                              nombreEmpresa = valor;
                            }),
                          ),
                          Text(
                            'Correo',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            initialValue: correo,
                            decoration: InputDecoration(
                              hintText: 'correo@dominio.com',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.mail_outline),
                            ),
                            onChanged: (valor) => setState(() {
                              correo = valor;
                            }),
                          ),
                          Text(
                            'Dirección',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            initialValue: direccion,
                            decoration: InputDecoration(
                              hintText: 'Calle 1 y Calle 2',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.location_on_outlined),
                            ),
                            onChanged: (valor) => setState(() {
                              direccion = valor;
                            }),
                          ),
                          Text(
                            'Número de teléfono',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            initialValue: telefono,
                            keyboardType: TextInputType.number,
                            inputFormatters: [phoneMaskFormatter],
                            decoration: InputDecoration(
                              hintText: '0987654321',
                              icon: Icon(Icons.numbers),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (valor) {
                              telefono = valor;
                            },
                          ),
                          Text(
                            'Descripción',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            initialValue: descripcion,
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Empresa dedicada a...',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.description_outlined),
                            ),
                            onChanged: (valor) => setState(() {
                              descripcion = valor;
                            }),
                          ),
                          Text(
                            'Valores esperados de sus empleados',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            initialValue: valores,
                            minLines: 1,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: 'Respeto, puntualidad...',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.person_search_rounded),
                            ),
                            onChanged: (valor) => setState(() {
                              valores = valor;
                            }),
                          ),
                          Text(
                            'Nombre de usuario',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            initialValue: usuario,
                            decoration: InputDecoration(
                              hintText: 'compania123',
                              icon: Icon(Icons.supervisor_account),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (valor) {
                              usuario = valor;
                            },
                          ),
                          Text(
                            'Contraseña',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              icon: Icon(Icons.password),
                              hintText: 'Contraseña',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),
                            onChanged: (valor) => setState(() {
                              password = valor;
                            }),
                          ),
                          Text(
                            'Confirmar contraseña',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: confPassVisible,
                            decoration: InputDecoration(
                              icon: Icon(Icons.password),
                              hintText: 'Contraseña',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(confPassVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    confPassVisible = !confPassVisible;
                                  });
                                },
                              ),
                            ),
                            onChanged: (valor) => setState(() {
                              confirmPassword = valor;
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
                                    if (nombreEmpresa != '' &&
                                        correo != '' &&
                                        direccion != '' &&
                                        telefono != '' &&
                                        descripcion != '' &&
                                        valores != '' &&
                                        usuario != '' &&
                                        password != '' &&
                                        confirmPassword != '') {
                                      //Verifica si el usuario ingresado existe
                                      for (Company c in cList!) {
                                        if (c.usuario != usuario) {
                                          registeredCompany = false;
                                        } else {
                                          registeredCompany = true;
                                        }
                                      }
                                      if (registeredCompany) {
                                        EditAlert(
                                            "Error",
                                            "El nombre de usuario ya se encuentra registrado",
                                            false,
                                            widget.reqCompany);
                                      } else {
                                        //Verifico que la nueva contraseña sea diferente a la actual
                                        if (md5
                                                .convert(utf8.encode(password))
                                                .toString() !=
                                            widget.reqCompany.password) {
                                          if (password == confirmPassword) {
                                            String encryptedPassword = md5
                                                .convert(utf8.encode(password))
                                                .toString();
                                            Company editedCompany = Company(
                                                id: widget.reqCompany.id,
                                                nombreEmpresa: nombreEmpresa,
                                                correo: correo,
                                                direccion: direccion,
                                                telefono: telefono,
                                                descripcion: descripcion,
                                                valores: valores,
                                                rol: rol,
                                                usuario: usuario,
                                                password: encryptedPassword,
                                                confirmPassword:
                                                    encryptedPassword,
                                                v: 0);
                                            editCompany(editedCompany);
                                            EditAlert(
                                                "Exito",
                                                "Se ha actualizado la empresa de forma exitosa",
                                                true,
                                                editedCompany);
                                          } else {
                                            EditAlert(
                                                "Error",
                                                "Las contraseñas deben coincidir",
                                                false,
                                                widget.reqCompany);
                                          }
                                        } else {
                                          EditAlert(
                                              "Error",
                                              "La nueva contraseña no puede ser igual a la actual",
                                              false,
                                              widget.reqCompany);
                                        }
                                      }
                                    } else {
                                      //Verifico si los campos de contra estan vacios para consevar la contra anterior
                                      if (nombreEmpresa != '' &&
                                          correo != '' &&
                                          direccion != '' &&
                                          telefono != '' &&
                                          descripcion != '' &&
                                          valores != '' &&
                                          usuario != '' &&
                                          password == '' &&
                                          confirmPassword == '') {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Campo contraseña vacío!",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "¿Desea mantener la contraseña actual?",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          Company editedCompany = Company(
                                                              id: widget
                                                                  .reqCompany
                                                                  .id,
                                                              nombreEmpresa:
                                                                  nombreEmpresa,
                                                              correo: correo,
                                                              direccion:
                                                                  direccion,
                                                              telefono:
                                                                  telefono,
                                                              descripcion:
                                                                  descripcion,
                                                              valores: valores,
                                                              rol: rol,
                                                              usuario: usuario,
                                                              password: widget
                                                                  .reqCompany
                                                                  .password,
                                                              confirmPassword: widget
                                                                  .reqCompany
                                                                  .confirmPassword,
                                                              v: 0);
                                                          editCompany(
                                                              editedCompany);
                                                          EditAlert(
                                                              "Exito",
                                                              "Se ha actualizado la empresa de forma exitosa",
                                                              true,
                                                              editedCompany);
                                                        },
                                                        child: Text(
                                                          'Mantener',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      1,
                                                                      167,
                                                                      211,
                                                                      1),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white70),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          'Cambiar',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      1,
                                                                      167,
                                                                      211,
                                                                      1),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white70),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              );
                                            });
                                      } else {
                                        //Muestro una alerta pidiendo ingresar todos los campos
                                        EditAlert(
                                            "Error",
                                            "Ingrese todos los campos solicitados",
                                            false,
                                            widget.reqCompany);
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Guardar',
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
