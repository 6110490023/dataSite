import 'dart:io';
import 'package:basicflutter/ProgressHUD.dart';
import 'package:basicflutter/model/daily-model.dart';
import 'package:basicflutter/service/api-service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditDaily extends StatefulWidget {
  final fromDailyReportModel oldFormModel;
  final  IntReportId;
  final String date;
  const EditDaily({required this.oldFormModel,required this.IntReportId,required this.date ,Key? key}) : super(key: key);

  @override
  State<EditDaily> createState() => _EditDailyState();
}

class _EditDailyState extends State<EditDaily> {
  final _formkey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  final ImagePicker imgpicker = ImagePicker();
  fromDailyReportModel formModel = fromDailyReportModel();
  bool isApiCallProcess = false;
  APIService apiService = APIService();
  List<DropdownMenuItem<String>> disciplines = [
    DropdownMenuItem(child: Text("No choose"), value: '-1'),
  ];
  List<DropdownMenuItem<String>> locationType = [
    DropdownMenuItem(child: Text("No choose"), value: ''),
    DropdownMenuItem(child: Text("Room"), value: "1"),
    DropdownMenuItem(child: Text("Area"), value: "2"),
    DropdownMenuItem(child: Text("Zone"), value: "3"),
  ];
  List<DropdownMenuItem<String>> locationName = [
    DropdownMenuItem(child: Text("No choose"), value: '-1'),
  ];

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        setState(() {
          formModel.listImages.addAll(pickedfiles);
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  deleteImages(XFile image) async {
    setState(() {
      formModel.listImages.remove(image);
    });
  }

  @override
  void initState() {
    super.initState();
    
    setState(() {
      isApiCallProcess = true;
    });
    apiService.getListDisciplines().then((value) {
      setState(() {
        for (final discipline in value.disciplines) {
          disciplines.add(DropdownMenuItem(
              value: discipline.id.toString(), child: Text(discipline.name)));
        }
      });
    });
    apiService.getLocationName().then((value) {
      setState(() {
        for (final location in value.locations) {
          locationName.add(DropdownMenuItem(
              value: location.intLocationId.toString(),
              child: Text(location.locationName)));
        }
        isApiCallProcess = false;
        formModel = widget.oldFormModel;
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
        title: const Center(
          child: Text('Daily Report'),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FormCustom(),
                if (formModel.listImages != [])
                  Wrap(
                    children: formModel.listImages.map((imageone) {
                      return Container(
                          child: Card(
                        child: Container(
                          child: Stack(
                            children: [
                              Image.file(
                                File(imageone.path),
                                height: MediaQuery.of(context).size.width / 3.6,
                                width: MediaQuery.of(context).size.width / 3.6,
                              ),
                              Positioned(
                                right: 5.0,
                                child: InkWell(
                                  child: Icon(Icons.remove_circle,
                                      size: 30, color: Colors.red),
                                  onTap: () {
                                    deleteImages(imageone);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    }).toList(),
                  )
                else
                  Container(),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          openImages();
                          // Navigator.pushNamed(context, '/Gallery');
                        },
                        child: Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isApiCallProcess = true;
                              });
                             
                              apiService
                                  .upDateDailyReport(formModel,widget.IntReportId)
                                  .then((value) {
                                if (value.isNotEmpty) {
                                  apiService
                                      .uploadDailyImageReport(
                                          formModel, value['IntReportId'])
                                      .then((value) {
                                        print("complete2");
                                      });
                                  
                                  setState(() {
                                    isApiCallProcess = false;
                                    formModel = fromDailyReportModel();
                                  });
                                }
                              });
                            },
                            child: Text("Submit"))),
                  ],
                ),
              ]),
        ),
      ),
    );
  }

  Widget dropdownCustom(String title, List<DropdownMenuItem<String>> options,
      String newValue, Function changeValue) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(title),
        ),
        Expanded(
            flex: 10,
            child: SizedBox(
              height: 50,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.grey[100],
                ),
                validator: (value) => value == null ? "Select a country" : null,
                dropdownColor: Colors.grey[100],
                value: newValue,
                onChanged: (newValue) {
                  changeValue(newValue);
                },
                items: options,
              ),
            ))
      ],
    );
  }

  Widget FormCustom() {
    return Container(
        child: Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text("Date"),
              ),
              Expanded(
                flex: 10,
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        
                        child: Text(widget.date),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          dropdownCustom(
              "Discipline", disciplines, formModel.disciplineId.toString(),
              (newValue) {
            setState(() {
              formModel.setDiscripline(int.parse(newValue));
            });
          }), 
          SizedBox(height: 10),
          dropdownCustom("Location Type", locationType, "", (newValue) {
            setState(() {
              formModel.locationId = newValue;
            });
          }),
          SizedBox(height: 10),
          dropdownCustom(
              "Location Name", locationName, formModel.locationId.toString(),
              (newValue) {
            setState(() {
              formModel.setLocation(int.parse(newValue));
            });
          }),
          SizedBox(height: 10),
          Text("Description"),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  initialValue: widget.oldFormModel.textData,
                  onChanged: (String? input) {
                    formModel.setTextData(input!);
                  },
                  onSaved: (String? input) {
                    formModel.setTextData(input!);
                  },
                  maxLines: 8,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius:
                            BorderRadius.all(new Radius.circular(5.0))),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    ));
  }
}
