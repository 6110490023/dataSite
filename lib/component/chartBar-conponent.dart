import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  final List charts;
  const ChartBar(this.charts, {Key? key}) : super(key: key);

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {

  List<BarChartGroupData> listBar = <BarChartGroupData>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 1; i < widget.charts.length; i++) {
      listBar.add(
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(y: widget.charts[i][0] ,colors: [Colors.red], width: 12 ,borderRadius: BorderRadius.circular(0)),
              BarChartRodData(y: widget.charts[i][1],colors: [Colors.blue], width: 12 ,borderRadius: BorderRadius.circular(0)),
            ],
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 10,
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
}
