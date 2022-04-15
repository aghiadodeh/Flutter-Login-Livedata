import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/base_response/base_response.dart';
import '../../models/responses/login_response/login_response.dart';
import '../config/env.dart';
part 'auth_rest_client.g.dart';

@RestApi(baseUrl: Env.apiUrl)
abstract class AuthRestClient {
  factory AuthRestClient(Dio dio) = _AuthRestClient;

  @POST("/users/login")
  Future<BaseResponse<LoginResponse>> login({
    @Field("email") required String email,
    @Field("password") required String password,
  });
}
