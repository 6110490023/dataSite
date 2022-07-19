import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../model/chart-model.dart';

class ChartBar extends StatefulWidget {
  final List<ChartModel> charts;
  final double MaxY;
  final bool inAsyncCall;
  const ChartBar(
      {Key? key,
      required this.charts,
      required this.MaxY,
      required this.inAsyncCall})
      : super(key: key);

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  double maxY = 0;
  List<BarChartGroupData> listBar = <BarChartGroupData>[];
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
    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          rightTitles: SideTitles(),
          topTitles: SideTitles(),
        ),
        barGroups: listBar,
      ),
    );
  }

  void initBulid() {
    listBar = <BarChartGroupData>[];
    this.maxY = widget.MaxY;
    for (int i = 0; i < widget.charts.length; i++) {
      listBar.add(
        BarChartGroupData(
          x: i + 1,
          barRods: [
            BarChartRodData(
                y: widget.charts[i].actuality,
                colors: [Colors.red],
                width: 12,
                borderRadius: BorderRadius.circular(0)),
            BarChartRodData(
                y: widget.charts[i].plan,
                colors: [Colors.blue],
                width: 12,
                borderRadius: BorderRadius.circular(0)),
          ],
        ),
      );
    }
  }
}
