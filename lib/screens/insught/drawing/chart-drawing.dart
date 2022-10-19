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
    listYear: [],
    barMaxY: 1000.0,
    lineMaxY: 1000.0,
    error: '',
  );
  List<DropdownMenuItem<String>> options = [
    DropdownMenuItem(child: Text("not choose"), value: ""),
  ];
  String selectValue = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    // selectValue = 
    apiService.getDrawingChart(widget.disciplineId, selectValue).then((value) {
      print(value.chartLine[0].actual);
      if (value.error != "") {
        Navigator.pop(context);
        setState(() {
          isApiCallProcess = false;
        });
      }

      setState(() {
        charts = value;
        if (value.listYear.length >0){
          for (final year in value.listYear) {
          options.add(DropdownMenuItem(
              value: year.toString(), child: Text(year.toString())));
        }
        selectValue = value.listYear[0].toString();
        }
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
