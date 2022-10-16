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
  double minX = 0;
  List<FlSpot> listLineOne = <FlSpot>[];
  List<FlSpot> listLineTwo = <FlSpot>[];
  static const _dateTextStyle = TextStyle(
    fontSize: 10,
    color: Colors.purple,
    fontWeight: FontWeight.bold,
  );
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
    return LineChart(
      LineChartData(
        maxX: maxX,
        maxY: maxY,
        minX: minX,
        minY: 0,
        titlesData: FlTitlesData(
            show: true,
            rightTitles: SideTitles(),
            topTitles: SideTitles(),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: _bottomTitles,
            )),
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

  void initBulid() {
    listLineOne = <FlSpot>[];
    listLineTwo = <FlSpot>[];
    
   if(widget.charts.length>0){
    this.maxY = widget.MaxY;
    this.maxX = widget.charts.length.toDouble() +  widget.charts[0].label ;
    this.minX =  widget.charts[0].label - 1 ;
   }
   else{
    this.maxY = widget.MaxY+1.0;
    this.maxX = 0 ;
    this.minX =  0 ;
   }

    for (int i = 0; i < widget.charts.length; i++) {
      listLineOne.add(FlSpot(widget.charts[i].label, widget.charts[i].actual));
      listLineTwo.add(FlSpot(widget.charts[i].label, widget.charts[i].plan));
    }
  }
}
