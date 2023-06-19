import 'package:flutter/material.dart';
import 'package:myapp/screens/novo_form.dart';

class NovoScreen extends StatelessWidget {
  const NovoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova tarefa"),),
      body: const NovoForm(),
    );
  }
}