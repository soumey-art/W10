import 'dart:convert';

import 'package:authentication_app/CODE/1%20-%20START%20CODE/model/user.dart';
import 'package:http/http.dart' as http;

import '../../model/auth_session.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({required String name, required String password, required String email}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");

    // 1- Create the JSON body with the name and password
    Map<String, dynamic> body = {"email": email, "password": password};
    // 2- Fetch the POST/login
    final response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    // 3- Decode the json
    final json = jsonDecode(response.body);
    // 4 - If failed, throw a AuthException
    if (response.statusCode != 200) {
      throw AuthException(json["erro"] ?? "Login failed");
    }
    // 5 -  Get the token
    String token = json["token"];
    // 5 -  Get the user
    User user = User.fromJSon(json["user"]);
    // 6 - Update the session
    session = AuthSession(token: token, user: user);
  }

  void logout() {
    session = null;
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
  @override
  String toString() {
    return message;
  }
}
