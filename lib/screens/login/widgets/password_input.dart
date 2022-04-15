import 'package:flutter/material.dart';
import 'package:flutter_login_state_managment/singleton/signleton.dart';
import 'package:flutter_login_state_managment/viewmodels/login_viewmodel.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';

import '../../../models/auth_models/password.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getSingleton<LoginViewModel>();
    return LiveDataBuilder<Password>(
      data: viewModel.loginParams.password,
      builder: (_, password) {
        return TextFormField(
          key: const Key("login_password"), // keep the input value when rebuild
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter Your Password",
            errorText: password.value.isNotEmpty ? password.error?.name : null,
          ),
          onChanged: (value) => viewModel.passwordChanged(value), // update login-prarms password value
        );
      },
    );
  }
}
