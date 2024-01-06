// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  List<Part> get parts => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call({List<Part> parts, String? role});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<Part>,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Part> parts, String? role});
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
    Object? role = freezed,
  }) {
    return _then(_$ContentImpl(
      parts: null == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<Part>,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentImpl with DiagnosticableTreeMixin implements _Content {
  const _$ContentImpl({required final List<Part> parts, this.role})
      : _parts = parts;

  factory _$ContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentImplFromJson(json);

  final List<Part> _parts;
  @override
  List<Part> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

  @override
  final String? role;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Content(parts: $parts, role: $role)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Content'))
      ..add(DiagnosticsProperty('parts', parts))
      ..add(DiagnosticsProperty('role', role));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            const DeepCollectionEquality().equals(other._parts, _parts) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_parts), role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentImplToJson(
      this,
    );
  }
}

abstract class _Content implements Content {
  const factory _Content(
      {required final List<Part> parts, final String? role}) = _$ContentImpl;

  factory _Content.fromJson(Map<String, dynamic> json) = _$ContentImpl.fromJson;

  @override
  List<Part> get parts;
  @override
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SafetyRating _$SafetyRatingFromJson(Map<String, dynamic> json) {
  return _SafetyRating.fromJson(json);
}

/// @nodoc
mixin _$SafetyRating {
  String get category => throw _privateConstructorUsedError;
  String get probability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SafetyRatingCopyWith<SafetyRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafetyRatingCopyWith<$Res> {
  factory $SafetyRatingCopyWith(
          SafetyRating value, $Res Function(SafetyRating) then) =
      _$SafetyRatingCopyWithImpl<$Res, SafetyRating>;
  @useResult
  $Res call({String category, String probability});
}

/// @nodoc
class _$SafetyRatingCopyWithImpl<$Res, $Val extends SafetyRating>
    implements $SafetyRatingCopyWith<$Res> {
  _$SafetyRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? probability = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SafetyRatingImplCopyWith<$Res>
    implements $SafetyRatingCopyWith<$Res> {
  factory _$$SafetyRatingImplCopyWith(
          _$SafetyRatingImpl value, $Res Function(_$SafetyRatingImpl) then) =
      __$$SafetyRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, String probability});
}

/// @nodoc
class __$$SafetyRatingImplCopyWithImpl<$Res>
    extends _$SafetyRatingCopyWithImpl<$Res, _$SafetyRatingImpl>
    implements _$$SafetyRatingImplCopyWith<$Res> {
  __$$SafetyRatingImplCopyWithImpl(
      _$SafetyRatingImpl _value, $Res Function(_$SafetyRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? probability = null,
  }) {
    return _then(_$SafetyRatingImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SafetyRatingImpl with DiagnosticableTreeMixin implements _SafetyRating {
  const _$SafetyRatingImpl({required this.category, required this.probability});

  factory _$SafetyRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$SafetyRatingImplFromJson(json);

  @override
  final String category;
  @override
  final String probability;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SafetyRating(category: $category, probability: $probability)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SafetyRating'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('probability', probability));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SafetyRatingImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, probability);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SafetyRatingImplCopyWith<_$SafetyRatingImpl> get copyWith =>
      __$$SafetyRatingImplCopyWithImpl<_$SafetyRatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SafetyRatingImplToJson(
      this,
    );
  }
}

abstract class _SafetyRating implements SafetyRating {
  const factory _SafetyRating(
      {required final String category,
      required final String probability}) = _$SafetyRatingImpl;

  factory _SafetyRating.fromJson(Map<String, dynamic> json) =
      _$SafetyRatingImpl.fromJson;

  @override
  String get category;
  @override
  String get probability;
  @override
  @JsonKey(ignore: true)
  _$$SafetyRatingImplCopyWith<_$SafetyRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Candidate _$CandidateFromJson(Map<String, dynamic> json) {
  return _Candidate.fromJson(json);
}

/// @nodoc
mixin _$Candidate {
  Content get content => throw _privateConstructorUsedError;
  String get finishReason => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  List<SafetyRating> get safetyRatings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CandidateCopyWith<Candidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateCopyWith<$Res> {
  factory $CandidateCopyWith(Candidate value, $Res Function(Candidate) then) =
      _$CandidateCopyWithImpl<$Res, Candidate>;
  @useResult
  $Res call(
      {Content content,
      String finishReason,
      int index,
      List<SafetyRating> safetyRatings});

  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class _$CandidateCopyWithImpl<$Res, $Val extends Candidate>
    implements $CandidateCopyWith<$Res> {
  _$CandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? finishReason = null,
    Object? index = null,
    Object? safetyRatings = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      safetyRatings: null == safetyRatings
          ? _value.safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res> get content {
    return $ContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CandidateImplCopyWith<$Res>
    implements $CandidateCopyWith<$Res> {
  factory _$$CandidateImplCopyWith(
          _$CandidateImpl value, $Res Function(_$CandidateImpl) then) =
      __$$CandidateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Content content,
      String finishReason,
      int index,
      List<SafetyRating> safetyRatings});

  @override
  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$CandidateImplCopyWithImpl<$Res>
    extends _$CandidateCopyWithImpl<$Res, _$CandidateImpl>
    implements _$$CandidateImplCopyWith<$Res> {
  __$$CandidateImplCopyWithImpl(
      _$CandidateImpl _value, $Res Function(_$CandidateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? finishReason = null,
    Object? index = null,
    Object? safetyRatings = null,
  }) {
    return _then(_$CandidateImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      safetyRatings: null == safetyRatings
          ? _value._safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CandidateImpl with DiagnosticableTreeMixin implements _Candidate {
  const _$CandidateImpl(
      {required this.content,
      required this.finishReason,
      required this.index,
      required final List<SafetyRating> safetyRatings})
      : _safetyRatings = safetyRatings;

  factory _$CandidateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateImplFromJson(json);

  @override
  final Content content;
  @override
  final String finishReason;
  @override
  final int index;
  final List<SafetyRating> _safetyRatings;
  @override
  List<SafetyRating> get safetyRatings {
    if (_safetyRatings is EqualUnmodifiableListView) return _safetyRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_safetyRatings);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Candidate(content: $content, finishReason: $finishReason, index: $index, safetyRatings: $safetyRatings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Candidate'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('finishReason', finishReason))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('safetyRatings', safetyRatings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality()
                .equals(other._safetyRatings, _safetyRatings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, finishReason, index,
      const DeepCollectionEquality().hash(_safetyRatings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateImplCopyWith<_$CandidateImpl> get copyWith =>
      __$$CandidateImplCopyWithImpl<_$CandidateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateImplToJson(
      this,
    );
  }
}

abstract class _Candidate implements Candidate {
  const factory _Candidate(
      {required final Content content,
      required final String finishReason,
      required final int index,
      required final List<SafetyRating> safetyRatings}) = _$CandidateImpl;

  factory _Candidate.fromJson(Map<String, dynamic> json) =
      _$CandidateImpl.fromJson;

  @override
  Content get content;
  @override
  String get finishReason;
  @override
  int get index;
  @override
  List<SafetyRating> get safetyRatings;
  @override
  @JsonKey(ignore: true)
  _$$CandidateImplCopyWith<_$CandidateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromptFeedback _$PromptFeedbackFromJson(Map<String, dynamic> json) {
  return _PromptFeedback.fromJson(json);
}

/// @nodoc
mixin _$PromptFeedback {
  List<SafetyRating> get safetyRatings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptFeedbackCopyWith<PromptFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptFeedbackCopyWith<$Res> {
  factory $PromptFeedbackCopyWith(
          PromptFeedback value, $Res Function(PromptFeedback) then) =
      _$PromptFeedbackCopyWithImpl<$Res, PromptFeedback>;
  @useResult
  $Res call({List<SafetyRating> safetyRatings});
}

/// @nodoc
class _$PromptFeedbackCopyWithImpl<$Res, $Val extends PromptFeedback>
    implements $PromptFeedbackCopyWith<$Res> {
  _$PromptFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? safetyRatings = null,
  }) {
    return _then(_value.copyWith(
      safetyRatings: null == safetyRatings
          ? _value.safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromptFeedbackImplCopyWith<$Res>
    implements $PromptFeedbackCopyWith<$Res> {
  factory _$$PromptFeedbackImplCopyWith(_$PromptFeedbackImpl value,
          $Res Function(_$PromptFeedbackImpl) then) =
      __$$PromptFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SafetyRating> safetyRatings});
}

/// @nodoc
class __$$PromptFeedbackImplCopyWithImpl<$Res>
    extends _$PromptFeedbackCopyWithImpl<$Res, _$PromptFeedbackImpl>
    implements _$$PromptFeedbackImplCopyWith<$Res> {
  __$$PromptFeedbackImplCopyWithImpl(
      _$PromptFeedbackImpl _value, $Res Function(_$PromptFeedbackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? safetyRatings = null,
  }) {
    return _then(_$PromptFeedbackImpl(
      safetyRatings: null == safetyRatings
          ? _value._safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromptFeedbackImpl
    with DiagnosticableTreeMixin
    implements _PromptFeedback {
  const _$PromptFeedbackImpl({required final List<SafetyRating> safetyRatings})
      : _safetyRatings = safetyRatings;

  factory _$PromptFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptFeedbackImplFromJson(json);

  final List<SafetyRating> _safetyRatings;
  @override
  List<SafetyRating> get safetyRatings {
    if (_safetyRatings is EqualUnmodifiableListView) return _safetyRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_safetyRatings);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PromptFeedback(safetyRatings: $safetyRatings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PromptFeedback'))
      ..add(DiagnosticsProperty('safetyRatings', safetyRatings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromptFeedbackImpl &&
            const DeepCollectionEquality()
                .equals(other._safetyRatings, _safetyRatings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_safetyRatings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptFeedbackImplCopyWith<_$PromptFeedbackImpl> get copyWith =>
      __$$PromptFeedbackImplCopyWithImpl<_$PromptFeedbackImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptFeedbackImplToJson(
      this,
    );
  }
}

abstract class _PromptFeedback implements PromptFeedback {
  const factory _PromptFeedback(
      {required final List<SafetyRating> safetyRatings}) = _$PromptFeedbackImpl;

  factory _PromptFeedback.fromJson(Map<String, dynamic> json) =
      _$PromptFeedbackImpl.fromJson;

  @override
  List<SafetyRating> get safetyRatings;
  @override
  @JsonKey(ignore: true)
  _$$PromptFeedbackImplCopyWith<_$PromptFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenerateContentResponse _$GenerateContentResponseFromJson(
    Map<String, dynamic> json) {
  return _GenerateContentResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateContentResponse {
  List<Candidate> get candidates => throw _privateConstructorUsedError;
  PromptFeedback? get promptFeedback => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateContentResponseCopyWith<GenerateContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateContentResponseCopyWith<$Res> {
  factory $GenerateContentResponseCopyWith(GenerateContentResponse value,
          $Res Function(GenerateContentResponse) then) =
      _$GenerateContentResponseCopyWithImpl<$Res, GenerateContentResponse>;
  @useResult
  $Res call({List<Candidate> candidates, PromptFeedback? promptFeedback});

  $PromptFeedbackCopyWith<$Res>? get promptFeedback;
}

/// @nodoc
class _$GenerateContentResponseCopyWithImpl<$Res,
        $Val extends GenerateContentResponse>
    implements $GenerateContentResponseCopyWith<$Res> {
  _$GenerateContentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
    Object? promptFeedback = freezed,
  }) {
    return _then(_value.copyWith(
      candidates: null == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>,
      promptFeedback: freezed == promptFeedback
          ? _value.promptFeedback
          : promptFeedback // ignore: cast_nullable_to_non_nullable
              as PromptFeedback?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromptFeedbackCopyWith<$Res>? get promptFeedback {
    if (_value.promptFeedback == null) {
      return null;
    }

    return $PromptFeedbackCopyWith<$Res>(_value.promptFeedback!, (value) {
      return _then(_value.copyWith(promptFeedback: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerateContentResponseImplCopyWith<$Res>
    implements $GenerateContentResponseCopyWith<$Res> {
  factory _$$GenerateContentResponseImplCopyWith(
          _$GenerateContentResponseImpl value,
          $Res Function(_$GenerateContentResponseImpl) then) =
      __$$GenerateContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Candidate> candidates, PromptFeedback? promptFeedback});

  @override
  $PromptFeedbackCopyWith<$Res>? get promptFeedback;
}

/// @nodoc
class __$$GenerateContentResponseImplCopyWithImpl<$Res>
    extends _$GenerateContentResponseCopyWithImpl<$Res,
        _$GenerateContentResponseImpl>
    implements _$$GenerateContentResponseImplCopyWith<$Res> {
  __$$GenerateContentResponseImplCopyWithImpl(
      _$GenerateContentResponseImpl _value,
      $Res Function(_$GenerateContentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
    Object? promptFeedback = freezed,
  }) {
    return _then(_$GenerateContentResponseImpl(
      candidates: null == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>,
      promptFeedback: freezed == promptFeedback
          ? _value.promptFeedback
          : promptFeedback // ignore: cast_nullable_to_non_nullable
              as PromptFeedback?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateContentResponseImpl
    with DiagnosticableTreeMixin
    implements _GenerateContentResponse {
  const _$GenerateContentResponseImpl(
      {required final List<Candidate> candidates, this.promptFeedback})
      : _candidates = candidates;

  factory _$GenerateContentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateContentResponseImplFromJson(json);

  final List<Candidate> _candidates;
  @override
  List<Candidate> get candidates {
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_candidates);
  }

  @override
  final PromptFeedback? promptFeedback;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenerateContentResponse(candidates: $candidates, promptFeedback: $promptFeedback)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenerateContentResponse'))
      ..add(DiagnosticsProperty('candidates', candidates))
      ..add(DiagnosticsProperty('promptFeedback', promptFeedback));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateContentResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates) &&
            (identical(other.promptFeedback, promptFeedback) ||
                other.promptFeedback == promptFeedback));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_candidates), promptFeedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateContentResponseImplCopyWith<_$GenerateContentResponseImpl>
      get copyWith => __$$GenerateContentResponseImplCopyWithImpl<
          _$GenerateContentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateContentResponseImplToJson(
      this,
    );
  }
}

abstract class _GenerateContentResponse implements GenerateContentResponse {
  const factory _GenerateContentResponse(
      {required final List<Candidate> candidates,
      final PromptFeedback? promptFeedback}) = _$GenerateContentResponseImpl;

  factory _GenerateContentResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateContentResponseImpl.fromJson;

  @override
  List<Candidate> get candidates;
  @override
  PromptFeedback? get promptFeedback;
  @override
  @JsonKey(ignore: true)
  _$$GenerateContentResponseImplCopyWith<_$GenerateContentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
