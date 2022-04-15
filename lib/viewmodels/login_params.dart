import 'package:flutterx_live_data/flutterx_live_data.dart';

import '../models/auth_models/email.dart';
import '../models/auth_models/password.dart';
import '../models/responses/error/backend_error.dart';

class LoginParams {
  /// user email, update value on emailInput textChanges
  final MutableLiveData<Email> email = MutableLiveData(initialValue: const Email.pure());

  /// user password, update value on passwordInput textChanges
  final MutableLiveData<Password> password = MutableLiveData(initialValue: const Password.pure());

  /// is request in loading status
  final MutableLiveData<bool> loading = MutableLiveData(initialValue: false);

  /// server error
  final MutableLiveData<BackendError> error = MutableLiveData(initialValue: BackendError());

  /// reset params to default value, when user logOut this params should be empty
  /// becuase loginViewModel is a singleton
  void clear() {
    email.value = const Email.pure();
    password.value = const Password.pure();
    loading.value = false;
    error.value = BackendError();
  }
}
