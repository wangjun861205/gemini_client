// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenerationConfig _$GenerationConfigFromJson(Map<String, dynamic> json) {
  return _GenerationConfig.fromJson(json);
}

/// @nodoc
mixin _$GenerationConfig {
  List<String> get stopSequences => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  int get maxOutputTokens => throw _privateConstructorUsedError;
  double get topP => throw _privateConstructorUsedError;
  int get topK => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerationConfigCopyWith<GenerationConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationConfigCopyWith<$Res> {
  factory $GenerationConfigCopyWith(
          GenerationConfig value, $Res Function(GenerationConfig) then) =
      _$GenerationConfigCopyWithImpl<$Res, GenerationConfig>;
  @useResult
  $Res call(
      {List<String> stopSequences,
      double temperature,
      int maxOutputTokens,
      double topP,
      int topK});
}

/// @nodoc
class _$GenerationConfigCopyWithImpl<$Res, $Val extends GenerationConfig>
    implements $GenerationConfigCopyWith<$Res> {
  _$GenerationConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopSequences = null,
    Object? temperature = null,
    Object? maxOutputTokens = null,
    Object? topP = null,
    Object? topK = null,
  }) {
    return _then(_value.copyWith(
      stopSequences: null == stopSequences
          ? _value.stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxOutputTokens: null == maxOutputTokens
          ? _value.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      topP: null == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double,
      topK: null == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerationConfigImplCopyWith<$Res>
    implements $GenerationConfigCopyWith<$Res> {
  factory _$$GenerationConfigImplCopyWith(_$GenerationConfigImpl value,
          $Res Function(_$GenerationConfigImpl) then) =
      __$$GenerationConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> stopSequences,
      double temperature,
      int maxOutputTokens,
      double topP,
      int topK});
}

/// @nodoc
class __$$GenerationConfigImplCopyWithImpl<$Res>
    extends _$GenerationConfigCopyWithImpl<$Res, _$GenerationConfigImpl>
    implements _$$GenerationConfigImplCopyWith<$Res> {
  __$$GenerationConfigImplCopyWithImpl(_$GenerationConfigImpl _value,
      $Res Function(_$GenerationConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopSequences = null,
    Object? temperature = null,
    Object? maxOutputTokens = null,
    Object? topP = null,
    Object? topK = null,
  }) {
    return _then(_$GenerationConfigImpl(
      stopSequences: null == stopSequences
          ? _value._stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxOutputTokens: null == maxOutputTokens
          ? _value.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      topP: null == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double,
      topK: null == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerationConfigImpl
    with DiagnosticableTreeMixin
    implements _GenerationConfig {
  const _$GenerationConfigImpl(
      {required final List<String> stopSequences,
      required this.temperature,
      required this.maxOutputTokens,
      required this.topP,
      required this.topK})
      : _stopSequences = stopSequences;

  factory _$GenerationConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerationConfigImplFromJson(json);

  final List<String> _stopSequences;
  @override
  List<String> get stopSequences {
    if (_stopSequences is EqualUnmodifiableListView) return _stopSequences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stopSequences);
  }

  @override
  final double temperature;
  @override
  final int maxOutputTokens;
  @override
  final double topP;
  @override
  final int topK;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenerationConfig(stopSequences: $stopSequences, temperature: $temperature, maxOutputTokens: $maxOutputTokens, topP: $topP, topK: $topK)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenerationConfig'))
      ..add(DiagnosticsProperty('stopSequences', stopSequences))
      ..add(DiagnosticsProperty('temperature', temperature))
      ..add(DiagnosticsProperty('maxOutputTokens', maxOutputTokens))
      ..add(DiagnosticsProperty('topP', topP))
      ..add(DiagnosticsProperty('topK', topK));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationConfigImpl &&
            const DeepCollectionEquality()
                .equals(other._stopSequences, _stopSequences) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.maxOutputTokens, maxOutputTokens) ||
                other.maxOutputTokens == maxOutputTokens) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.topK, topK) || other.topK == topK));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stopSequences),
      temperature,
      maxOutputTokens,
      topP,
      topK);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationConfigImplCopyWith<_$GenerationConfigImpl> get copyWith =>
      __$$GenerationConfigImplCopyWithImpl<_$GenerationConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerationConfigImplToJson(
      this,
    );
  }
}

abstract class _GenerationConfig implements GenerationConfig {
  const factory _GenerationConfig(
      {required final List<String> stopSequences,
      required final double temperature,
      required final int maxOutputTokens,
      required final double topP,
      required final int topK}) = _$GenerationConfigImpl;

  factory _GenerationConfig.fromJson(Map<String, dynamic> json) =
      _$GenerationConfigImpl.fromJson;

  @override
  List<String> get stopSequences;
  @override
  double get temperature;
  @override
  int get maxOutputTokens;
  @override
  double get topP;
  @override
  int get topK;
  @override
  @JsonKey(ignore: true)
  _$$GenerationConfigImplCopyWith<_$GenerationConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
mixin _$Settings {
  String get apiKey => throw _privateConstructorUsedError;
  SafetySettings get safetySettings => throw _privateConstructorUsedError;
  GenerationConfig get generationConfig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call(
      {String apiKey,
      SafetySettings safetySettings,
      GenerationConfig generationConfig});

  $GenerationConfigCopyWith<$Res> get generationConfig;
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? safetySettings = null,
    Object? generationConfig = null,
  }) {
    return _then(_value.copyWith(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      safetySettings: null == safetySettings
          ? _value.safetySettings
          : safetySettings // ignore: cast_nullable_to_non_nullable
              as SafetySettings,
      generationConfig: null == generationConfig
          ? _value.generationConfig
          : generationConfig // ignore: cast_nullable_to_non_nullable
              as GenerationConfig,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GenerationConfigCopyWith<$Res> get generationConfig {
    return $GenerationConfigCopyWith<$Res>(_value.generationConfig, (value) {
      return _then(_value.copyWith(generationConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsImplCopyWith<$Res>
    implements $SettingsCopyWith<$Res> {
  factory _$$SettingsImplCopyWith(
          _$SettingsImpl value, $Res Function(_$SettingsImpl) then) =
      __$$SettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String apiKey,
      SafetySettings safetySettings,
      GenerationConfig generationConfig});

  @override
  $GenerationConfigCopyWith<$Res> get generationConfig;
}

/// @nodoc
class __$$SettingsImplCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$SettingsImpl>
    implements _$$SettingsImplCopyWith<$Res> {
  __$$SettingsImplCopyWithImpl(
      _$SettingsImpl _value, $Res Function(_$SettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? safetySettings = null,
    Object? generationConfig = null,
  }) {
    return _then(_$SettingsImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      safetySettings: null == safetySettings
          ? _value.safetySettings
          : safetySettings // ignore: cast_nullable_to_non_nullable
              as SafetySettings,
      generationConfig: null == generationConfig
          ? _value.generationConfig
          : generationConfig // ignore: cast_nullable_to_non_nullable
              as GenerationConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsImpl extends _Settings with DiagnosticableTreeMixin {
  const _$SettingsImpl(
      {required this.apiKey,
      required this.safetySettings,
      required this.generationConfig})
      : super._();

  factory _$SettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsImplFromJson(json);

  @override
  final String apiKey;
  @override
  final SafetySettings safetySettings;
  @override
  final GenerationConfig generationConfig;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Settings(apiKey: $apiKey, safetySettings: $safetySettings, generationConfig: $generationConfig)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Settings'))
      ..add(DiagnosticsProperty('apiKey', apiKey))
      ..add(DiagnosticsProperty('safetySettings', safetySettings))
      ..add(DiagnosticsProperty('generationConfig', generationConfig));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.safetySettings, safetySettings) ||
                other.safetySettings == safetySettings) &&
            (identical(other.generationConfig, generationConfig) ||
                other.generationConfig == generationConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, apiKey, safetySettings, generationConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsImplCopyWith<_$SettingsImpl> get copyWith =>
      __$$SettingsImplCopyWithImpl<_$SettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsImplToJson(
      this,
    );
  }
}

abstract class _Settings extends Settings {
  const factory _Settings(
      {required final String apiKey,
      required final SafetySettings safetySettings,
      required final GenerationConfig generationConfig}) = _$SettingsImpl;
  const _Settings._() : super._();

  factory _Settings.fromJson(Map<String, dynamic> json) =
      _$SettingsImpl.fromJson;

  @override
  String get apiKey;
  @override
  SafetySettings get safetySettings;
  @override
  GenerationConfig get generationConfig;
  @override
  @JsonKey(ignore: true)
  _$$SettingsImplCopyWith<_$SettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
