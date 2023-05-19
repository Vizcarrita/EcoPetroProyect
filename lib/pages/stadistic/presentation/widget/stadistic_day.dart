// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:example_ecopetro/pages/stadistic/week_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class StadisticDay extends StatelessWidget {
  const StadisticDay({super.key, required this.model});

  final PorcentageModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.title)),
      body: SfCartesianChart(
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true, // Habilita el zoom con pellizco
          enableDoubleTapZooming: true, // Habilita el zoom al hacer doble toque
          enablePanning: true, // Habilita el desplazamiento
        ),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          numberFormat: NumberFormat.currency(
            decimalDigits: 0,
            symbol: '\$',
          ),
        ),
        series: [
          ColumnSeries<PorcentageModel, String>(
            dataSource: model.porcentages!,
            // color: Colors.amber,
            xValueMapper: (PorcentageModel data, _) => data.title,
            yValueMapper: (PorcentageModel data, _) => data.porcentage,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            width: 0.5,
          ),
        ],
      ),
    );
  }
}
