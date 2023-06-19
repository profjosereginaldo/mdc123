// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  Computed<bool>? _$logadoComputed;

  @override
  bool get logado => (_$logadoComputed ??=
          Computed<bool>(() => super.logado, name: 'UserStoreBase.logado'))
      .value;

  late final _$emailAtom = Atom(name: 'UserStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$erroLoginAtom =
      Atom(name: 'UserStoreBase.erroLogin', context: context);

  @override
  String get erroLogin {
    _$erroLoginAtom.reportRead();
    return super.erroLogin;
  }

  @override
  set erroLogin(String value) {
    _$erroLoginAtom.reportWrite(value, super.erroLogin, () {
      super.erroLogin = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('UserStoreBase.login', context: context);

  @override
  Future<bool> login(String email, String senha) {
    return _$loginAsyncAction.run(() => super.login(email, senha));
  }

  late final _$logoutAsyncAction =
      AsyncAction('UserStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
email: ${email},
erroLogin: ${erroLogin},
logado: ${logado}
    ''';
  }
}
