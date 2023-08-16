import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:loan_calculator/blocs/calculator/calculator_bloc.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'history_record.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'history_record.g.dart';

@freezed
class HistoryRecord with _$HistoryRecord {
  const factory HistoryRecord(
      {required DateTime date,
      required CreditType creditType,
      required String amount,
      required String rate,
      required String countMonth,
      required String totalAmountPayment,
      required String totalAmountFee,
      required String monthlyPayment}) = _HistoryRecord;

  factory HistoryRecord.fromJson(Map<String, Object?> json) => _$HistoryRecordFromJson(json);
}
