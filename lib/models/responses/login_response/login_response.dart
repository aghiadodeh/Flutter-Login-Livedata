import 'package:freezed_annotation/freezed_annotation.dart';
import '../../user/user.dart';
part 'login_response.g.dart';
part 'login_response.freezed.dart';

/*
 "user": {
    "_id": "6252341d34a3425efe28b30f",
    "username": "Aghiad Odeh",
    "email": "aghiadodeh@gmail.com"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNTIzNDFkMzRhMzQyNWVmZTI4YjMwZiIsInJvbGUiOiJ1c2VyIi"
*/

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    User? user,
    String? token,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
