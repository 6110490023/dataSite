import 'package:basicflutter/model/drowing-model.dart';
import 'package:basicflutter/model/materials-model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/chartDrawing-model.dart';
import '../model/chartManPower-model.dart';
import '../model/chartMaterial-model.dart';
import '../model/login-model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.parse('https://reqres.in/api/login');
    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

//-------------------------------------------------------------------
//api เเก้ domain
//-------------------------------------------------------------------
  Future<DrawResponseModel> getListDraws() async {
    var url = Uri.parse('http://192.168.1.5:3000/drawing-discipline');
    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> data = {
        'draws': json.decode(response.body),
      };
      return DrawResponseModel.fromJson(data);
    } else {
      throw Exception('Failed to load data!');
    }
  }

//-------------------------------------------------------------------
//api ที่เเก้เสร็จเเล้วอยู่ด้านบน ด้านล่าคือยังไม่เสร็จ
//-------------------------------------------------------------------
  Future<ChartDrawingResponseModel> getDrawingChart(
      int projectId, int disciplineId) async {
    var url = Uri.parse('http://192.168.1.5:3000/drawing-table');

    var data = jsonEncode({
      'projectId': projectId,
      'disciplineId': disciplineId
    });
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: data);
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> jsontest = {
        'chartBar': [
          {'lable': 'a', 'plan': 1100, 'actuality': 1150},
          {'lable': 'a', 'plan': 1200, 'actuality': 1250},
          {'lable': 'a', 'plan': 1300, 'actuality': 1350},
          {'lable': 'a', 'plan': 1400, 'actuality': 1450},
        ],
        'chartLine': [
          {'lable': 'a', 'plan': 1100, 'actuality': 1150},
          {'lable': 'a', 'plan': 1200, 'actuality': 1250},
          {'lable': 'a', 'plan': 1300, 'actuality': 1350},
          {'lable': 'a', 'plan': 1400, 'actuality': 1450},
        ],
      };
      return ChartDrawingResponseModel.fromJson(jsontest);
    } else {
      throw Exception('Failed to load data!');
    }
  }

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
          {'lable': 'a', 'plan': 1100, 'actuality': 1150},
          {'lable': 'a', 'plan': 1200, 'actuality': 1250},
          {'lable': 'a', 'plan': 1300, 'actuality': 1350},
          {'lable': 'a', 'plan': 1400, 'actuality': 1450},
        ],
        'chartLine': [
          {'lable': 'a', 'plan': 1100, 'actuality': 1150},
          {'lable': 'a', 'plan': 1200, 'actuality': 1250},
          {'lable': 'a', 'plan': 1300, 'actuality': 1350},
          {'lable': 'a', 'plan': 1400, 'actuality': 1450},
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
          {'lable': 'a', 'plan': 1100, 'actuality': 1150},
          {'lable': 'a', 'plan': 1200, 'actuality': 1250},
          {'lable': 'a', 'plan': 1300, 'actuality': 1350},
          {'lable': 'a', 'plan': 1400, 'actuality': 1450},
        ],
        'chartLine': [
          {'lable': 'a', 'plan': 1100, 'actuality': 1150},
          {'lable': 'a', 'plan': 1200, 'actuality': 1250},
          {'lable': 'a', 'plan': 1300, 'actuality': 1350},
          {'lable': 'a', 'plan': 1400, 'actuality': 1450},
        ],
      };
      return ChartMaterialResponseModel.fromJson(json);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
