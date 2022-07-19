import 'package:flutter/material.dart';
import '../../../ProgressHUD.dart';
import '../../../component/chartBar-conponent.dart';
import '../../../component/chartLine-conponent.dart';
import '../../../model/chart-model.dart';
import '../../../model/chartDrawing-model.dart';
import '../../../model/chartMaterial-model.dart';
import '../../../service/api-service.dart';

class DisplayDrawing extends StatefulWidget {
  final int disciplineId;
  const DisplayDrawing({required this.disciplineId ,Key? key}) : super(key: key);

  @override
  State<DisplayDrawing> createState() => _DisplayDrawingState();
}

class _DisplayDrawingState extends State<DisplayDrawing> {
  bool isApiCallProcess = false;
  APIService apiService = APIService();
  ChartDrawingResponseModel charts = ChartDrawingResponseModel(
    chartBar: [ChartModel(lable: "", plan: 1000.0, actuality: 0.0)],
    chartLine: [ChartModel(lable: "", plan: 1500.0, actuality: 0.0)],
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
        title: const Text('Drawing show'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: DataTable(
                columnSpacing: 20,
                  columns: const [
                    DataColumn(
                      label: Text('#'),
                    ),
                    DataColumn(
                      label: Text('Name'),
                      
                    ),
                    DataColumn(
                      label: Text('Code'),
                    ),
                    DataColumn(
                      label: Text('Quantity'),
                    ),
                    DataColumn(
                      label: Text('Amount'),
                    ),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(Text('open')),
                        DataCell(Text('Arshik')),
                        DataCell(Text('5644645')),
                        DataCell(Text('3')),
                        DataCell(Text('265\$')),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ChartBar(
                    charts: charts.chartBar,
                    MaxY: charts.barMaxY,
                    inAsyncCall: isApiCallProcess),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ChartLine(
                    charts: charts.chartLine,
                    MaxY: charts.lineMaxY,
                    inAsyncCall: isApiCallProcess),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
