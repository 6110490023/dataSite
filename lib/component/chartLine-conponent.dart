import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../model/chart-model.dart';

class ChartLine extends StatefulWidget {
  final List<ChartModel> charts;
  final double MaxY;
  final bool inAsyncCall;
  const ChartLine(
      {Key? key,
      required this.charts,
      required this.MaxY,
      required this.inAsyncCall})
      : super(key: key);

  @override
  State<ChartLine> createState() => _ChartLineState();
}

class _ChartLineState extends State<ChartLine> {
  double maxX = 0;
  double maxY = 0;
  List<FlSpot> listLineOne = <FlSpot>[];
  List<FlSpot> listLineTwo = <FlSpot>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initBulid();
    if(widget.inAsyncCall){
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white30,
      );
    }
    return LineChart(
      LineChartData(
        maxX: maxX,
        maxY: maxY,
        minX: 0,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          rightTitles: SideTitles(),
          topTitles: SideTitles(),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: listLineOne,
            isCurved: false,
            colors: [Colors.red],
            barWidth: 5,
          ),
          LineChartBarData(
            spots: listLineTwo,
            isCurved: false,
            colors: [Colors.blue],
            barWidth: 5,
          ),
        ],
      ),
    );
  }

  void initBulid() {
    listLineOne = <FlSpot>[];
    listLineTwo = <FlSpot>[];
    this.maxX = widget.charts.length.toDouble() + 1.0;
    this.maxY = widget.MaxY;
    for (int i = 0; i < widget.charts.length; i++) {
      listLineOne.add(
          FlSpot((i + 1).toDouble(), widget.charts[i].actuality.toDouble()));
      listLineTwo
          .add(FlSpot((i + 1).toDouble(), widget.charts[i].plan.toDouble()));
    }
  }
}
