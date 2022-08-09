import 'package:flutter/material.dart';

class ReportManpower extends StatefulWidget {
  const ReportManpower({Key? key}) : super(key: key);

  @override
  State<ReportManpower> createState() => _ReportManpowerState();
}

class _ReportManpowerState extends State<ReportManpower> {
  final _formkey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Report Manpower'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InformationWidget(),
              const SizedBox(height: 30),
              FormCustom(),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              //valid flow
                            }
                          },
                          child: Text("Submit"))),
                ],
              ),
            ]),
      ),
    );
  }

  Widget InformationWidget() {
    return Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Subcontractor Name"),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text("First Name")),
                        Expanded(child: Text("Last Name")),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("SFC651100")),
                        Expanded(child: Text("Site Engineer")),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Project CI")),
                        Expanded(child: Text("")),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(flex: 3, child: Text("Image")),
            ],
          ),
        ],
      ),
    );
  }

  Widget FormCustom() {
    String selectedValue = "1";
    List<DropdownMenuItem<String>> categoryItems = [
      DropdownMenuItem(child: Text("1"), value: "1"),
      DropdownMenuItem(child: Text("2"), value: "2"),
      DropdownMenuItem(child: Text("3"), value: "3"),
      DropdownMenuItem(child: Text("4"), value: "4"),
    ];

    return Container(
        child: Form(
      key: _formkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text("category"),
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
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      validator: (value) =>
                          value == null ? "Select a country" : null,
                      dropdownColor: Colors.grey[100],
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      
                      },
                      items: categoryItems,
                    ),
                  ))
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text("Area"),
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
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      validator: (value) =>
                          value == null ? "Select a country" : null,
                      dropdownColor: Colors.grey[100],
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                        
                      },
                      items: categoryItems,
                    ),
                  ))
            ],
          ),
          SizedBox(height: 10),
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
                        Expanded(child: Text('${date.year}/${date.month}/${date.day}')),
                        
                        ElevatedButton(
                          onPressed: () async{
                            DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900), 
                            lastDate: DateTime(2100),);
                          if(newDate ==null) return;
                          setState(() {
                            date = newDate;
                          });
                         
                          }, 
                          child: Icon(Icons.date_range)),
                      ],
                    )),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text("Amount"),
              ),
              Expanded(
                flex: 10,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text("Preson"),
              )
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    ));
  }
}
