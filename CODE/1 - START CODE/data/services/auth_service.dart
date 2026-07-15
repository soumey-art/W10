import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/auth_session.dart';
import '../../model/user.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({
    required String name,
    required String email, 
    required String password,
    }) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");

    // 1- Create the JSON body
    Map<String, dynamic> body = {"email": email, "password": password};

    // 2- Send POST request
    final response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    // 3- Decode the JSON response
    final json = jsonDecode(response.body);

    // 4- If login failed
    if (response.statusCode != 200) {
      throw AuthException(json["message"]);
    }

    // 5- Get token and user
    String token = json["token"];
    User user = User.fromJSon(json["user"]);

    // 6- Save the session
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
