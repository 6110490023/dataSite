import 'package:flutter/material.dart';
import '../../../ProgressHUD.dart';
import '../../../component/chartBar-conponent.dart';
import '../../../component/chartLine-conponent.dart';
import '../../../model/chart-model.dart';
import '../../../model/chartMaterial-model.dart';
import '../../../service/api-service.dart';

class ChartMaterial extends StatefulWidget {
  final int materialId;
  const ChartMaterial(this.materialId, {Key? key}) : super(key: key);

  @override
  State<ChartMaterial> createState() => _ChartMaterialState();
}

class _ChartMaterialState extends State<ChartMaterial> {
  bool isApiCallProcess = false;
  APIService apiService = APIService();
  ChartMaterialResponseModel charts = ChartMaterialResponseModel(
    chartBar: [
      ChartModel(label: 12.0, plan: 1000.0, actual: 0.0, disciplineName: "")
    ],
    chartLine: [
      ChartModel(label: 12.0, plan: 1500.0, actual: 0.0, disciplineName: "")
    ],
    barMaxY: 1000.0,
    lineMaxY: 1000.0,
    error: '',
  );
  final int project_id = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    apiService.getMaterialsChart(project_id, widget.materialId).then((value) {
      if (value.error != "") {
        Navigator.pop(context);
        setState(() {
          isApiCallProcess = false;
        });
      }
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
        title: const Text('Materials'),
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
