import 'package:mobx/mobx.dart';
import 'package:myapp/services/api_service.dart';
import 'package:myapp/services/db_service.dart';
import 'package:myapp/store/task_model.dart';

part 'task_store.g.dart';

class TaskStore = TaskStoreBase with _$TaskStore;

abstract class TaskStoreBase with Store {
  final _service = const ApiService();
  final _database = DbService();

  @observable
  ObservableList<TaskModel> tarefas = <TaskModel>[].asObservable();

  @observable
  bool loading = false;

  @action
  Future<void> loadTask() async {
    loading = true;
    tarefas.clear();
   final data = await _database.listar();
   tarefas.addAll(data);
    loading = false;
  }

  @action
  Future<void> addTask(TaskModel tarefa) async {
   await _database.inserir(tarefa);
    tarefas.add(tarefa);
  }

  @action
  Future<void> removeTask(int index) async {
   await _database.remover(tarefas[index]);
    tarefas.removeAt(index);
  }
}
