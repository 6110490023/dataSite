import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../ProgressHUD.dart';
import '../../../component/chartBar-conponent.dart';
import '../../../component/chartLine-conponent.dart';
import '../../../model/chart-model.dart';
import '../../../model/chartDrawing-model.dart';
import '../../../service/api-service.dart';

class ChartDrawing extends StatefulWidget {
  final int disciplineId;
  const ChartDrawing({required this.disciplineId, Key? key}) : super(key: key);

  @override
  State<ChartDrawing> createState() => _ChartDrawingState();
}

class _ChartDrawingState extends State<ChartDrawing> {
  bool isApiCallProcess = false;
  APIService apiService = APIService();
  ChartDrawingResponseModel charts = ChartDrawingResponseModel(
    chartBar: [ChartModel(actual: 0, label: 0, plan: 0, disciplineName: "")],
    chartLine: [ChartModel(actual: 0, label: 0, plan: 0, disciplineName: "")],
    barMaxY: 1000.0,
    lineMaxY: 1000.0,
    error: '',
  );
  List<DropdownMenuItem<String>> options = [
    DropdownMenuItem(child: Text("not choose"), value: ""),
    DropdownMenuItem(child: Text("2022"), value: "2022"),
    DropdownMenuItem(child: Text("2021"), value: "2021"),
    DropdownMenuItem(child: Text("2023"), value: "2023"),
  ];
  String selectValue = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    selectValue = DateTime.now().year.toString();
    apiService.getDrawingChart(widget.disciplineId, selectValue).then((value) {
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
        title: const Text('Insight :  Drawing'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          fillColor: Colors.grey[100],
                        ),
                        validator: (value) =>
                            value == null ? "Select a country" : null,
                        dropdownColor: Colors.grey[100],
                        value: selectValue,
                        onChanged: (newValue) {
                          setState(() {
                            isApiCallProcess = true;
                          });
                
                          selectValue = newValue.toString();
                          apiService
                              .getDrawingChart(widget.disciplineId, selectValue)
                              .then((value) {
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
                        },
                        items: options,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    "Monthly Drawing",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ChartBar(
                    charts: charts.chartBar,
                    MaxY: charts.barMaxY,
                    inAsyncCall: isApiCallProcess),
              ),
              const SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    "Acc. Monthly Drawing",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
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
