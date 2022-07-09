import 'package:flutter/material.dart';

class ReportDaily extends StatefulWidget {
  const ReportDaily({Key? key}) : super(key: key);

  @override
  State<ReportDaily> createState() => _ReportDailyState();
}

class _ReportDailyState extends State<ReportDaily> {
  final _formkey = GlobalKey<FormState>();
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Dail Report'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                            child:
                                Text('${date.year}/${date.month}/${date.day}')),
                        ElevatedButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                              if (newDate == null) return;
                              setState(() {
                                date = newDate;
                              });
                              print("55555");
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
                        print(selectedValue);
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
                child: Text("Location"),
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
                        print(selectedValue);
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
                        print(selectedValue);
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
                        print(selectedValue);
                      },
                      items: categoryItems,
                    ),
                  ))
            ],
          ),
          SizedBox(height: 10),
          Text("data"),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
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
