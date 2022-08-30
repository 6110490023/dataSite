import 'package:basicflutter/model/drawing-model.dart';
import 'package:basicflutter/model/materials-model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/chartDrawing-model.dart';
import '../model/chartManPower-model.dart';
import '../model/chartMaterial-model.dart';
import '../model/login-model.dart';
import '../model/tableDrawing-model.dart';

class APIService {
//ต้องมาเเก้ domain
  String baseUrl = 'http://192.168.1.12:4200';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//-------------------------------------------------------------------
//api เสร๋จเเล้ว
//-------------------------------------------------------------------
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.parse(baseUrl + '/login');
    var jsonData = json.encode(requestModel.toJson());
    final response = await http
        .post(url,
            headers: {"Content-Type": "application/json"}, body: jsonData)
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('Error', 408);
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else if (response.statusCode == 408) {
      return LoginResponseModel.fromJson({"erorr": "Time out"});
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<DrawResponseModel> getListDraws() async {
    var url = Uri.parse('$baseUrl/drawing-discipline');
    final response = await http.get(url).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('Error', 408);
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> data = {
        'draws': json.decode(response.body),
      };
      return DrawResponseModel.fromJson(data);
    } else if (response.statusCode == 408) {
      return DrawResponseModel.fromJson({"error": "Time out"});
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<ChartDrawingResponseModel> getDrawingChart(int disciplineId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int projectId = preferences.getInt('projectId') ?? -1;
    var url = Uri.parse('$baseUrl/drawing-chart');

    var jsonData =
        jsonEncode({'projectId': projectId, 'disciplineId': disciplineId});
    try {
      final response = await http
          .post(url,
              headers: {"Content-Type": "application/json"}, body: jsonData)
          .timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );
      if (response.statusCode == 200 || response.statusCode == 400) {
        Map<String, dynamic> datatest = json.decode(response.body);

        return ChartDrawingResponseModel.fromJson(datatest);
      } else if (response.statusCode == 408) {
        return ChartDrawingResponseModel.fromJson({"erorr": "Time out"});
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      throw Exception('Failed to load data!');
    }
  }

  Future<TableDrawingResponseModel> getDrawingTable(int disciplineId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int projectId = preferences.getInt('projectId') ?? -1;
    var url = Uri.parse('$baseUrl/drawing-report');

    var jsonData =
        jsonEncode({'projectId': projectId, 'disciplineId': disciplineId});
    try {
      final response = await http
          .post(url,
              headers: {"Content-Type": "application/json"}, body: jsonData)
          .timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );
      if (response.statusCode == 200 || response.statusCode == 400) {
        Map<String, dynamic> datatest = json.decode(response.body);
        return TableDrawingResponseModel.fromJson(datatest);
      } else {
        throw Exception('Failed to load data!!!!!!');
      }
    } catch (e) {
      throw Exception('Failed to load data!');
    }
  }

//----------------------------------------------------------- --------
//api ด้านล่าคือยังไม่เสร็จ
//-------------------------------------------------------------------

  Future<MaterialsResponseModel> getListMaterials(int projectID) async {
    var url = Uri.parse('https://reqres.in/api/login');
    LoginRequestModel requestModel = LoginRequestModel();
    requestModel.setEmail("eve.holt@reqres.in");
    requestModel.setPassword("cityslicka");
    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> json = {
        'materials': [
          {"id": 1, "name": "m1"},
          {"id": 2, "name": "m2"},
          {"id": 3, "name": "m3"},
          {"id": 4, "name": "m4"},
          {"id": 1, "name": "m1"},
          {"id": 2, "name": "m2"},
          {"id": 3, "name": "m3"},
          {"id": 4, "name": "m4"},
          {"id": 1, "name": "m1"},
          {"id": 2, "name": "m2"},
          {"id": 3, "name": "m3"},
          {"id": 4, "name": "m4"},
        ]
      };
      return MaterialsResponseModel.fromJson(json);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<ChartManpowerResponseModel> getManPowerChart(int projectID) async {
    var url = Uri.parse('https://reqres.in/api/login');
    LoginRequestModel requestModel = LoginRequestModel();
    requestModel.setEmail("eve.holt@reqres.in");
    requestModel.setPassword("cityslicka");
    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> json = {
        'chartBar': [
          {'label': 'a', 'plan': 1100, 'actual': 1150},
          {'label': 'a', 'plan': 1200, 'actual': 1250},
          {'label': 'a', 'plan': 1300, 'actual': 1350},
          {'label': 'a', 'plan': 1400, 'actual': 1450},
        ],
        'chartLine': [
          {'label': 'a', 'plan': 1100, 'actual': 1150},
          {'label': 'a', 'plan': 1200, 'actual': 1250},
          {'label': 'a', 'plan': 1300, 'actual': 1350},
          {'label': 'a', 'plan': 1400, 'actual': 1450},
        ],
      };
      return ChartManpowerResponseModel.fromJson(json);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<ChartMaterialResponseModel> getMaterialsChart(
      int projectID, int materialID) async {
    var url = Uri.parse('https://reqres.in/api/login');
    LoginRequestModel requestModel = LoginRequestModel();
    requestModel.setEmail("eve.holt@reqres.in");
    requestModel.setPassword("cityslicka");
    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> json = {
        'chartBar': [
          {'label': 'a', 'plan': 1100, 'actual': 1150},
          {'label': 'a', 'plan': 1200, 'actual': 1250},
          {'label': 'a', 'plan': 1300, 'actual': 1350},
          {'label': 'a', 'plan': 1400, 'actual': 1450},
        ],
        'chartLine': [
          {'label': 'a', 'plan': 1100, 'actual': 1150},
          {'label': 'a', 'plan': 1200, 'actual': 1250},
          {'label': 'a', 'plan': 1300, 'actual': 1350},
          {'label': 'a', 'plan': 1400, 'actual': 1450},
        ],
      };
      return ChartMaterialResponseModel.fromJson(json);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
