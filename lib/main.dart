import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_calculator/blocs/calculator/calculator_bloc.dart';
import 'package:loan_calculator/blocs/history/history_bloc.dart';
import 'package:loan_calculator/pages/calculator.dart';

import 'pages/history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор кредитов и ипотеки',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            filled: true,
            isDense: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              fontSize: 16,
            ),
            labelStyle: TextStyle(
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            ),
          )),
      home: MultiBlocProvider(providers: [
        BlocProvider<HistoryBloc>(
          create: (context) => HistoryBloc()..add(FetchRecords()),
        ),
        BlocProvider<CalculatorBloc>(
          create: (context) => CalculatorBloc(),
        )
      ], child: const MyHomePage(title: 'Калькулятор кредитов и ипотеки')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) => setState(() => _currentPage = index),
        children: [
          Calculator(
            bloc: context.read<CalculatorBloc>(),
          ),
          const History(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Калькулятор"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "История")
        ],
        onTap: (int index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
