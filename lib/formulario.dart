import 'dart:convert';

import 'package:ejer_repaso_ekir/campo_de_texto.dart';
import 'package:ejer_repaso_ekir/paguina_usuario.dart';
import 'package:ejer_repaso_ekir/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:http/http.dart' as http;

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  final _nombreController = TextEditingController();
  final _contrasennaController = TextEditingController();

  late List<Usuario> usuarios = [];

  String? _validacionNombre(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tu nombre.';
    }
    return null;
  }

  String? _validacionContrasenna(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tu contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  void getData() async {
    String url = "./assets/users.json";

    final String response = await rootBundle.loadString(url);

    for (var data in jsonDecode(response)) {
      usuarios.add(Usuario.fromJson(data));
    }
  }

  void _iniciarSesion() async {
    String nombre = _nombreController.text;
    String contra = _contrasennaController.text;

    Usuario user = Usuario(nombre: nombre, pass: contra);

    for (var usuario in usuarios) {
      if (usuario.nombre == user.nombre && usuario.pass == user.pass) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaguinaUsuario(usuario: user)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.key,
        child: Column(children: [
          CampoDeTexto(
              controlador: _nombreController,
              etiqueta: "Nombre:",
              validacion: _validacionNombre),
          CampoDeTexto(
            controlador: _contrasennaController,
            etiqueta: "Contraseña:",
            validacion: _validacionContrasenna,
            esOculto: true,
          ),
          ElevatedButton(
              onPressed: _iniciarSesion, child: const Text("Iniciar sesion"))
        ]));
  }
}
