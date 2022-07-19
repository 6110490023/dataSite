/*
--------------------------------------------
Response from web
--------------------------------------------
 {
  chartLine:[
    {'lable': 'a','plan': 1000,'actuality': 1000},
    {lable: "a",plan: 1000,actuality: 1000}
  ],
  chartBar: [
    {lable: "a",plan: 1000,actuality: 1000},
    {lable: "a",plan: 1000,actuality: 1000},
  ]
 }
---------------------------------------------
Request to web
---------------------------------------------
{
  pid: 15,
  mid: 20
}
---------------------------------------------
 */
import 'chart-model.dart';

class ChartDrawingResponseModel {
  final List<ChartModel> chartBar;
  final List<ChartModel> chartLine;
  final double lineMaxY;
  final double barMaxY;
  final String error;

  ChartDrawingResponseModel(
      {required this.chartBar,
      required this.chartLine,
      required this.error,
      required this.lineMaxY,
      required this.barMaxY});

  factory ChartDrawingResponseModel.fromJson(Map<String, dynamic> json) {
    List<ChartModel> _chartLine = [];
    double _lineMaxY = 0.0;
    if (json["chartLine"] != null) {
      json["chartLine"].forEach((chart) {
        ChartModel chartModel = ChartModel.formJson(chart);
        if (chartModel.actuality > _lineMaxY) {
          _lineMaxY = chartModel.actuality;
        }
        if (chartModel.plan > _lineMaxY) {
          _lineMaxY = chartModel.plan;
        }
        _chartLine.add(chartModel);
      });
    }
    List<ChartModel> _chartBar = [];
    double _barMaxY = 0.0;
    if (json["chartBar"] != null) {
      json["chartBar"].forEach((chart) {
        ChartModel chartModel = ChartModel.formJson(chart);
        if (chartModel.actuality > _barMaxY) {
          _barMaxY = chartModel.actuality;
        }
        if (chartModel.plan > _barMaxY) {
          _barMaxY = chartModel.plan;
        }
        _chartBar.add(chartModel);
      });
    }

    return ChartDrawingResponseModel(
      chartLine: _chartLine,
      chartBar: _chartBar,
      lineMaxY: _lineMaxY*1.1,
      barMaxY: _barMaxY*1.1,
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class ChartDrawingRequestModel {
  int projectId = 0;
  int disciplineId = 0;

  ChartDrawingRequestModel();
  void setProjectId(int projectId) {
    projectId  = projectId;
  }

  void setDrawingId(int disciplineId) {
    disciplineId = disciplineId;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'pid': disciplineId,
      'id': disciplineId,
    };

    return map;
  }
}
