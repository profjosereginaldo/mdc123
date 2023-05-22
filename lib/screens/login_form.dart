import 'package:flutter/material.dart';
import 'package:myapp/store/user_store.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _keyForm = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email é obrigatório";
    }

    if (!value.contains('@')) {
      return "Email inválido";
    }

    return null;
  }

  String? _validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return "Senha é obrigatória";
    }

    if (value.length < 8) {
      return "Senha deve ter no mínimo 8 caracters";
    }

    return null;
  }

  void _submitForm(BuildContext context) {
    if (!_keyForm.currentState!.validate()) {
      return;
    }

    UserStore userStore = Provider.of<UserStore>(context, listen: false);
    userStore.login(_emailController.text);

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 24.0),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
            validator: _validateEmail,
          ),
          TextFormField(
            controller: _senhaController,
            decoration: const InputDecoration(labelText: "Senha"),
            obscureText: false,
            validator: _validateSenha,
          ),
          ElevatedButton(
            onPressed: () => _submitForm(context),
            child: const Text("Enviar"),
          ),
        ],
      ),
    );
  }
}
