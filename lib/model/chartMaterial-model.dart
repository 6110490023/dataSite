/*
--------------------------------------------
Response from web
--------------------------------------------
 {
  chartLine:[
    {'label': 'a','plan': 1000,'actuality': 1000},
    {label: "a",plan: 1000,actuality: 1000}
  ],
  chartBar: [
    {label: "a",plan: 1000,actuality: 1000},
    {label: "a",plan: 1000,actuality: 1000},
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

class ChartMaterialResponseModel {
  final List<ChartModel> chartBar;
  final List<ChartModel> chartLine;
  final double lineMaxY;
  final double barMaxY;
  final String error;

  ChartMaterialResponseModel(
      {required this.chartBar,
      required this.chartLine,
      required this.error,
      required this.lineMaxY,
      required this.barMaxY});

  factory ChartMaterialResponseModel.fromJson(Map<String, dynamic> json) {
    List<ChartModel> _chartLine = [];
    double _lineMaxY = 0.0;
    if (json["chartLine"] != null) {
      json["chartLine"].forEach((chart) {
        ChartModel chartModel = ChartModel.formJson(chart);
        if (chartModel.actual > _lineMaxY) {
          _lineMaxY = chartModel.actual;
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
        if (chartModel.actual > _barMaxY) {
          _barMaxY = chartModel.actual;
        }
        if (chartModel.plan > _barMaxY) {
          _barMaxY = chartModel.plan;
        }
        _chartBar.add(chartModel);
      });
    }

    return ChartMaterialResponseModel(
      chartLine: _chartLine,
      chartBar: _chartBar,
      lineMaxY: _lineMaxY*1.1,
      barMaxY: _barMaxY*1.1,
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class ChartMaterialRequestModel {
  int project_id = 0;
  int material_id = 0;

  ChartMaterialRequestModel();
  void setProjectId(int projectId) {
    project_id = projectId;
  }

  void setMaterialId(int materialId) {
    material_id = materialId;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'pid': project_id.toString(),
      'mid': material_id.toString(),
    };

    return map;
  }
}
