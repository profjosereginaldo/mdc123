import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/store/task_store.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskStore = Provider.of<TaskStore>(context, listen: false);

    return Observer(builder: (context) {
      return taskStore.loading ? const CircularProgressIndicator()
      : ListView.builder(
        itemCount: taskStore.tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = taskStore.tarefas[index];

          return ListTile(
            title: Text(tarefa.nome),
            subtitle: Text("Prioridade ${tarefa.prioridade}"),
            trailing: IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Deseja remover a tarefa?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                              onPressed: () {
                                taskStore.removeTask(index);
                                Navigator.pop(context);
                              },
                              child: const Text('Remover'))
                        ],
                      )),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      );
    });
  }
}
