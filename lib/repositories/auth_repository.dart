import 'package:dio/dio.dart';
import '../models/responses/base_response/base_response.dart';
import '../models/responses/login_response/login_response.dart';
import '../network/auth_rest_client/auth_rest_client.dart';

class AuthenticationRepository {
  static AuthenticationRepository? _instance;
  late final AuthRestClient _authRestClient;
  AuthenticationRepository._internal() {
    _authRestClient = AuthRestClient(Dio());
  }
  static AuthenticationRepository get instance => _instance ?? AuthenticationRepository._internal();

  Future<BaseResponse<LoginResponse>> login({required String email, required String password}) async {
    return _authRestClient.login(email: email, password: password).onError((error, _) => catchError<LoginResponse>(error));
  }

  Future<BaseResponse<T>> catchError<T>(e) async {
    Map? response;
    String? message;
    if (e is DioError) {
      if (e.response != null && e.response!.data is Map) {
        response = e.response!.data as Map<String, dynamic>;
      }
      if (response != null) message = response['message'];
      message ??= e.message;
    } else {
      message = e.toString();
    }
    return BaseResponse<T>(message: message, data: null, success: false);
  }
}
