import 'package:basicflutter/component/list-component.dart';
import 'package:basicflutter/service/api-service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/login-model.dart';

class ListProject extends StatefulWidget {
  final bool isFirst;
  const ListProject({required this.isFirst, Key? key}) : super(key: key);

  @override
  State<ListProject> createState() => _ListProjectState();
}

class _ListProjectState extends State<ListProject> {
  APIService apiService = APIService();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<dynamic> project = [];
  bool isApiCallProcess = false;
  bool isFirst = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProjectbyMemberId();
    setState(() {
      isFirst = widget.isFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.isFirst) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Project'),
        ),
        body: Container(
          margin: const EdgeInsets.all(5),
          color: Colors.white70,
          child: ListView.builder(
            itemCount: project.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: ListCard(
                      namePath: "",
                      title: project[index]['ProjectName'],
                      function: () {
                        click(index);
                      }));
            },
          ),
        ),
      );
    } else {
      return  Container(
        margin: const EdgeInsets.all(5),
        color: Colors.white70,
        child: ListView.builder(
          itemCount: project.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.13,
                child: ListCard(
                    namePath: "",
                    title: project[index]['ProjectName'],
                    function: () {
                      click(index);
                    }));
          },
        ),
      );  
    }
  }

  Future<void> click(int index) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('projectId', project[index]['IntProjectId']);
    await prefs.setString('projectName', project[index]['ProjectName']);
    await prefs.setString('ProjectGuId', project[index]['ProjectGuId']);
    await Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  Future<void> getProjectbyMemberId() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      isApiCallProcess = true;
    });
    int IntMemberId = prefs.getInt('memberId') ?? -1;
    apiService.getListProject(IntMemberId).then((value) {
      if (value != null) {
        setState(() {
          project = value.projects;
          isApiCallProcess = false;
        });
      }
    });
  }
}
