import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

/*
{ 
  "success": true,
  "message": "done",
  "data": { 
    "user": { 
      "_id": "6252341d34a3425efe28b30f",
      "username": "Aghiad Odeh",
      "email": "aghiadodeh@gmail.com"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNTIzNDFkMzRhMzQyNWVmZTI4YjMwZiIsInJvbGUiOiJ1c2VyIi"
  }
}
*/

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final String? message;
  final T? data;
  final bool success;
  final int? responseCode;

  BaseResponse({
    this.message,
    this.data,
    this.success = true,
    this.responseCode = 200,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResponseFromJson(json, (Object? json) {
        try {
          return fromJsonT(json);
        } catch (e) {
          return fromJsonT(<String, dynamic>{});
        }
      });

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$BaseResponseToJson(this, toJsonT);
}
