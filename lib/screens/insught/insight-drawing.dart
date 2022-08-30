import 'package:basicflutter/component/list-component.dart';
import 'package:basicflutter/model/drawing-model.dart';
import 'package:basicflutter/screens/insught/drawing/chart-drawing.dart';
import 'package:flutter/material.dart';
import '../../ProgressHUD.dart';
import '../../service/api-service.dart';

class InsightDrawing extends StatefulWidget {
  const InsightDrawing({Key? key}) : super(key: key);

  @override
  State<InsightDrawing> createState() => _InsightDrawingState();
}

class _InsightDrawingState extends State<InsightDrawing> {
  APIService apiService = APIService();
  List<DrawModel> draws = [];
  bool isApiCallProcess = false;
  int projectId = 10;
  int typeID = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    apiService.getListDraws().then((value) {
       if (value.error != "") {  
        setState(() {
          isApiCallProcess = false;
        });
        Navigator.pop(context);
      }
      setState(() {
        draws = value.drows;
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
        title: const Text('Insight Drawing Status'),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.white70,
        child: ListView.builder(
          itemCount: draws.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.13,
                child: ListCard(
                    namePath: draws[index].namePath,
                    title: draws[index].name,
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
      MaterialPageRoute(builder: (context) => ChartDrawing(disciplineId:draws[index].id)),
    );
  }
}
