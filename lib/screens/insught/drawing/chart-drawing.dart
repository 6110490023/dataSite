import 'package:flutter/material.dart';
import '../../../ProgressHUD.dart';
import '../../../component/chartBar-conponent.dart';
import '../../../component/chartLine-conponent.dart';
import '../../../model/chart-model.dart';
import '../../../model/chartDrawing-model.dart';
import '../../../service/api-service.dart';

class ChartDrawing extends StatefulWidget {
  final int disciplineId;
  const ChartDrawing({required this.disciplineId ,Key? key}) : super(key: key);

  @override
  State<ChartDrawing> createState() => _ChartDrawingState();
}

class _ChartDrawingState extends State<ChartDrawing> {
  bool isApiCallProcess = false;
  APIService apiService = APIService();
  ChartDrawingResponseModel charts = ChartDrawingResponseModel(
    chartBar: [ChartModel(actual: 0,label: 0,plan: 0,disciplineName: "")],
    chartLine: [ChartModel(actual: 0,label: 0,plan: 0,disciplineName: "")],
    barMaxY: 1000.0,
    lineMaxY: 1000.0,
    error: '',
  );
  final int projectId = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    apiService.getDrawingChart(projectId, widget.disciplineId).then((value) {
      setState(() {
        charts = value;
        isApiCallProcess = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(inAsyncCall: isApiCallProcess, child: _uiSetup(context));
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insight :  Drawing'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 45,
                child: Center(
                  child: Text("Monthly Drawing",style: TextStyle( fontSize: 20),),
                ) ,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.38,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ChartBar(
                    charts: charts.chartBar,
                    MaxY: charts.barMaxY,
                    inAsyncCall: isApiCallProcess),
              ),

              const SizedBox(
                height: 45,
                child: Center(
                  child: Text("Acc. Monthly Drawing",style: TextStyle( fontSize: 20),),
                ) ,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.38,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ChartLine(
                    charts: charts.chartLine,
                    MaxY: charts.lineMaxY,
                    inAsyncCall: isApiCallProcess),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
