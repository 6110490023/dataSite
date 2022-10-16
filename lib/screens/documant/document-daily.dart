import 'dart:math';
import 'package:basicflutter/screens/documant/daily/detail-daily.dart';
import 'package:intl/intl.dart';
import 'package:basicflutter/ProgressHUD.dart';
import 'package:basicflutter/model/daily-model.dart';
import 'package:basicflutter/model/reportDaily-model.dart';
import 'package:basicflutter/screens/report/edit-daily.dart';
import 'package:basicflutter/service/api-service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentDaily extends StatefulWidget {
  const DocumentDaily({Key? key}) : super(key: key);

  @override
  State<DocumentDaily> createState() => _DocumentDailyState();
}

class _DocumentDailyState extends State<DocumentDaily> {
  APIService apiService = APIService();
  bool isApiCallProcess = false;
  List<ReportDailyModel> reports = [];

  // Item of the ListView
  Widget _listItem(index) {
    String date = DateTime.now().toString().split(' ')[0];
    String dateCreate = reports[index].DtCreateDate.split('T')[0];
    List<Widget> info = [
      IconButton(
          iconSize: 35,
          color: Colors.blue[300],
          onPressed: () {
            // fromDailyReportModel formModel = fromDailyReportModel();
            // formModel.setDiscripline(reports[index].IntDisciplineId);
            // formModel.setLocation(reports[index].IntLocationId);
            // formModel.setLocationTypeId(
            //     reports[index].IntLocationTypeId.toString());
            // formModel.setTextData(reports[index].ReportContent.toString());

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailDaily()),
            );
          },
          icon: Icon(Icons.note_outlined)),
      SizedBox(width: 5),
      Column(
        children: [
          Row(children: [
            Text(
              reports[index].LocationName,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "(" + reports[index].LocationTypeName + ")",
              style: const TextStyle(fontSize: 20),
            ),
          ]),
          SizedBox(height: 10),
          Text(
            reports[index].ReportContent.split('\n')[0],
            style: const TextStyle(fontSize: 14),
          )
        ],
      )
    ];
    if (date == dateCreate) {
      info = [
        IconButton(
            iconSize: 30,
            color: Colors.blue[300],
            onPressed: () {
              // fromDailyReportModel formModel = fromDailyReportModel();
              // formModel.setDiscripline(reports[index].IntDisciplineId);
              // formModel.setLocation(reports[index].IntLocationId);
              // formModel.setLocationTypeId(
              //     reports[index].IntLocationTypeId.toString());
              // formModel.setTextData(reports[index].ReportContent.toString());

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailDaily()),
              );
            },
            icon: Icon(Icons.note_outlined)),
        IconButton(
            iconSize: 30,
            color: Colors.red[300],
            onPressed: () {
              fromDailyReportModel formModel = fromDailyReportModel();
              formModel.setDiscripline(reports[index].IntDisciplineId);
              formModel.setLocation(reports[index].IntLocationId);
              formModel.setLocationTypeId(
                  reports[index].IntLocationTypeId.toString());
              formModel.setTextData(reports[index].ReportContent.toString());

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditDaily(
                          oldFormModel: formModel,
                          IntReportId: reports[index].IntReportId,
                          date: dateCreate,
                        )),
              );
            },
            icon: Icon(Icons.edit_note_outlined)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                reports[index].LocationName,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "(" + reports[index].LocationTypeName + ")",
                style: const TextStyle(fontSize: 20),
              ),
            ]),
            SizedBox(height: 10),
            Text(
              reports[index].ReportContent.split('\n')[0],
              style: const TextStyle(fontSize: 14),
            )
          ],
        )
      ];
    }
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
      child: ListTile(
          title: Container(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, children: info),
          ),
          trailing: Text(date,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 81, 81, 81)))),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    apiService.getReportDaily().then((value) {
      reports = value.reports;
      setState(() {
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
          title: const Text('Daily Report'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: reports.length,
                  itemBuilder: (_, index) {
                    return _listItem(index);
                  }),
            ),
          ],
        ));
  }
}
