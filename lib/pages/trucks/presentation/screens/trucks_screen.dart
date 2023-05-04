import 'package:flutter/material.dart';
import 'package:example_ecopetro/pages/shared/shared.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TrucksScreen extends StatelessWidget {
  const TrucksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    final data = [
      Expenses(0, 100.000),
      Expenses(1, 200.000),
      Expenses(2, 250.000),
      Expenses(3, 100.000),
    ];

    List<charts.Series<Expenses, int>> series = [
      charts.Series<Expenses, int>(
        id: 'Gastos',
        data: data,
        domainFn: (v, i) => v.day,
        measureFn: (v, i) => v.expense,
      )
    ];

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text('Camiones'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Center(
        child: SizedBox(
          height: 350.0,
          child: charts.LineChart(series, animate: true),
        ),
      ),
    );
  }
}

// class _TrucksView extends StatelessWidget {
//   const _TrucksView();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(height: 350.0, child: charts.LineChart(series)),
//     );
//   }
// }

class Expenses {
  final int day;
  final double expense;

  Expenses(this.day, this.expense);
}
