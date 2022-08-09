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
    if (widget.inAsyncCall) {
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
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
            show: true,
            rightTitles: SideTitles(),
            topTitles: SideTitles(),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: _bottomTitles,
            )),
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
          x: widget.charts[i].label.toInt(),
          barRods: [
            BarChartRodData(
                y: widget.charts[i].actual,
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

  String _bottomTitles(double value) {
    String text;
    switch (value.toInt() % 12) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        return '';
    }
    return text;
  }
}
