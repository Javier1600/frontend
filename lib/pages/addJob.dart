// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names, must_be_immutable, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/jobs.dart';
import 'package:frontend/pages/addViewJobs.dart';
import 'package:frontend/services/jobs.services.dart';

class AddJob extends StatefulWidget {
  Company company;
  AddJob(this.company, {super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  //Variable que contiene todos los usuarios actuales de la base
  late Future<List<Job>> jobs;
  //Variable para iterar la lista de usuarios de la base
  List<Job>? jList = [];
  //Variables para los valores de los campo
  String puesto = '';
  String descripcion = '';
  String formacionAcademica = '';
  String experiencia = '';
  String conocimientos = '';
  String aptitudes = '';
  String modalidad = '';
  String numeroVacantes = '1';
  //Variables para seleccionar la modalidad
  bool isVirtual = false;
  bool isPresential = false;
  bool isHybride = false;
  //Variable para controlar el registro en caso de usuario repetido
  bool publishedJob = false;
  @override
  void initState() {
    jobs = getCompanyPublishedJobs(widget.company.id);
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
                    return RegisteredJobs(widget.company);
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
          future: jobs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              jList = snapshot.data;
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
                          "Publicar nuevo Empleo",
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
                            'Puesto',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Gerente, Pasante...',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(Icons.account_circle_outlined)),
                            onChanged: (valor) => setState(() {
                              puesto = valor;
                            }),
                          ),
                          Text(
                            'Vacantes disponibles',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            initialValue: numeroVacantes,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              icon: Icon(Icons.numbers_outlined),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (valor) {
                              numeroVacantes = valor;
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
                              hintText: 'Responsabilidades a cargo',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.description_outlined),
                            ),
                            onChanged: (valor) => setState(() {
                              descripcion = valor;
                            }),
                          ),
                          Text(
                            'Formación académica requerida',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Matemáticas, estadística',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.school_outlined),
                            ),
                            onChanged: (valor) => setState(() {
                              formacionAcademica = valor;
                            }),
                          ),
                          Text(
                            'Conocimientos requeridos',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Ofice365',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.person_search_outlined),
                            ),
                            onChanged: (valor) => setState(() {
                              conocimientos = valor;
                            }),
                          ),
                          Text(
                            'Experiencia requerida',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Gestión de proyectos',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.person_search_outlined),
                            ),
                            onChanged: (valor) => setState(() {
                              experiencia = valor;
                            }),
                          ),
                          Text(
                            'Aptitudes necesarias',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Resolución de problemas',
                              icon: Icon(Icons.person_search_outlined),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (valor) {
                              aptitudes = valor;
                            },
                          ),
                          Text(
                            'Modalidad',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: isPresential,
                                      activeColor:
                                          Color.fromRGBO(226, 144, 32, 1),
                                      onChanged: (newBool) {
                                        setState(() {
                                          isPresential = newBool!;
                                          if (isPresential) {
                                            isVirtual = !isPresential;
                                            isHybride = !isPresential;
                                            modalidad = "Presencial";
                                          } else if (isVirtual) {
                                            modalidad = "Virtual";
                                          } else if (isHybride) {
                                            modalidad = "Híbrida";
                                          } else {
                                            modalidad = "";
                                          }
                                          print(modalidad);
                                        });
                                      }),
                                  Text(
                                    "Presencial",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17.0,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: isVirtual,
                                        activeColor:
                                            Color.fromRGBO(226, 144, 32, 1),
                                        onChanged: (newBool) {
                                          setState(() {
                                            isVirtual = newBool!;
                                            if (isVirtual) {
                                              isPresential = !isVirtual;
                                              isHybride = !isVirtual;
                                              modalidad = "Virtual";
                                            } else if (isPresential) {
                                              modalidad = "Presencial";
                                            } else if (isHybride) {
                                              modalidad = "Híbrida";
                                            } else {
                                              modalidad = "";
                                            }
                                            print(modalidad);
                                          });
                                        }),
                                    Text(
                                      "Virtual",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17.0,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                  value: isHybride,
                                  activeColor: Color.fromRGBO(226, 144, 32, 1),
                                  onChanged: (newBool) {
                                    setState(() {
                                      isHybride = newBool!;
                                      if (isHybride) {
                                        isPresential = !isHybride;
                                        isVirtual = !isHybride;
                                        modalidad = "Híbrida";
                                      } else if (isVirtual) {
                                        modalidad = "Virtual";
                                      } else if (isPresential) {
                                        modalidad = "Presencial";
                                      } else {
                                        modalidad = "";
                                      }
                                      print(modalidad);
                                    });
                                  }),
                              Text(
                                "Híbrida",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    //Verifico que se ingresaron todos los campos
                                    if (puesto != "" &&
                                        descripcion != '' &&
                                        formacionAcademica != '' &&
                                        conocimientos != '' &&
                                        experiencia != '' &&
                                        aptitudes != '' &&
                                        modalidad != '' &&
                                        numeroVacantes != '') {
                                      Job newJob = Job(
                                          id: "0",
                                          puesto: puesto,
                                          idEmpresa: widget.company.id,
                                          descripcion: descripcion,
                                          formacionAcademica:
                                              formacionAcademica,
                                          experiencia: experiencia,
                                          conocimientos: conocimientos,
                                          aptitudes: aptitudes,
                                          modalidad: modalidad,
                                          numeroVacantes: numeroVacantes,
                                          v: 0);
                                      createJob(newJob);
                                      AddAlert(
                                          "Exito",
                                          "Se ha publicado el empleo de forma exitosa",
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
