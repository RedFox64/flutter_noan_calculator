// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_HistoryRecord _$$_HistoryRecordFromJson(Map<String, dynamic> json) =>
    _$_HistoryRecord(
      date: DateTime.parse(json['date'] as String),
      creditType: $enumDecode(_$CreditTypeEnumMap, json['creditType']),
      amount: json['amount'] as String,
      rate: json['rate'] as String,
      countMonth: json['countMonth'] as String,
      totalAmountPayment: json['totalAmountPayment'] as String,
      totalAmountFee: json['totalAmountFee'] as String,
      monthlyPayment: json['monthlyPayment'] as String,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_HistoryRecordToJson(_$_HistoryRecord instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'creditType': _$CreditTypeEnumMap[instance.creditType]!,
      'amount': instance.amount,
      'rate': instance.rate,
      'countMonth': instance.countMonth,
      'totalAmountPayment': instance.totalAmountPayment,
      'totalAmountFee': instance.totalAmountFee,
      'monthlyPayment': instance.monthlyPayment,
    };

const _$CreditTypeEnumMap = {
  CreditType.annuity: 'annuity',
  CreditType.differentiated: 'differentiated',
};
