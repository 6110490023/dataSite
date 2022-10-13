import 'package:basicflutter/component/list-component.dart';
import 'package:basicflutter/model/disciplines-model.dart';
import 'package:basicflutter/screens/documant/drawing/teble-drawing.dart';
import 'package:basicflutter/screens/insught/drawing/chart-drawing.dart';
import 'package:flutter/material.dart';
import '../../ProgressHUD.dart';
import '../../service/api-service.dart';

class DocumentDrawing extends StatefulWidget {
  const DocumentDrawing({Key? key}) : super(key: key);

  @override
  State<DocumentDrawing> createState() => _DocumentDrawingState();
}

class _DocumentDrawingState extends State<DocumentDrawing> {
  APIService apiService = APIService();
  List<DisciplineModel> disciplines = [];
  bool isApiCallProcess = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    apiService.getListDisciplines().then((value) {
     
      if (value.error != "") {  
        setState(() {
          isApiCallProcess = false;
        });
        Navigator.pop(context);
      }
      setState(() {
        disciplines = value.disciplines;
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
        title: const Text('Document : Drawing'),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.white70,
        child: ListView.builder(
          itemCount: disciplines.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.13,
                child: ListCard(
                    namePath: disciplines[index].namePath,
                    title: disciplines[index].name,
                    function: () {
                      click(index);
                    }));
          },
        ),
      ),
    );
  }

  void click(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TableDrawing(disciplineId: disciplines[index].id)),
    );
  }
}
