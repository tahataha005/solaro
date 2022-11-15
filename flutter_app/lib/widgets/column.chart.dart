import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatelessWidget {
  final List data;

  ColumnChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 10, interval: 0.5),
          legend: Legend(
            isVisible: true,
          ),
          onPlotAreaSwipe: (direction) => Direction.minus,
          tooltipBehavior: TooltipBehavior(enable: true),
          series: [
            ColumnSeries(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              dataSource: data,
              xValueMapper: (data, index) => data["day"]["day"],
              yValueMapper: (data, index) => data["avg_consumption"],
              name: 'Consumption',
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
