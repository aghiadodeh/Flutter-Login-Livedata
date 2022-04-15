import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';

import '../../../models/auth_models/email.dart';
import '../../../models/auth_models/password.dart';
import '../../../singleton/signleton.dart';
import '../../../viewmodels/login_viewmodel.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getSingleton<LoginViewModel>();
    return CombinedLiveDataBuilder.with2<Email, Password, bool>(
      x1: viewModel.loginParams.email,
      x2: viewModel.loginParams.password,
      transform: (email, password) => email.valid && password.valid,
      builder: (_, valid) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text("Login"),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(valid ? Colors.blue : Colors.grey),
            ),
            onPressed: () {
              if (!valid) return;
              viewModel.login();
            },
          ),
        );
      },
    );
  }
}
