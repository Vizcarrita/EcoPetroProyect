// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import '../../week_model.dart';
import '../widget/stadistic_week.dart';
import 'package:example_ecopetro/pages/shared/shared.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class StadisticScreen extends StatelessWidget {
  const StadisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      body: const _StadisticView(),
    );
  }
}

class _StadisticView extends StatelessWidget {
  const _StadisticView();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enableDoubleTapZooming: true,
        enablePanning: true,
      ),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
          numberFormat: NumberFormat.currency(
        decimalDigits: 0,
        symbol: '\$',
      )),
      series: [
        ColumnSeries<PorcentageModel, String>(
          dataSource: PorcentageModel.months,
          // color: Colors.amber,
          xValueMapper: (PorcentageModel data, _) => data.title,
          yValueMapper: (PorcentageModel data, _) => data.porcentage,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
          onPointTap: (pointInteractionDetails) {
            int index = pointInteractionDetails.pointIndex!;
            PorcentageModel model = PorcentageModel.months[index];
            if (model.porcentages == null || model.porcentages!.isEmpty) {
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
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StadisticWeek(model: model),
                  ));
            }
          },
          width: 0.5,
        ),
      ],
    ));
  }
}
