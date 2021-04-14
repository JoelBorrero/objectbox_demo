// GENERATED CODE - DO NOT MODIFY BY HAND

// Currently loading model from "JSON" which always encodes with double quotes
// ignore_for_file: prefer_single_quotes
// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'models.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "1:7580165345214755832",
        "lastPropertyId": "4:8839130426312332450",
        "name": "Estudiante",
        "properties": [
          {
            "id": "1:9012412212245961744",
            "name": "nombre",
            "type": 9,
            "dartFieldType": "String?"
          },
          {
            "id": "2:6865316475203650183",
            "name": "carrera",
            "type": 9,
            "dartFieldType": "String?"
          },
          {
            "id": "3:1472956645818649084",
            "name": "semestre",
            "type": 6,
            "dartFieldType": "int?"
          },
          {
            "id": "4:8839130426312332450",
            "name": "id",
            "type": 6,
            "flags": 1,
            "dartFieldType": "int?"
          }
        ],
        "relations": [],
        "backlinks": [],
        "constructorParams": [
          "nombre named",
          "carrera named",
          "semestre named"
        ],
        "nullSafetyEnabled": false
      },
      {
        "id": "2:5595268251112011150",
        "lastPropertyId": "4:4448235051762333008",
        "name": "Materia",
        "properties": [
          {
            "id": "1:1291961005057248540",
            "name": "nombre",
            "type": 9,
            "dartFieldType": "String?"
          },
          {
            "id": "2:4691394791254828554",
            "name": "nrc",
            "type": 9,
            "dartFieldType": "String?"
          },
          {
            "id": "3:2213002813247228906",
            "name": "creditos",
            "type": 6,
            "dartFieldType": "int?"
          },
          {
            "id": "4:4448235051762333008",
            "name": "id",
            "type": 6,
            "flags": 1,
            "dartFieldType": "int?"
          }
        ],
        "relations": [],
        "backlinks": [],
        "constructorParams": ["nombre named", "nrc named", "creditos named"],
        "nullSafetyEnabled": false
      }
    ],
    "lastEntityId": "2:5595268251112011150",
    "lastIndexId": "0:0",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = <Type, EntityDefinition>{};
  bindings[Estudiante] = EntityDefinition<Estudiante>(
      model: model.getEntityByUid(7580165345214755832),
      toOneRelations: (Estudiante object) => [],
      toManyRelations: (Estudiante object) => {},
      getId: (Estudiante object) => object.id,
      setId: (Estudiante object, int id) {
        object.id = id;
      },
      objectToFB: (Estudiante object, fb.Builder fbb) {
        final nombreOffset =
            object.nombre == null ? null : fbb.writeString(object.nombre);
        final carreraOffset =
            object.carrera == null ? null : fbb.writeString(object.carrera);
        fbb.startTable(5);
        fbb.addOffset(0, nombreOffset);
        fbb.addOffset(1, carreraOffset);
        fbb.addInt64(2, object.semestre);
        fbb.addInt64(3, object.id ?? 0);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = Estudiante(
            nombre: const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 4),
            carrera: const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 6),
            semestre:
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8))
          ..id =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);

        return object;
      });
  bindings[Materia] = EntityDefinition<Materia>(
      model: model.getEntityByUid(5595268251112011150),
      toOneRelations: (Materia object) => [],
      toManyRelations: (Materia object) => {},
      getId: (Materia object) => object.id,
      setId: (Materia object, int id) {
        object.id = id;
      },
      objectToFB: (Materia object, fb.Builder fbb) {
        final nombreOffset =
            object.nombre == null ? null : fbb.writeString(object.nombre);
        final nrcOffset =
            object.nrc == null ? null : fbb.writeString(object.nrc);
        fbb.startTable(5);
        fbb.addOffset(0, nombreOffset);
        fbb.addOffset(1, nrcOffset);
        fbb.addInt64(2, object.creditos);
        fbb.addInt64(3, object.id ?? 0);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = Materia(
            nombre: const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 4),
            nrc: const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 6),
            creditos:
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8))
          ..id =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);

        return object;
      });

  return ModelDefinition(model, bindings);
}

class Estudiante_ {
  static final nombre =
      QueryStringProperty(entityId: 1, propertyId: 1, obxType: 9);
  static final carrera =
      QueryStringProperty(entityId: 1, propertyId: 2, obxType: 9);
  static final semestre =
      QueryIntegerProperty(entityId: 1, propertyId: 3, obxType: 6);
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 4, obxType: 6);
}

class Materia_ {
  static final nombre =
      QueryStringProperty(entityId: 2, propertyId: 1, obxType: 9);
  static final nrc =
      QueryStringProperty(entityId: 2, propertyId: 2, obxType: 9);
  static final creditos =
      QueryIntegerProperty(entityId: 2, propertyId: 3, obxType: 6);
  static final id =
      QueryIntegerProperty(entityId: 2, propertyId: 4, obxType: 6);
}
