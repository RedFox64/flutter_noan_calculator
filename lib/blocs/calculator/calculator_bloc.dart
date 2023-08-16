import 'dart:async';
import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loan_calculator/models/chart_data.dart';
import 'package:loan_calculator/models/history_record.dart';
import 'package:loan_calculator/utils/field.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

enum CreditType { annuity, differentiated }

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  //form fields
  final FieldDataStream<CreditType> creditTypeField = FieldDataStream<CreditType>(defaultValue: CreditType.annuity);
  final FieldDataStream<num?> creditAmountField = FieldDataStream<num?>(validateField: FieldsValidator.integer);
  final FieldDataStream<num?> rateAmountField = FieldDataStream<num?>(validateField: FieldsValidator.float);
  final FieldDataStream<num?> countMonthField = FieldDataStream<num?>(validateField: FieldsValidator.integer);

  CalculatorBloc() : super(const CalculatorInitial()) {
    creditTypeField.stream.listen(onChangeField, onError: onErrorField);
    creditAmountField.stream.listen(onChangeField, onError: onErrorField);
    rateAmountField.stream.listen(onChangeField, onError: onErrorField);
    countMonthField.stream.listen(onChangeField, onError: onErrorField);

    on<ErrorFieldEvent>((ErrorFieldEvent event, emit) {
      emit(const CalculatorErrorState("Введите корректно данные"));
    });

    on<RecalculateEvent>((RecalculateEvent event, emit) {
      try {
        final List<ChartData> feePaymentsByMonth = [];
        final List<ChartData> totalPaymentsByMonth = [];

        switch (event.creditType) {
          case CreditType.annuity:
            final num p = (event.rateAmount / 12) / 100;

            final num monthlyPayment = event.creditAmount * (p + (p / (pow((1 + p), event.countMonth) - 1)));

            final num totalAmountPayment = monthlyPayment * event.countMonth;
            final num totalAmountFee = totalAmountPayment - event.creditAmount;

            num currentCreditAmount = event.creditAmount;

            //calculate mountly payment and fee
            for (int i = 1; i <= event.countMonth; i++) {
              final num fee = currentCreditAmount * p;
              final String monthNum = i.toString();

              totalPaymentsByMonth.add(ChartData(monthNum, monthlyPayment, 0));
              feePaymentsByMonth.add(ChartData(monthNum, fee, 1));

              currentCreditAmount -= (monthlyPayment - fee);
            }

            emit(CalculatedDataState(
                creditAmount: event.creditAmount.toStringAsFixed(0),
                creditType: event.creditType,
                countMonth: event.countMonth.toStringAsFixed(0),
                rateAmount: event.rateAmount.toString(),
                monthlyPayment: monthlyPayment.toStringAsFixed(2),
                totalAmountFee: totalAmountFee.toStringAsFixed(2),
                totalAmountPayment: totalAmountPayment.toStringAsFixed(2),
                chartData: [...totalPaymentsByMonth, ...feePaymentsByMonth]));

            break;
          case CreditType.differentiated:
            final num p = (event.rateAmount / 12) / 100;

            final num monthlyPaymentWithoutFee = event.creditAmount / event.countMonth;

            num totalAmountFee = 0;

            num currentCreditAmount = event.creditAmount;

            //calculate mountly payment and fee
            for (int i = 1; i <= event.countMonth; i++) {
              final num fee = currentCreditAmount * p;
              final num monthlyPayment = monthlyPaymentWithoutFee + fee;

              totalAmountFee += fee;

              final String monthNum = i.toString();

              totalPaymentsByMonth.add(ChartData(monthNum, monthlyPayment, 0));
              feePaymentsByMonth.add(ChartData(monthNum, fee, 1));

              currentCreditAmount -= (monthlyPayment - fee);
            }

            emit(CalculatedDataState(
                creditAmount: event.creditAmount.toStringAsFixed(0),
                creditType: event.creditType,
                countMonth: event.countMonth.toStringAsFixed(0),
                rateAmount: event.rateAmount.toString(),
                monthlyPayment: totalPaymentsByMonth.first.value.toStringAsFixed(2),
                totalAmountFee: totalAmountFee.toStringAsFixed(2),
                totalAmountPayment: (event.creditAmount + totalAmountFee).toStringAsFixed(2),
                chartData: [...totalPaymentsByMonth, ...feePaymentsByMonth]));

            break;
          default:
            throw "Unknown credit type";
        }
      } catch (e) {
        emit(CalculatorErrorState(e.toString()));
      }
    });
    on<EmptyDataEvent>((EmptyDataEvent event, emit) {
      emit(const NoDataState());
    });
  }

  void onChangeField(dynamic data) {
    if (creditTypeField.value != null &&
        creditAmountField.value != null &&
        rateAmountField.value != null &&
        countMonthField.value != null) {
      add(RecalculateEvent(
          creditType: creditTypeField.value!,
          creditAmount: creditAmountField.value!,
          rateAmount: rateAmountField.value!,
          countMonth: countMonthField.value!.toInt()));
    } else {
      add(const EmptyDataEvent());
    }
  }

  void onErrorField(dynamic data) {
    add(const ErrorFieldEvent());
  }
}

class FieldsValidator {
  static StreamTransformer<num?, num?>? float = StreamTransformer<num?, num?>.fromHandlers(handleData: (value, sink) {
    if (value != null) {
      if (value > 0) {
        sink.add(value);
      } else {
        sink.addError("Значение должно быть больше нуля");
      }
    } else {
      sink.addError("Поле не должно быть пустым");
    }
  });

  static StreamTransformer<num?, num?>? integer = StreamTransformer<num?, num?>.fromHandlers(handleData: (value, sink) {
    if (value != null) {
      if (value > 0) {
        if (value == value.roundToDouble()) {
          sink.add(value);
        } else {
          sink.addError("Введите целое число");
        }
      } else {
        sink.addError("Значение должно быть больше нуля");
      }
    } else {
      sink.addError("Поле не должно быть пустым");
    }
  });
}
