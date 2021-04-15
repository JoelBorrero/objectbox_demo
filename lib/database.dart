import 'dart:io';
import 'models.dart';
import 'objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

Store store;

Future<void> load() async {
  await getApplicationDocumentsDirectory().then((Directory dir) {
    store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
  });
}

//CREATE
void create(element) {
  final box = store.box<Estudiante>();
  int id = box.put(element);
  print('Agregado $id');
}

//READ
Future<List<Estudiante>> getEstudiantes() async {
  if (store == null) {
    await load();
  }
  final box = store.box<Estudiante>();
  return box.getAll();
}

//UPDATE
void update(element) {
  final box = store.box<Estudiante>();
  box.put(element);
}

//DELETE
void delete(element) {
  final box = store.box<Estudiante>();
  bool _deleted = box.remove(element.id);
  print(_deleted ? 'Se ha borrado con éxito' : 'No se pudo borrar');
}
