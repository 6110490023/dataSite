import 'package:basicflutter/model/materials-model.dart';
import 'package:basicflutter/screens/insught/materials/chart-material.dart';
import 'package:flutter/material.dart';
import '../../ProgressHUD.dart';
import '../../component/list-component.dart';
import '../../service/api-service.dart';

class InsightMaterials extends StatefulWidget {
  const InsightMaterials({Key? key}) : super(key: key);

  @override
  State<InsightMaterials> createState() => _InsightMaterialsState();
}

class _InsightMaterialsState extends State<InsightMaterials> {
  APIService apiService = APIService();
  List<MaterialModel> materials = [];
  bool isApiCallProcess = false;
  int project_id = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    apiService.getListMaterials(project_id).then((value) {
      if (value.error != "") {
        Navigator.pop(context);
        setState(() {
          isApiCallProcess = false;
        });
      }
      setState(() {
        materials = value.materials;
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
        title: const Text('Insight Materials'),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.white70,
        child: ListView.builder(
          itemCount: materials.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.13,
                child: ListCard(
                    namePath: "test",
                    title: materials[index].name,
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
          builder: (context) => ChartMaterial(materials[index].id)),
    );
  }
}
