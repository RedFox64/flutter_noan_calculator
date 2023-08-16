import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphic/graphic.dart';
import 'package:loan_calculator/blocs/calculator/calculator_bloc.dart';
import 'package:loan_calculator/blocs/history/history_bloc.dart';
import 'package:loan_calculator/models/chart_data.dart';
import 'package:loan_calculator/ui/remark_label.dart';
import 'package:loan_calculator/ui/row_results.dart';
import 'package:loan_calculator/ui/text_input.dart';

class Calculator extends StatelessWidget {
  final CalculatorBloc bloc;

  const Calculator({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text("Тип платежей"),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: InputDecorator(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      contentPadding: EdgeInsets.zero),
                  child: StreamBuilder<CreditType>(
                    stream: bloc.creditTypeField.stream,
                    builder: (BuildContext context, AsyncSnapshot<CreditType> snapshot) {
                      return DropdownButton<CreditType>(
                          borderRadius: const BorderRadius.all(Radius.circular(2)),
                          value: snapshot.data ?? bloc.creditTypeField.defaultValue,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          isExpanded: true,
                          underline: const SizedBox(),
                          items: const [
                            DropdownMenuItem(
                              value: CreditType.annuity,
                              child: Text("Аннуитетный"),
                            ),
                            DropdownMenuItem(
                              value: CreditType.differentiated,
                              child: Text("Дифференцированный"),
                            ),
                          ],
                          onChanged: (CreditType? type) {
                            if (type != null) bloc.creditTypeField.change(type);
                          });
                    },
                  ),
                ))

                //
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: NumberField(label: "Cумма кредита", streamData: bloc.creditAmountField),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: NumberField(label: "Срок кредита (мес.)", streamData: bloc.countMonthField),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: NumberField(
                  label: "Годовая ставка (%)",
                  streamData: bloc.rateAmountField,
                ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CalculatorBloc, CalculatorState>(
              bloc: bloc,
              builder: (BuildContext context, CalculatorState state) {
                if (state is Calculating) {
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  );
                } else if (state is CalculatedDataState) {
                  return Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Результат",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).primaryColor),
                              ),
                              IconButton(
                                  color: Theme.of(context).primaryColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  onPressed: () {
                                    context.read<HistoryBloc>().add(AddRecord(state.getHistoryRecord));
                                  },
                                  icon: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [Icon(Icons.save), Text("Сохранить")],
                                  ))
                            ],
                          ))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                    ResultRow("Первый ежемесячный платеж", state.monthlyPayment),
                    ResultRow("Общая сумма выплат", state.totalAmountPayment),
                    ResultRow("Переплата по процентам", state.totalAmountFee),
                    SizedBox(
                      height: 200.0,
                      child: Column(
                        children: [
                          Flexible(
                            child: Row(
                              children: [Expanded(child: _drawChart(state.chartData))],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Wrap(
                      spacing: 10,
                      children: [
                        ChartRemark(Colors.yellow, "Сумма платежа"),
                        ChartRemark(Colors.purpleAccent, "Начисленные проценты"),
                      ],
                    )
                  ]);
                } else if (state is NoDataState || state is CalculatorInitial) {
                  return const Row(
                    children: [
                      Text(
                        "Заполните все поля",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      Text(
                        state is CalculatorErrorState ? state.errorMes : "Unknown Error",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _drawChart(List<ChartData> chartData) {
    return Chart(
      data: chartData.map((e) => e.data).toList(),
      variables: {
        'month': Variable(
          accessor: (Map map) => map['month'] as String,
        ),
        'value': Variable(
          accessor: (Map map) => map['value'] as num,
        ),
        'group': Variable(
          accessor: (Map map) => map['group'] as int,
        ),
      },
      marks: [
        IntervalMark(color: ColorEncode(variable: 'group', values: [Colors.yellow, Colors.purpleAccent])),
      ],
      axes: [
        Defaults.horizontalAxis,
        Defaults.verticalAxis,
      ],
    );
  }
}
