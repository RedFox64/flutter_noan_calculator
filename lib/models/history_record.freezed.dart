// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryRecord _$HistoryRecordFromJson(Map<String, dynamic> json) {
  return _HistoryRecord.fromJson(json);
}

/// @nodoc
mixin _$HistoryRecord {
  DateTime get date => throw _privateConstructorUsedError;
  CreditType get creditType => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get rate => throw _privateConstructorUsedError;
  String get countMonth => throw _privateConstructorUsedError;
  String get totalAmountPayment => throw _privateConstructorUsedError;
  String get totalAmountFee => throw _privateConstructorUsedError;
  String get monthlyPayment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryRecordCopyWith<HistoryRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryRecordCopyWith<$Res> {
  factory $HistoryRecordCopyWith(
          HistoryRecord value, $Res Function(HistoryRecord) then) =
      _$HistoryRecordCopyWithImpl<$Res, HistoryRecord>;
  @useResult
  $Res call(
      {DateTime date,
      CreditType creditType,
      String amount,
      String rate,
      String countMonth,
      String totalAmountPayment,
      String totalAmountFee,
      String monthlyPayment});
}

/// @nodoc
class _$HistoryRecordCopyWithImpl<$Res, $Val extends HistoryRecord>
    implements $HistoryRecordCopyWith<$Res> {
  _$HistoryRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? creditType = null,
    Object? amount = null,
    Object? rate = null,
    Object? countMonth = null,
    Object? totalAmountPayment = null,
    Object? totalAmountFee = null,
    Object? monthlyPayment = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creditType: null == creditType
          ? _value.creditType
          : creditType // ignore: cast_nullable_to_non_nullable
              as CreditType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      countMonth: null == countMonth
          ? _value.countMonth
          : countMonth // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmountPayment: null == totalAmountPayment
          ? _value.totalAmountPayment
          : totalAmountPayment // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmountFee: null == totalAmountFee
          ? _value.totalAmountFee
          : totalAmountFee // ignore: cast_nullable_to_non_nullable
              as String,
      monthlyPayment: null == monthlyPayment
          ? _value.monthlyPayment
          : monthlyPayment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryRecordCopyWith<$Res>
    implements $HistoryRecordCopyWith<$Res> {
  factory _$$_HistoryRecordCopyWith(
          _$_HistoryRecord value, $Res Function(_$_HistoryRecord) then) =
      __$$_HistoryRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      CreditType creditType,
      String amount,
      String rate,
      String countMonth,
      String totalAmountPayment,
      String totalAmountFee,
      String monthlyPayment});
}

/// @nodoc
class __$$_HistoryRecordCopyWithImpl<$Res>
    extends _$HistoryRecordCopyWithImpl<$Res, _$_HistoryRecord>
    implements _$$_HistoryRecordCopyWith<$Res> {
  __$$_HistoryRecordCopyWithImpl(
      _$_HistoryRecord _value, $Res Function(_$_HistoryRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? creditType = null,
    Object? amount = null,
    Object? rate = null,
    Object? countMonth = null,
    Object? totalAmountPayment = null,
    Object? totalAmountFee = null,
    Object? monthlyPayment = null,
  }) {
    return _then(_$_HistoryRecord(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creditType: null == creditType
          ? _value.creditType
          : creditType // ignore: cast_nullable_to_non_nullable
              as CreditType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      countMonth: null == countMonth
          ? _value.countMonth
          : countMonth // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmountPayment: null == totalAmountPayment
          ? _value.totalAmountPayment
          : totalAmountPayment // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmountFee: null == totalAmountFee
          ? _value.totalAmountFee
          : totalAmountFee // ignore: cast_nullable_to_non_nullable
              as String,
      monthlyPayment: null == monthlyPayment
          ? _value.monthlyPayment
          : monthlyPayment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryRecord with DiagnosticableTreeMixin implements _HistoryRecord {
  const _$_HistoryRecord(
      {required this.date,
      required this.creditType,
      required this.amount,
      required this.rate,
      required this.countMonth,
      required this.totalAmountPayment,
      required this.totalAmountFee,
      required this.monthlyPayment});

  factory _$_HistoryRecord.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryRecordFromJson(json);

  @override
  final DateTime date;
  @override
  final CreditType creditType;
  @override
  final String amount;
  @override
  final String rate;
  @override
  final String countMonth;
  @override
  final String totalAmountPayment;
  @override
  final String totalAmountFee;
  @override
  final String monthlyPayment;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryRecord(date: $date, creditType: $creditType, amount: $amount, rate: $rate, countMonth: $countMonth, totalAmountPayment: $totalAmountPayment, totalAmountFee: $totalAmountFee, monthlyPayment: $monthlyPayment)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryRecord'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('creditType', creditType))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('rate', rate))
      ..add(DiagnosticsProperty('countMonth', countMonth))
      ..add(DiagnosticsProperty('totalAmountPayment', totalAmountPayment))
      ..add(DiagnosticsProperty('totalAmountFee', totalAmountFee))
      ..add(DiagnosticsProperty('monthlyPayment', monthlyPayment));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryRecord &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.creditType, creditType) ||
                other.creditType == creditType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.countMonth, countMonth) ||
                other.countMonth == countMonth) &&
            (identical(other.totalAmountPayment, totalAmountPayment) ||
                other.totalAmountPayment == totalAmountPayment) &&
            (identical(other.totalAmountFee, totalAmountFee) ||
                other.totalAmountFee == totalAmountFee) &&
            (identical(other.monthlyPayment, monthlyPayment) ||
                other.monthlyPayment == monthlyPayment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, creditType, amount, rate,
      countMonth, totalAmountPayment, totalAmountFee, monthlyPayment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryRecordCopyWith<_$_HistoryRecord> get copyWith =>
      __$$_HistoryRecordCopyWithImpl<_$_HistoryRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryRecordToJson(
      this,
    );
  }
}

abstract class _HistoryRecord implements HistoryRecord {
  const factory _HistoryRecord(
      {required final DateTime date,
      required final CreditType creditType,
      required final String amount,
      required final String rate,
      required final String countMonth,
      required final String totalAmountPayment,
      required final String totalAmountFee,
      required final String monthlyPayment}) = _$_HistoryRecord;

  factory _HistoryRecord.fromJson(Map<String, dynamic> json) =
      _$_HistoryRecord.fromJson;

  @override
  DateTime get date;
  @override
  CreditType get creditType;
  @override
  String get amount;
  @override
  String get rate;
  @override
  String get countMonth;
  @override
  String get totalAmountPayment;
  @override
  String get totalAmountFee;
  @override
  String get monthlyPayment;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryRecordCopyWith<_$_HistoryRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
