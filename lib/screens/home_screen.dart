import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/store/user_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _exitApp(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context, listen: false);
    userStore.logout();

    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
     UserStore userStore = Provider.of<UserStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => _exitApp(context),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        return Text(userStore.email);
      }),
    );
  }
}
