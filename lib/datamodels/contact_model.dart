import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    required String name,
    required String email,
    required String phone,
    String? segment,
    String? investment,
  }) = _Contact;

  factory Contact.fromJson(Map<String, Object> json) => _$ContactFromJson(json);
}
