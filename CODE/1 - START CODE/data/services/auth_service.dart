 
import '../../model/auth_session.dart';
 
class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({required String name, required String password}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");


    // 1- Create the JSON body with the name and password
   
    // 2- Fetch the POST/login

    // 3- Decode the json

    // 4 - If failed, throw a AuthException

    // 5 -  Get the token
    // 5 -  Get the user

    // 6 - Update the session

     
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
