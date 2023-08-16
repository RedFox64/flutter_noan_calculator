part of 'history_bloc.dart';

@immutable
sealed class HistoryState extends Equatable {
  const HistoryState();
}

final class HistoryInitialState extends HistoryState {
  const HistoryInitialState();

  @override
  List<Object?> get props => [];
}

final class HistoryLoading extends HistoryState {
  const HistoryLoading();

  @override
  List<Object?> get props => [];
}

final class HistoryLoadedState extends HistoryState {
  final List<HistoryRecord> records;

  const HistoryLoadedState(this.records);

  @override
  List<Object?> get props => [records];
}

final class HistoryErrorState extends HistoryState {
  final String errorMes;

  const HistoryErrorState(this.errorMes);

  @override
  List<Object?> get props => [errorMes];
}
