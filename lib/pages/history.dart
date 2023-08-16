import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loan_calculator/blocs/calculator/calculator_bloc.dart';
import 'package:loan_calculator/blocs/history/history_bloc.dart';
import 'package:loan_calculator/models/history_record.dart';
import 'package:loan_calculator/ui/row_results.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(builder: (BuildContext context, HistoryState state) {
      if (state is HistoryInitialState) {
        return const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [CircularProgressIndicator(), SizedBox(height: 10), Text("Инициализация")],
          ),
        );
      } else if (state is HistoryLoading) {
        return const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [CircularProgressIndicator(), SizedBox(height: 10), Text("Обработка")],
          ),
        );
      } else if (state is HistoryLoadedState) {
        return state.records.isNotEmpty
            ? ListView.builder(
                itemCount: state.records.length,
                itemBuilder: (BuildContext context, int index) {
                  final HistoryRecord record = state.records[index];
                  return Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(
                        color: Colors.purple.shade100, borderRadius: const BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey.shade100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat('dd.MM.yyyy H:m').format(record.date),
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                      )
                                    ],
                                  ),
                                  Wrap(
                                    spacing: 10,
                                    children: [
                                      Text(
                                        "Тип кредита:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Theme.of(context).primaryColor),
                                      ),
                                      Text(
                                        record.creditType == CreditType.annuity ? "Аннуитетный" : "Дифференцированный",
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Wrap(
                                        spacing: 10,
                                        children: [
                                          ResultRow("Сумма", record.amount),
                                          ResultRow("Срок (мес.)", record.countMonth),
                                          ResultRow("Cтавка (%)", record.rate),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ResultRow("Первый ежемесячный платеж", record.monthlyPayment),
                          ResultRow("Общая сумма выплат", record.totalAmountPayment),
                          ResultRow("Переплата по процентам", record.totalAmountFee),
                        ],
                      ),
                    ]),
                  );
                })
            : Center(
                child: Text(
                  "Нет записей",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Theme.of(context).primaryColor),
                ),
              );
      } else {
        return Center(
          child: Text(
            state is HistoryErrorState ? state.errorMes : "Unknown Error",
            style: const TextStyle(color: Colors.red),
          ),
        );
      }
    });
  }
}
