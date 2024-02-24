// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'risk_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Risk _$RiskFromJson(Map<String, dynamic> json) {
  return _Risk.fromJson(json);
}

/// @nodoc
mixin _$Risk {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get pan => throw _privateConstructorUsedError;
  String get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RiskCopyWith<Risk> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskCopyWith<$Res> {
  factory $RiskCopyWith(Risk value, $Res Function(Risk) then) =
      _$RiskCopyWithImpl<$Res, Risk>;
  @useResult
  $Res call(
      {String name, String email, String phone, String pan, String score});
}

/// @nodoc
class _$RiskCopyWithImpl<$Res, $Val extends Risk>
    implements $RiskCopyWith<$Res> {
  _$RiskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? pan = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      pan: null == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RiskImplCopyWith<$Res> implements $RiskCopyWith<$Res> {
  factory _$$RiskImplCopyWith(
          _$RiskImpl value, $Res Function(_$RiskImpl) then) =
      __$$RiskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String email, String phone, String pan, String score});
}

/// @nodoc
class __$$RiskImplCopyWithImpl<$Res>
    extends _$RiskCopyWithImpl<$Res, _$RiskImpl>
    implements _$$RiskImplCopyWith<$Res> {
  __$$RiskImplCopyWithImpl(_$RiskImpl _value, $Res Function(_$RiskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? pan = null,
    Object? score = null,
  }) {
    return _then(_$RiskImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      pan: null == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskImpl with DiagnosticableTreeMixin implements _Risk {
  const _$RiskImpl(
      {required this.name,
      required this.email,
      required this.phone,
      required this.pan,
      required this.score});

  factory _$RiskImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String pan;
  @override
  final String score;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Risk(name: $name, email: $email, phone: $phone, pan: $pan, score: $score)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Risk'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('pan', pan))
      ..add(DiagnosticsProperty('score', score));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.pan, pan) || other.pan == pan) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone, pan, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskImplCopyWith<_$RiskImpl> get copyWith =>
      __$$RiskImplCopyWithImpl<_$RiskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskImplToJson(
      this,
    );
  }
}

abstract class _Risk implements Risk {
  const factory _Risk(
      {required final String name,
      required final String email,
      required final String phone,
      required final String pan,
      required final String score}) = _$RiskImpl;

  factory _Risk.fromJson(Map<String, dynamic> json) = _$RiskImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get pan;
  @override
  String get score;
  @override
  @JsonKey(ignore: true)
  _$$RiskImplCopyWith<_$RiskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
