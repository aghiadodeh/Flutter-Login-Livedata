import 'package:flutter/material.dart';
import 'package:flutter_login_state_managment/main.dart';
import 'package:flutter_login_state_managment/screens/home/home_screen.dart';

import '../../../../network/managers/authentication_manager.dart';

import '../models/auth_models/email.dart';
import '../models/auth_models/password.dart';
import '../models/responses/error/backend_error.dart';
import '../repositories/auth_repository.dart';
import 'login_params.dart';

class LoginViewModel {
  final loginParams = LoginParams();

  void emailChanged(String value) {
    final email = Email.dirty(value);
    loginParams.email.postValue(email);
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    loginParams.password.postValue(password);
  }

  Future<void> login() async {
    loginParams.error.value = loginParams.error.value..message = null;
    loginParams.loading.postValue(true);

    // send request to server
    final response = await AuthenticationRepository.instance.login(
      email: loginParams.email.value.value,
      password: loginParams.password.value.value,
    );
    // handle response
    if (response.success && response.data != null) {
      await AuthenticationManager.login(response.data!.user!, response.data!.token!);
      loginParams.loading.postValue(false);

      /// navigator key is [MaterialApp.navigatorKey] in main.dart
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      loginParams.loading.postValue(false);
      loginParams.error.postValue(BackendError(message: response.message ?? "error try again"));
    }
  }

  void clear() {
    loginParams.clear();
  }
}
