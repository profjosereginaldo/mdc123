import 'package:flutter/material.dart';
import 'package:myapp/store/task_model.dart';
import 'package:myapp/store/task_store.dart';
import 'package:provider/provider.dart';

class NovoForm extends StatefulWidget {
  const NovoForm({super.key});

  @override
  State<NovoForm> createState() => _NovoFormState();
}

class _NovoFormState extends State<NovoForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  int _prioridade = 1;

  void _changePrioridade(int? value) {
    setState(() {
      _prioridade = value!;
    });
  }

  void _clickSalvar(BuildContext context) {
    final TaskModel tarefa =
        TaskModel(nome: _nomeController.text, prioridade: _prioridade);
    final TaskStore taskStore = Provider.of<TaskStore>(context, listen: false);

    taskStore.addTask(tarefa);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nomeController,
            decoration: const InputDecoration(labelText: "Nome da Tarefa"),
          ),
          const Text("Prioridade"),
          RadioListTile(
            title: const Text("Urgente"),
            value: 1,
            groupValue: _prioridade,
            onChanged: _changePrioridade,
          ),
          RadioListTile(
            title: const Text("Importante"),
            value: 2,
            groupValue: _prioridade,
            onChanged: _changePrioridade,
          ),
          RadioListTile(
            title: const Text("Normal"),
            value: 3,
            groupValue: _prioridade,
            onChanged: _changePrioridade,
          ),
          ElevatedButton(
            onPressed: () => _clickSalvar(context),
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }
}
