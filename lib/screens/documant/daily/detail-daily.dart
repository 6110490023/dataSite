import 'dart:io';
import 'package:basicflutter/ProgressHUD.dart';
import 'package:basicflutter/model/daily-model.dart';
import 'package:basicflutter/service/api-service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetailDaily extends StatefulWidget {
  // final fromDailyReportModel oldFormModel;
  // final  IntReportId;
  // final String date;
  // const DetailDaily({required this.oldFormModel,required this.IntReportId,required this.date ,Key? key}) : super(key: key);
  const DetailDaily({Key? key}) : super(key: key);

  @override
  State<DetailDaily> createState() => _DetailDailyState();
}

class _DetailDailyState extends State<DetailDaily> {
  final ImagePicker imgpicker = ImagePicker();
  bool isApiCallProcess = false;
  APIService apiService = APIService();
  List imageList = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      isApiCallProcess = true;
      imageList = [
        "images/integreata-logo.jpg",
        "images/integreata-logo.jpg",
        "images/integreata-logo.jpg",
        "images/integreata-logo.jpg"
      ];
    });
    setState(() {
      isApiCallProcess = false;
    });
    // apiService.getListDisciplines().then((value) {
    //   setState(() {
    //     for (final discipline in value.disciplines) {
    //       disciplines.add(DropdownMenuItem(
    //           value: discipline.id.toString(), child: Text(discipline.name)));
    //     }
    //   });
    // });
    // apiService.getLocationName().then((value) {
    //   setState(() {
    //     for (final location in value.locations) {
    //       locationName.add(DropdownMenuItem(
    //           value: location.intLocationId.toString(),
    //           child: Text(location.locationName)));
    //     }
    //     isApiCallProcess = false;
    //     formModel = widget.oldFormModel;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(inAsyncCall: isApiCallProcess, child: _uiSetup(context));
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Daily Report'),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(17),
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFFEEEDED))),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      'Project Name :',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      'Project A',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      'Daily Report :',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      '10-11-2022',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      'Disclipine :',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      'test1234',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      'Location :',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      'test1234',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Username :',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              'nuteknarin.120643@gmail.com',
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              'Position :',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Text(
                              'developer',
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text(
                              'Description :',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              'data\ntest\ndescription',
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text(
                              'images ',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.zero,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 0),
                              child: ListImage(imageList)),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ListImage(List imageList) {
    return imageList.length != 0
        ? GridView.builder(
          padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: imageList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.red,
                margin: const EdgeInsets.all(5.0),
                child: Image(
                  image: AssetImage(imageList[index]),
                  fit: BoxFit.cover,
                ),
              );
            })
        : Container(
            child: Text("no image"),
          );
  }
}
