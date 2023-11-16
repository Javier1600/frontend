// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';

import 'package:frontend/services/company.services.dart';

class companySignIn extends StatefulWidget {
  const companySignIn({super.key});

  @override
  State<companySignIn> createState() => _companySignInState();
}

class _companySignInState extends State<companySignIn> {
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
  //Variable para controlar el registro en caso de usuario repetido
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
    super.initState();
  }

  void signInAlert(String title, String mensaje, bool navigate) {
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
                  Navigator.pushNamed(context, 'companyLogInPage');
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

  bool ValidatePassword(String password) {
    RegExp regExp =
        RegExp(r'^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])');
    return regExp.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        foregroundColor: Color.fromRGBO(1, 167, 211, 1),
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
                          "Registro de nueva empresa",
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
                          TextField(
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
                          TextField(
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
                          TextField(
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
                          TextField(
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
                          TextField(
                            minLines: 1,
                            maxLines: 10,
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
                                        signInAlert(
                                            "Error",
                                            "El nombre de usuario ya se encuentra registrado",
                                            false);
                                      } else {
                                        if (password == confirmPassword) {
                                          if (ValidatePassword(password)) {
                                            if (password.length >= 8) {
                                              String encryptedPassword = md5
                                                  .convert(
                                                      utf8.encode(password))
                                                  .toString();
                                              Company newCompany = Company(
                                                  id: '',
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
                                              createcompany(newCompany);
                                              signInAlert(
                                                  "Exito",
                                                  "Se ha registrado la empresa de forma exitosa",
                                                  true);
                                            } else {
                                              signInAlert(
                                                  "Error",
                                                  "La contraseña debe contener almenos 8 caractéres",
                                                  false);
                                            }
                                          } else {
                                            signInAlert(
                                                "Error",
                                                "La contraseña debe contener almenos un número, una letra mayúscula y un caracter especial (!@#\$%^&*()?)",
                                                false);
                                          }
                                        } else {
                                          signInAlert(
                                              "Error",
                                              "Las contraseñas deben coincidir",
                                              false);
                                        }
                                      }
                                    } else {
                                      //Muestro una alerta pidiendo ingresar todos los campos
                                      signInAlert(
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
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
