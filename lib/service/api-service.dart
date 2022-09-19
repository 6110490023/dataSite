import 'package:basicflutter/model/disciplines-model.dart';
import 'package:basicflutter/model/location-model.dart';
import 'package:basicflutter/model/locationName_model.dart';
import 'package:basicflutter/model/materials-model.dart';
import 'package:basicflutter/model/project-model.dart';
import 'package:basicflutter/model/reportDaily-model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/chartDrawing-model.dart';
import '../model/chartManPower-model.dart';
import '../model/chartMaterial-model.dart';
import '../model/daily-model.dart';
import '../model/login-model.dart';
import '../model/tableDrawing-model.dart';
import 'package:http_parser/http_parser.dart';

class APIService {
//ต้องมาเเก้ domain
  String baseUrl = 'https://m.integreata.com';
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

  Future<ProjectResponseModel> getListProject(int IntMemberId) async {
    var url = Uri.parse(baseUrl + '/projects');
    var jsonData = json.encode({'IntMemberId': IntMemberId});
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
      return ProjectResponseModel.fromJson(
        json.decode(response.body),
      );
    } else if (response.statusCode == 408) {
      return ProjectResponseModel.fromJson({"erorr": "Time out"});
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<DisciplineResponseModel> getListDisciplines() async {
    var url = Uri.parse('$baseUrl/discipline');
    final response = await http.get(url).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('Error', 408);
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> data = {
        'disciplines': json.decode(response.body),
      };
      return DisciplineResponseModel.fromJson(data);
    } else if (response.statusCode == 408) {
      return DisciplineResponseModel.fromJson({"error": "Time out"});
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<DisciplineResponseModel> getListProjectType() async {
    var url = Uri.parse('$baseUrl/discipline');
    final response = await http.get(url).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('Error', 408);
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> data = {
        'disciplines': json.decode(response.body),
      };
      return DisciplineResponseModel.fromJson(data);
    } else if (response.statusCode == 408) {
      return DisciplineResponseModel.fromJson({"error": "Time out"});
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<LocationNameResponseModel> getLocationName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int projectId = preferences.getInt('projectId') ?? -1;
    var url = Uri.parse('$baseUrl/location-name');
    var jsonData = jsonEncode({'projectId': projectId});
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
        Map<String, dynamic> data = json.decode(response.body);

        return LocationNameResponseModel.fromJson(data);
      } else if (response.statusCode == 408) {
        return LocationNameResponseModel.fromJson({"erorr": "Time out"});
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
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

  Future<ReportDailyResponseModel> getReportDaily() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int memberId = preferences.getInt('memberId') ?? -1;
    var url = Uri.parse('$baseUrl/daily-report');
    var jsonData = jsonEncode({'IntMemberId': memberId});
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
        return ReportDailyResponseModel.fromJson(datatest);
      } else {
        throw Exception('Failed to load data!!!!!!');
      }
    } catch (e) {
      throw Exception('Failed to load data!');
    }
  }


  Future<Map<String, dynamic>> uploadDailyReport(
      fromDailyReportModel formData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //int projectId = preferences.getInt('projectId') ?? -1;
    int IntMemberId = preferences.getInt('memberId') ?? -1;
    var url = Uri.parse('$baseUrl/daily-form');
    var jsonData = jsonEncode({
      "IntDisciplineId": formData.disciplineId,
      "IntLocationId": formData.locationId,
      "IntMemberId": IntMemberId,
      "ReportContent": formData.textData
    });
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
        return datatest;
      } else {
        throw Exception('Failed to load data!!!!!!');
      }
    } catch (e) {
      throw Exception('Failed to load data!');
    }
  }

  Future<bool> uploadDailyImageReport(
    fromDailyReportModel formData, int IntReportId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int projectId = preferences.getInt('projectId') ?? -1;
    String ProjectGuId = preferences.getString('ProjectGuId') ?? '';
    var url = Uri.parse('$baseUrl/daily-form-images');
    final request = new http.MultipartRequest('POST', url);
    request.fields['projectId'] = projectId.toString();
    request.fields['ProjectGuId'] = ProjectGuId;
    request.fields['IntReportId'] = IntReportId.toString();
    List<MultipartFile> newList = [];
    List<XFile> images = formData.listImages;
    for (int i = 0; i < images.length; i++) {
      XFile imageFile = images[i];
      String fileName = imageFile.name;
      request.files.add(await http.MultipartFile.fromPath(
          'files', imageFile.path,
          filename: 'image_$fileName'));
    }
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Uploaded!');
      return true;
    } else {
      return false;
    }
  }

    Future<Map<String, dynamic>> upDateDailyReport(fromDailyReportModel formData,int IntReportId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //int projectId = preferences.getInt('projectId') ?? -1;
    int IntMemberId = preferences.getInt('memberId') ?? -1;
    var url = Uri.parse('$baseUrl/daily-form-update');
    var jsonData = jsonEncode({
      "IntReportId": IntReportId,
      "IntDisciplineId": formData.disciplineId,
      "IntLocationId": formData.locationId,
      "IntMemberId": IntMemberId,
      "ReportContent": formData.textData
    });
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
        return datatest;
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
