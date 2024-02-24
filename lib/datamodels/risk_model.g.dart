// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'risk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RiskImpl _$$RiskImplFromJson(Map<String, dynamic> json) => _$RiskImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      pan: json['pan'] as String,
      score: json['score'] as String,
    );

Map<String, dynamic> _$$RiskImplToJson(_$RiskImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'pan': instance.pan,
      'score': instance.score,
    };
