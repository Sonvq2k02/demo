import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    String? name,
    String? email,
    String? phone,
    String? birthday,
    bool? enableNotification,
    String? status,
    String? roleTitle,
    int? step,
    int? balance,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// flutter pub run build_runner build --delete-conflicting-outputs
