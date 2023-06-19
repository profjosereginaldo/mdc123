import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/store/task_model.dart';

class DbService {
  DbService();

  final _db = FirebaseFirestore.instance;

  Future<List<TaskModel>> listar() {
    return _db.collection("tarefas")
    .get()
    .then((querySnapshot) {
      final tarefas = <TaskModel>[];

      for (var doc in querySnapshot.docs) {
        final dados = doc.data();
        final tarefa =
            TaskModel(nome: dados['nome'], prioridade: dados['prioridade']);
        tarefa.key = doc.id;
        tarefas.add(tarefa);
      }

      return tarefas;
    });
  }

  Future<void> inserir(TaskModel tarefa) async {
    final data = {"nome": tarefa.nome, "prioridade" : tarefa.prioridade};
    await _db.collection("tarefas").add(data).then((documentSnaphost) {
      tarefa.key = documentSnaphost.id;
    });
  }

  Future<void> remover(TaskModel tarefa) async {
    await _db.collection("tarefas").doc(tarefa.key).delete().then((doc) {});
  }
}
