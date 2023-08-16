part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorEvent extends Equatable {
  const CalculatorEvent();
}

class RecalculateEvent extends CalculatorEvent {
  final CreditType creditType;
  final num creditAmount;
  final num rateAmount;
  final int countMonth;

  const RecalculateEvent(
      {required this.creditType, required this.creditAmount, required this.rateAmount, required this.countMonth});

  @override
  List<Object?> get props => [creditType, creditAmount, rateAmount, countMonth];
}

class EmptyDataEvent extends CalculatorEvent {
  const EmptyDataEvent();

  @override
  List<Object?> get props => [];
}

class ErrorFieldEvent extends CalculatorEvent {
  const ErrorFieldEvent();

  @override
  List<Object?> get props => [];
}
