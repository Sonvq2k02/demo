// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      birthday: json['birthday'] as String?,
      enableNotification: json['enableNotification'] as bool?,
      status: json['status'] as String?,
      roleTitle: json['roleTitle'] as String?,
      step: (json['step'] as num?)?.toInt(),
      balance: (json['balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'enableNotification': instance.enableNotification,
      'status': instance.status,
      'roleTitle': instance.roleTitle,
      'step': instance.step,
      'balance': instance.balance,
    };
