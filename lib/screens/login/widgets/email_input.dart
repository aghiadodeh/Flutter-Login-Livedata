import 'package:flutter/material.dart';
import 'package:flutter_login_state_managment/singleton/signleton.dart';
import 'package:flutter_login_state_managment/viewmodels/login_viewmodel.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';

import '../../../models/auth_models/email.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getSingleton<LoginViewModel>();
    return LiveDataBuilder<Email>(
      data: viewModel.loginParams.email,
      builder: (_, email) {
        return TextFormField(
          key: const Key("login_email"), // keep the input value when rebuild
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter Your Email",
            errorText: email.value.isNotEmpty ? email.error?.name : null,
          ),
          onChanged: (value) => viewModel.emailChanged(value), // update login-prarms email value
        );
      },
    );
  }
}
