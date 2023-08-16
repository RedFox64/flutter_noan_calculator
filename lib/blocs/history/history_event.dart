part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class AddRecord extends HistoryEvent {
  final HistoryRecord record;
  const AddRecord(this.record);

  @override
  List<Object?> get props => [record.creditType, record.amount, record.rate, record.countMonth];
}

final class FetchRecords extends HistoryEvent {
  @override
  List<Object?> get props => [];
}
