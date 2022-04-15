import 'package:flutter/material.dart';
import 'package:flutter_login_state_managment/network/managers/authentication_manager.dart';
import 'package:flutter_login_state_managment/screens/login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: InkWell(
            child: const Text("Logout"),
            onTap: () async {
              await AuthenticationManager.logOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
