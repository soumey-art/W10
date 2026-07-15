import 'package:flutter/material.dart';
import 'auth_screen.dart';
import '../data/services/auth_service.dart';
import 'scores_screen.dart';
 
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
 
  void onLogin()  {
       setState(() {});
  }

  Widget get content {
     final session = AuthenticationService.instance.session;
    // if logged in -> Display ScoresScreen
    if (session != null) {
      return ScoresScreen();
    }
    // otherwise -> DisplayAuthScreen
    else {
      return AuthScreen(onLogin: onLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
