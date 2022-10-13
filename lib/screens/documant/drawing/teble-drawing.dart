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
    apiService.getDrawingTable( widget.disciplineId).then((value) {
      if (value.error != "") {
        Navigator.pop(context);
        setState(() {
          isApiCallProcess = false;
        });
      }
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

  TableRow oneRow(ReportModel row) {
    TableRow _tableRow = TableRow(children: [
      TableRowInkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PdfViewer(
                          report: row,
                        )));
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
                Text(row.desc, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )),
      Container(
        height: 35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              row.approveDate,
            ),
          ],
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
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: const Text('Drawing No.  Discription',
            textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
              margin: const  EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: const  Text('Approved Date',
              textAlign: TextAlign.center,
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
        title: const Text('Drawing'),
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
