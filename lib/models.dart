import 'package:objectbox/objectbox.dart';

@Entity()
class Estudiante {
  String nombre;
  String carrera;
  int semestre;
  int id;
  Estudiante({this.nombre, this.carrera, this.semestre});
}

@Entity()
class Materia {
  String nombre;
  String nrc;
  int creditos;
  int id;
  Materia({this.nombre, this.nrc, this.creditos});
}
