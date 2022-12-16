class Login{
  late String response;
  late bool login;
  late Usuario usuario;

  Login({required this.response, required this.login, required this.usuario});

  factory Login.fromJson(Map<String, dynamic> json){
    return Login(
        response: json["response"],
        login: json["login"],
        usuario: Usuario.fromJson(json["usuario"]));
  }
}

class Usuario{
  late String id;
  late String username;
  late String nombre;
  late String apepat;
  late String apemat;
  late String email;

  Usuario({
    required this.id,
    required this.username,
    required this.nombre,
    required this.apepat,
    required this.apemat,
    required this.email,
  });

  factory Usuario.fromJson(Map<String, dynamic> json){
    return Usuario(
      id: json["_id"],
      username: json["username"],
      nombre: json["nombre"],
      apepat: json["apepat"],
      apemat: json["apemat"],
      email: json["email"],
    );
  }
}

class Proyecto{
  late String id;
  late String nombre;
  late String fechaDeIngreso;
  late Progreso progreso;

  Proyecto({required this.id, required this.nombre, required this.fechaDeIngreso, required this.progreso});

  factory Proyecto.fromJson(Map<String, dynamic> json){
    return Proyecto(
      id: json["_id"],
      nombre: json["nombre"],
      fechaDeIngreso: json["fecha_de_ingreso"],
      progreso: Progreso.fromJson(json["progreso"]),
    );
  }

  factory Proyecto.fromNombre(String nombre){
    return Proyecto(
        id: "",
        nombre: nombre,
        fechaDeIngreso: "",
        progreso: Progreso.empty(),
      );
  }

  Map<String, dynamic> toJson(){
    return {
      "nombre": nombre,
      "progreso": progreso.toJson(),
    };
  }

}

class Progreso {
  late String id;
  late int progresoRequisitos;
  late int progresoDiseno;
  late int progresoCodigo;
  late int progresoPruebas;

  Progreso({
    required this.id,
    required this.progresoRequisitos,
    required this.progresoDiseno,
    required this.progresoCodigo,
    required this.progresoPruebas,
  });

  factory Progreso.fromJson(Map<String, dynamic> json){
    return Progreso(
      id: json["_id"],
      progresoRequisitos: json["progreso_requisitos"],
      progresoDiseno: json["progreso_diseno"],
      progresoCodigo: json["progreso_codigo"],
      progresoPruebas: json["progreso_pruebas"],
    );
  }

  factory Progreso.empty(){
    return Progreso(
      id: "",
      progresoRequisitos: 0,
      progresoDiseno: 0,
      progresoCodigo: 0,
      progresoPruebas: 0,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "progreso_requisitos": progresoRequisitos,
      "progreso_diseno": progresoDiseno,
      "progreso_codigo": progresoCodigo,
      "progreso_pruebas": progresoPruebas,
    };
  }

}
