import 'package:basicflutter/ProgressHUD.dart';
import 'package:basicflutter/component/pdf-viewer.dart';
import 'package:basicflutter/model/tableDrawing-model.dart';
import 'package:basicflutter/service/api-service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TableDrawing extends StatefulWidget {
  final int disciplineId;
  const TableDrawing({required this.disciplineId, Key? key}) : super(key: key);
  @override
  State<TableDrawing> createState() => _TableDrawingState();
}

class _TableDrawingState extends State<TableDrawing> {
  bool isApiCallProcess = false;
  APIService apiService = APIService();
  final int projectId = 1;
  List<ReportModel> listReport = [];
  List<DataRow> table = [];
  List<TableRow> table2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    apiService.getDrawingTable(projectId, widget.disciplineId).then((value) {
      setTable();
      setState(() {
        listReport = value.table;
        listReport.forEach((row) {
          table2.add(oneRow(row));
        });
        isApiCallProcess = false;
      });
    });
  }

  // DataRow addRow(ReportModel row) {
  //   DataRow _tableRow = DataRow(
  //     cells: <DataCell>[
  //       DataCell(
  //         ConstrainedBox(
  //           constraints: BoxConstraints(
  //             maxWidth: 10,
  //           ),
  //           child: IconButton(
  //               onPressed: () {
  //                 Navigator.push(context,
  //                     MaterialPageRoute(builder: (context) => PdfViewer()));
  //               },
  //               icon: const Icon(Icons.cable)),
  //         ),
  //       ),
  //       DataCell(
  //         ConstrainedBox(
  //           constraints: BoxConstraints(
  //             maxWidth: 30,
  //           ),
  //           child: Text(row.drawingNo, overflow: TextOverflow.ellipsis),
  //         ),
  //       ),
  //       DataCell(
  //         ConstrainedBox(
  //           constraints: BoxConstraints(maxWidth: 20),
  //           child: Text(row.flieName, overflow: TextOverflow.ellipsis),
  //         ),
  //       ),
  //       DataCell(
  //         ConstrainedBox(
  //           constraints: BoxConstraints(
  //             maxWidth: MediaQuery.of(context).size.width * 0.15,
  //           ),
  //           child: Text(row.status.toString(), overflow: TextOverflow.ellipsis),
  //         ),
  //       ),
  //     ],
  //   );

  //   return _tableRow;
  // }

  TableRow oneRow(ReportModel row) {
    TableRow _tableRow = TableRow(children: [
      TableRowInkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PdfViewer()));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(row.drawingNo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text('Discription',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )),
      Container(
        height: 35,
        child: Text(
          row.approveDate,
        ),
      ),
    ]);
    return _tableRow;
  }

  void setTable() {
    setState(() {
      table2 = <TableRow>[
        TableRow(decoration: BoxDecoration(color: Colors.grey[200]), children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Text('DrawingNo : Discription',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Text('Approved Date',
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ]),
      ];
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
          child: Center(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Table(
                      border: TableBorder(
                          horizontalInside: BorderSide(
                              width: 1,
                              color: Colors.black54,
                              style: BorderStyle.solid)),
                      columnWidths: {
                        0: FractionColumnWidth(0.7),
                        1: FractionColumnWidth(0.3)
                      },
                      children: table2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
