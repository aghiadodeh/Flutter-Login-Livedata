import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/*
  {
    "_id": "6252341d34a3425efe28b30f",
    "username": "Aghiad Odeh",
    "email": "aghiadodeh@gmail.com"
  }
*/

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    @JsonKey(name: '_id') String? id,
    String? username,
    String? email,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
