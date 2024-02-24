import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'risk_model.freezed.dart';
part 'risk_model.g.dart';

@freezed
class Risk with _$Risk {
  const factory Risk({
    required String name,
    required String email,
    required String phone,
    required String pan,
    required String score,
  }) = _Risk;

  factory Risk.fromJson(Map<String, Object> json) => _$RiskFromJson(json);
}
