import 'package:mobx/mobx.dart';
import 'package:myapp/services/firebase_service.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final _service = FirebaseService();

  @computed
  bool get logado => email.isNotEmpty;

  @observable
  String email = "";

  @observable
  String erroLogin = "";

  @action
  Future<bool> login(String email, String senha) async {
    try {
      await _service.login(email, senha);
      this.email = email;
      erroLogin = "";
      return true;
    } catch (e) {
      erroLogin = e.toString();
      this.email = "";
      return false;
    }
  }

  @action
  Future<void> logout() async {
    await _service.logout();
    email = "";
  }
}
