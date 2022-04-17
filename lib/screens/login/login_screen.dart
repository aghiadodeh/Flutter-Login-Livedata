import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login_state_managment/models/responses/error/backend_error.dart';
import 'package:flutter_login_state_managment/screens/login/widgets/email_input.dart';
import 'package:flutter_login_state_managment/screens/login/widgets/login_button.dart';
import 'package:flutter_login_state_managment/screens/login/widgets/password_input.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';

import '../../singleton/signleton.dart';
import '../../viewmodels/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final viewModel = LoginViewModel();

  void showSnackBar({required String message}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    /// create global instance in parent widget
    registerSingleton<LoginViewModel>(viewModel);
    super.initState();
  }

  @override
  void dispose() {
    /// remove global loginViewModel instance
    /// no need for keep the class in memory
    unregisterSinglton<LoginViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Login", style: TextStyle(fontSize: 24)),
                const SizedBox(height: 60),
                const EmailInput(),
                const SizedBox(height: 20),
                const PasswordInput(),
                const SizedBox(height: 60),
                const LoginButton(),
                const SizedBox(height: 20),
                LiveDataBuilder<bool>(
                  data: viewModel.loginParams.loading,
                  builder: (context, loading) {
                    return loading ? const CircularProgressIndicator() : const SizedBox.square();
                  },
                ),
                LiveDataBuilder<BackendError>(
                  data: viewModel.loginParams.error,
                  builder: (context, error) {
                    if (error.message != null) {
                      /// watching the end of the construction to call context
                      SchedulerBinding.instance?.addPostFrameCallback((_) {
                        showSnackBar(message: error.message ?? "Error");
                      });
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
