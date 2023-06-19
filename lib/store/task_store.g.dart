// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on TaskStoreBase, Store {
  late final _$tarefasAtom =
      Atom(name: 'TaskStoreBase.tarefas', context: context);

  @override
  ObservableList<TaskModel> get tarefas {
    _$tarefasAtom.reportRead();
    return super.tarefas;
  }

  @override
  set tarefas(ObservableList<TaskModel> value) {
    _$tarefasAtom.reportWrite(value, super.tarefas, () {
      super.tarefas = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'TaskStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loadTaskAsyncAction =
      AsyncAction('TaskStoreBase.loadTask', context: context);

  @override
  Future<void> loadTask() {
    return _$loadTaskAsyncAction.run(() => super.loadTask());
  }

  late final _$addTaskAsyncAction =
      AsyncAction('TaskStoreBase.addTask', context: context);

  @override
  Future<void> addTask(TaskModel tarefa) {
    return _$addTaskAsyncAction.run(() => super.addTask(tarefa));
  }

  late final _$removeTaskAsyncAction =
      AsyncAction('TaskStoreBase.removeTask', context: context);

  @override
  Future<void> removeTask(int index) {
    return _$removeTaskAsyncAction.run(() => super.removeTask(index));
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas},
loading: ${loading}
    ''';
  }
}
