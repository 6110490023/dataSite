class TableDrawingResponseModel {
  final List<ReportModel> table;
  final String error;

  TableDrawingResponseModel({
    required this.table,
    required this.error,
  });

  factory TableDrawingResponseModel.fromJson(Map<String, dynamic> json) {
    List<ReportModel> _table = [];
    if (json["table"] != null) {
      json["table"].forEach((report) {
        ReportModel reportModel = ReportModel.formJson(report);
        _table.add(reportModel);
      });
    }

    return TableDrawingResponseModel(
      table: _table,
      error: json["error"] ?? "",
    );
  }
}

class ReportModel {
  final String drawingNo;
  final String desc;
  final String flieName;
  final String approveDate;
  final String projectGuId;
  final String fileRawName;
  final String intFileId;

  ReportModel(
      {required this.drawingNo,
      required this.desc,
      required this.flieName,
      required this.intFileId,
      required this.fileRawName,
      required this.projectGuId,
      required this.approveDate});

  factory ReportModel.formJson(dynamic json) {
    return ReportModel(
        drawingNo: json["drawingNo"] ?? '',
        desc: json["description"] ?? '',
        flieName: json["fileName"] ?? '',
        intFileId: json['intFileId'] != null ? json['intFileId'] :'',
        projectGuId: json["projectGuId"]??'',
        fileRawName: json["fileRawName"] ??  '',
        approveDate: json["approveDate"] != null ? json["approveDate"] : '00/00/0000');
  }
}
