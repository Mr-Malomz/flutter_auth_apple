import 'package:appwrite/appwrite.dart';
import 'package:flutter_auth_apple/utils.dart';

class AuthService {
  Client _client = Client();
  late Account _account;

  AuthService() {
    _init();
  }

  //initialize the application
  _init() async {
    _client
        .setEndpoint(AppConstant().endpoint)
        .setProject(AppConstant().projectId);

    _account = Account(_client);
  }

  Future loginWithApple() async {
    try {
      return await _account.createOAuth2Session(provider: 'apple');
    } catch (e) {
      throw Exception('Error login into Apple!');
    }
  }
}
