import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatelessWidget {
  final List data;

  const ColumnChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          borderColor: Theme.of(context).backgroundColor,
          axisLine: AxisLine(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          labelStyle: Theme.of(context).textTheme.bodySmall,
          majorGridLines: const MajorGridLines(
            width: 0,
          ),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 10,
          interval: 0.5,
          axisLine: AxisLine(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          labelStyle: Theme.of(context).textTheme.bodySmall,
        ),
        legend: Legend(
          isVisible: true,
        ),
        onPlotAreaSwipe: (direction) => Direction.minus,
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          ColumnSeries(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            dataSource: data,
            xValueMapper: (data, index) => data["day"]["day"],
            yValueMapper: (data, index) => data["avg_consumption"],
            name: 'Consumption',
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
