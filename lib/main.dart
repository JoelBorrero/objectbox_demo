import 'models.dart';
import 'database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

List<Estudiante> _estudiantes = [];
Estudiante editing;
void _load() async {
  _estudiantes = await getEstudiantes();
}

_goToPage(int page) {
  _mainController.animateToPage(page,
      duration: Duration(milliseconds: 800), curve: Curves.bounceInOut);
}

PageController _mainController = PageController();

class _DemoState extends State<Demo> {
  TextEditingController _nombreController = TextEditingController(),
      _carreraController = TextEditingController(),
      _semestreController = TextEditingController();
  @override
  void initState() {
    super.initState();
    load();
    _load();
  }

  @override
  void dispose() {
    store?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DEMO ObjectBox',
        home: Scaffold(
            appBar: AppBar(title: Text('CRUD ObjectBox'), centerTitle: true),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: PageView(
                  controller: _mainController,
                  onPageChanged: (_) => _reload(),
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ListView.builder(
                        itemCount: _estudiantes.length,
                        itemBuilder: (builder, i) => ExpansionTile(
                                title: Text(_estudiantes[i].nombre),
                                subtitle: Text(_estudiantes[i].carrera),
                                trailing: Text(_estudiantes[i].id.toString()),
                                children: [
                                  Text(
                                      'Estudia ${_estudiantes[i].carrera} y está en ${_estudiantes[i].semestre} semestre'),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton.icon(
                                            onPressed: () {
                                              editing = _estudiantes[i];
                                              _nombreController.text =
                                                  editing.nombre;
                                              _carreraController.text =
                                                  editing.carrera;
                                              _semestreController.text =
                                                  editing.semestre.toString();
                                              _goToPage(1);
                                            },
                                            icon: Icon(Icons.edit),
                                            label: Text('Editar'),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                        ElevatedButton.icon(
                                            onPressed: () {
                                              delete(_estudiantes[i]);
                                              _reload();
                                            },
                                            icon: Icon(Icons.delete),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                primary: Colors.red[800]),
                                            label: Text('Eliminar'))
                                      ])
                                ])),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                              controller: _nombreController,
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Nombre')),
                          TextField(
                              controller: _carreraController,
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Carrera')),
                          TextField(
                              controller: _semestreController,
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Semestre'),
                              keyboardType: TextInputType.number),
                          ElevatedButton.icon(
                              onPressed: () {
                                FocusManager.instance.primaryFocus.unfocus();
                                if (editing == null) {
                                  create(Estudiante(
                                      nombre: _nombreController.text,
                                      carrera: _carreraController.text,
                                      semestre: int.tryParse(
                                          _semestreController.text)));
                                } else {
                                  editing.nombre = _nombreController.text;
                                  editing.carrera = _carreraController.text;
                                  editing.semestre =
                                      int.tryParse(_semestreController.text);
                                  update(editing);
                                }
                                _nombreController.clear();
                                _carreraController.clear();
                                _semestreController.clear();
                                _goToPage(0);
                              },
                              icon: Icon(Icons.person_add),
                              label: Text(editing == null
                                  ? 'Añadir estudiante'
                                  : 'Editar estudiante')),
                          TextButton(
                              child: Text('Cancelar'),
                              onPressed: () {
                                FocusManager.instance.primaryFocus.unfocus();
                                editing = null;
                                _goToPage(0);
                              })
                        ])
                  ]),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.person_add), onPressed: () => _goToPage(1))),
        debugShowCheckedModeBanner: false);
  }

  void _reload() async {
    setState(() {});
    _estudiantes = await getEstudiantes();
  }
}

InputDecoration textInputDecoration = InputDecoration(
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.blue[800])));
