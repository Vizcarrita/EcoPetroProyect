import 'package:flutter/material.dart';
import 'package:example_ecopetro/pages/shared/shared.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class TrucksScreen extends StatelessWidget {
  const TrucksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: _TrucksView(),
    );
  }
}

class _TrucksView extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Semana 1', 1000, 1500),
    ChartData('Semana 2', 2000, 1500),
    ChartData('Semana 3', 5000, 1500),
    ChartData('Semana 4', 8000, 1500),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
      series: <ChartSeries>[
        StackedColumnSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData ch, _) => ch.x,
            yValueMapper: (ChartData ch, _) => ch.y1),
        StackedColumnSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData ch, _) => ch.x,
            yValueMapper: (ChartData ch, _) => ch.y2),
      ],
    ));
  }
}

class ChartData {
  final String x;
  final int y1;
  final int y2;
  ChartData(this.x, this.y1, this.y2);
}
