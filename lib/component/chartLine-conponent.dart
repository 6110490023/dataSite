import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartLine extends StatefulWidget {
  const ChartLine(this.charts ,{Key? key}) : super(key: key);
  final List charts ;
 

  @override
  State<ChartLine> createState() => _ChartLineState();
}

class _ChartLineState extends State<ChartLine> {

  double maxX = 0;
  double maxY = 0;
  List<FlSpot> listLineOne =  <FlSpot>[];
  List<FlSpot> listLineTwo =  <FlSpot>[];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.maxX = widget.charts.length.toDouble();
    this.maxY = 10;
    for (int i = 1; i < widget.charts.length; i++) {
      listLineOne.add( FlSpot(i.toDouble(),widget.charts[i][0]), );
      listLineTwo.add( FlSpot(i.toDouble(),widget.charts[i][1]), );
    }
  }
  
  @override
  Widget build(BuildContext context) {
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
}
