import 'package:http/http.dart' as http;
import 'dart:convert';
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

  List getManPowerChart() {
    return [
      [0.0, 0.0],
      [1.0, 2.0],
      [1.0, 2.0],
      [1.0, 2.0],
      [1.0, 2.0],
      [1.0, 5.0],
      [1.0, 5.0],
      [1.0, 5.0],
      [1.0, 2.0]
    ];
  }
  List getListMaterials(int Project_id){
    return [
      {"id": 1, "name": "m1"},
      {"id": 2, "name": "m2"},
      {"id": 3, "name": "m3"},
      {"id": 4, "name": "m4"},
    ];
  }
  List getMaterialsChart(int id) {
    return [
      [0.0, 0.0],
      [3.0, 2.0],
      [4.0, 5.0],
      [1.0, 5.0],
      [1.0, 2.0]
    ];
  }
}
