class Usuario {
  String nombre; 
  String pass; 

  Usuario({
    required this.nombre,
    required this.pass,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombre: json['nombre'],
      pass: json['pass'],
     
    );
  }
}