class TableDrawingResponseModel {
  final List<ReportModel> table;
  final String error;

  TableDrawingResponseModel(
      {required this.table,
      required this.error,});

  factory TableDrawingResponseModel.fromJson(Map<String, dynamic> json) {
    List<ReportModel> _table = [];
    if (json["table"] != null) {
      json["table"].forEach((report) {
        print(report['drawingNo']);
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
class ReportModel{
  final String drawingNo;
  final String desc;
  final String flieName;
  final int status;
  final String approveDate;

  ReportModel(
      {required this.drawingNo, required this.desc, required this.flieName ,required this.status ,required this.approveDate});

  factory ReportModel.formJson(dynamic json) {
    print("test1234");
    print(json);
    return ReportModel(
        drawingNo: json["drawingNo"] ?? '',
        desc: json["description"]??'', 
        flieName: json["fileName"] ??'',
        status: json["DrawingStatusId"]!=null ?  json["DrawingStatusId"]:-1,
        approveDate: json["approveDate"] != null? json["approveDate"]:'00/00/0000');
  }
}
