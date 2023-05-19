// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:example_ecopetro/pages/stadistic/week_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class StadisticWeek extends StatelessWidget {
  const StadisticWeek({super.key, required this.model});

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
            onPointDoubleTap: (pointInteractionDetails) {
              int index = pointInteractionDetails.pointIndex!;
              PorcentageModel week = model.porcentages![index];
              if (week.porcentages == null || week.porcentages!.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Aceptar'),
                        ),
                      ],
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Esta barra estadística no contiene datos',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
            width: 0.5,
          ),
        ],
      ),
    );
  }
}
