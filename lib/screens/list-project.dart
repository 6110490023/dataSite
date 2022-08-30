import 'package:basicflutter/component/list-component.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/login-model.dart';

class ListProject extends StatefulWidget {
  final LoginResponseModel loginResponse;
  const ListProject({required this.loginResponse, Key? key}) : super(key: key);

  @override
  State<ListProject> createState() => _ListProjectState();
}

class _ListProjectState extends State<ListProject> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<dynamic> project = [];
  bool isApiCallProcess = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.project = widget.loginResponse.project;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Project Status'),
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
  }

  Future<void> click(int index) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('projectId', project[index]['IntProjectId']);
    await prefs.setInt('memberId', project[index]['IntMemberId']);
    await prefs.setString('projectName', project[index]['ProjectName']);
    await Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
