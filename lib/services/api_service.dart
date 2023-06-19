import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/store/task_model.dart';

class ApiService {
  const ApiService();

  Future<List<TaskModel>> listar() async {
    List<TaskModel> tarefas = [];
    final url =
        Uri.https("back-mobile-default-rtdb.firebaseio.com", "taks.json");
    final response = await http.get(url);
    final data = json.decode(response.body) as Map<String, dynamic>;
    data.forEach((key, value) {
      final tarefa =
          TaskModel(nome: value['nome'], prioridade: value['prioridade']);
      tarefa.key = key;
      tarefas.add(tarefa);
    });
    return tarefas;
  }

  Future<void> inserir(TaskModel tarefa) async {
    final url =
        Uri.https("back-mobile-default-rtdb.firebaseio.com", "taks.json");
    final response = await http.post(url,
        body: json.encode(
          {'nome': tarefa.nome, 'prioridade': tarefa.prioridade},
        ),
        headers: {'Content-type': 'application/json'});
    final data = json.decode(response.body) as Map<String, dynamic>;
    tarefa.key = data['name'];
  }

  Future<void> remover(TaskModel tarefa) async {   
    final url =
        Uri.parse('https://back-mobile-default-rtdb.firebaseio.com/taks/${tarefa.key}.json');
    await http.delete(url);
  }
}
