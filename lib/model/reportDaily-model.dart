class ReportDailyResponseModel {
  final List<ReportDailyModel> reports;
  final String error;

  ReportDailyResponseModel({ required this.reports, required this.error});

  factory ReportDailyResponseModel.fromJson(Map<String, dynamic> json) {
    List<ReportDailyModel> _row = [];
    if (json['reports'] != null) {
      json['reports'].forEach((report) {
        ReportDailyModel reportModel = ReportDailyModel.formJson(report);
        _row.add(reportModel);
      });
    }

    return ReportDailyResponseModel(
      reports: _row ?? [],
      error: json["error"] ?? "",
    );
  }
}

class ReportDailyModel {
  final String LocationTypeName;
  final String ReportContent;
  final String LocationName;
  final String DtCreateDate;
  final String DtLastUpdate;
  final int IntLocationId;
  final int IntReportId;
  final int IntDisciplineId;
  final int IntLocationTypeId;
  

  ReportDailyModel(
      {required this.LocationTypeName,
      required this.LocationName,
      required this.IntLocationId,
      required this.IntReportId,
      required this.ReportContent,
      required this.IntDisciplineId,
      required this.IntLocationTypeId,
      required this.DtCreateDate,
      required this.DtLastUpdate,
      });

  factory ReportDailyModel.formJson(dynamic json) {
    return ReportDailyModel(
        LocationTypeName: json["LocationTypeName"] ?? '',
        DtCreateDate: json["DtCreateDate"] ?? '',
        DtLastUpdate: json["DtLastUpdate"] ?? '',
        LocationName: json['LocationName']??'',
        IntLocationId: json['IntLocationId'] ?? -1,
        IntReportId: json["IntReportId"]??-1,
        ReportContent: json["ReportContent"] ??  '',
        IntDisciplineId: json["IntDisciplineId"] ?? -1,
        IntLocationTypeId: json['IntLocationTypeId']??-1
        );
  }
}
