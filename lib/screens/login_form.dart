import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

  Future<void> _submitForm(BuildContext context, UserStore userStore) async {
    if (!_keyForm.currentState!.validate()) {
      return;
    }

    final response = await userStore.login(_emailController.text, _senhaController.text);

    if (!response) return;

    if (context.mounted) Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context, listen: false);

    return Form(
      key: _keyForm,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
            validator: _validateEmail,
          ),
          TextFormField(
            controller: _senhaController,
            decoration: const InputDecoration(labelText: "Senha"),
            obscureText: true,
            validator: _validateSenha,
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () => _submitForm(context, userStore),
            child: const Text("Enviar"),
          ),
          const SizedBox(height: 8.0),
          Observer(builder: (_) {
            return Text(userStore.erroLogin);
          })
        ],
      ),
    );
  }
}
