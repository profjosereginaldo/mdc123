import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/screens/home_list.dart';
import 'package:myapp/store/task_store.dart';
import 'package:myapp/store/user_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _exitApp(BuildContext context, UserStore userStore) {
    userStore.logout();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context, listen: false);
    final taskStore = Provider.of<TaskStore>(context, listen: false);
    
    taskStore.loadTask(); 
    
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(userStore.email);
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => _exitApp(context, userStore),
          ),
        ],
      ),
      body: const HomeList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/novo"),
        child: const Icon(Icons.add),
      ),
    );
  }
}
