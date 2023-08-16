part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorState extends Equatable {
  const CalculatorState();
}

final class CalculatorInitial extends CalculatorState {
  const CalculatorInitial();

  @override
  List<Object?> get props => [];
}

final class Calculating extends CalculatorState {
  const Calculating();

  @override
  List<Object?> get props => [];
}

final class CalculatedDataState extends CalculatorState {
  final CreditType creditType;
  final String creditAmount;
  final String rateAmount;
  final String countMonth;

  //calculated
  final String totalAmountPayment;
  final String totalAmountFee;
  final String monthlyPayment;
  final List<ChartData> chartData;

  const CalculatedDataState({
    required this.chartData,
    required this.monthlyPayment,
    required this.totalAmountPayment,
    required this.totalAmountFee,
    required this.creditType,
    required this.creditAmount,
    required this.rateAmount,
    required this.countMonth,
  });

  HistoryRecord get getHistoryRecord => HistoryRecord(
      amount: creditAmount,
      countMonth: countMonth,
      date: DateTime.now(),
      creditType: creditType,
      monthlyPayment: monthlyPayment,
      rate: rateAmount,
      totalAmountFee: totalAmountFee,
      totalAmountPayment: totalAmountPayment);

  @override
  List<Object?> get props => [creditType.toString(), creditAmount, rateAmount, countMonth];
}

final class NoDataState extends CalculatorState {
  const NoDataState();

  @override
  List<Object?> get props => [];
}

final class CalculatorErrorState extends CalculatorState {
  final String errorMes;

  const CalculatorErrorState(this.errorMes);

  @override
  List<Object?> get props => [errorMes];
}
