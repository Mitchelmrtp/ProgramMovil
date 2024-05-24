import 'package:get/get.dart';
import 'dart:convert';

class Welcome {
  String nombre;
  String apellidos;
  String dni;
  String fechaNacimiento;
  String telefono;
  String correo;

  Welcome({
    required this.nombre,
    required this.apellidos,
    required this.dni,
    required this.fechaNacimiento,
    required this.telefono,
    required this.correo,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    nombre: json["Nombre"],
    apellidos: json["Apellidos"],
    dni: json["DNI"],
    fechaNacimiento: json["Fecha de nacimiento"],
    telefono: json["Telefono"],
    correo: json["Correo"],
  );

  Map<String, dynamic> toJson() => {
    "Nombre": nombre,
    "Apellidos": apellidos,
    "DNI": dni,
    "Fecha de nacimiento": fechaNacimiento,
    "Telefono": telefono,
    "Correo": correo,
  };
}

class AccountController extends GetxController {
  // Ejemplo de datos para la prueba
  Welcome exampleWelcomeData = Welcome(
    nombre: "Juan",
    apellidos: "Pérez",
    dni: "12345678A",
    fechaNacimiento: "01/01/2000",
    telefono: "123456789",
    correo: "juan@example.com",
  );
}
