import 'package:basicflutter/component/chartBar-conponent.dart';
import 'package:basicflutter/component/chartLine-conponent.dart';
import 'package:basicflutter/model/chart-model.dart';
import 'package:flutter/material.dart';
import '../../ProgressHUD.dart';
import '../../model/chartManPower-model.dart';
import '../../service/api-service.dart';

class InsightManpower extends StatefulWidget {
  const InsightManpower({Key? key}) : super(key: key);

  @override
  State<InsightManpower> createState() => _InsightManpowerState();
}

class _InsightManpowerState extends State<InsightManpower> {
  bool isApiCallProcess = false;
  APIService apiService = APIService();
  ChartManpowerResponseModel charts = ChartManpowerResponseModel(
    chartBar: [ChartModel(label: 12.0, plan: 1000.0, actual: 0.0,disciplineName: "")],
    chartLine: [ChartModel(label: 12.0, plan: 1500.0, actual: 0.0,disciplineName: "")],
    barMaxY: 1000.0,
    lineMaxY: 1000.0,
    error: '',
  );
  final int projectId = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    apiService.getManPowerChart(projectId).then((value) {
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
        title: const Text('Insight Manpower'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.95,
            child: ChartLine(
                charts: charts.chartBar,
                MaxY: charts.barMaxY,
                inAsyncCall: isApiCallProcess),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.95,
            child: ChartBar(
                charts: charts.chartBar,
                MaxY: charts.barMaxY,
                inAsyncCall: isApiCallProcess),
          ),
        ],
      ),
    );
  }
}
