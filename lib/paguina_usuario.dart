import 'package:ejer_repaso_ekir/usuario.dart';
import 'package:flutter/material.dart';

class PaguinaUsuario extends StatefulWidget {
  final Usuario usuario;
  const PaguinaUsuario({super.key, required this.usuario});

  @override
  State<PaguinaUsuario> createState() => _PaguinaUsuarioState();
}

class _PaguinaUsuarioState extends State<PaguinaUsuario> {
void volver(){
  Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: TabBar(tabs: []),
      body: Column(
        children: [
          Center(
            child: Text(widget.usuario.nombre),
          ),
          ElevatedButton(onPressed: volver, child: Text("volver"))
        ],
      ),
    );
  }
}
