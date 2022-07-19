

/*
--------------------------------------------
Response from web
--------------------------------------------
 {
  'draws':[
  {"IntDisciplineId":2,"DisciplineCode":"AR","DisciplineName":"Architectural"},
  {"IntDisciplineId":2,"DisciplineCode":"AR","DisciplineName":"Architectural"},
  {"IntDisciplineId":2,"DisciplineCode":"AR","DisciplineName":"Architectural"},
  {"IntDisciplineId":2,"DisciplineCode":"AR","DisciplineName":"Architectural"},
  {"IntDisciplineId":2,"DisciplineCode":"AR","DisciplineName":"Architectural"},
  ],
 }
---------------------------------------------
Request to web
---------------------------------------------
{
  pid: 15,
}
---------------------------------------------
 */


class DrawResponseModel {
  final List<DrawModel> drows;
  final String error;

  DrawResponseModel({required this.drows ,required this.error});

  factory DrawResponseModel.fromJson(Map<String, dynamic> json) {
    List<DrawModel> _draws = [];
    if (json["draws"] != null) {
      json["draws"].forEach((draw) {
        DrawModel drawModel = DrawModel.formJson(draw);
        _draws.add(drawModel);
      });
    }
    return DrawResponseModel(
      drows: _draws,
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class DrowRequestModel {
  int projectId; 
  int typeId;

  DrowRequestModel({required this.projectId ,required this.typeId});


  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'project_id': projectId,
      'type_id':typeId,
    };

    return map;
  }
}




class DrawModel {
  final int id;
  final String code;
  final String name;

  DrawModel({required this.id, required this.code,required this.name});
  factory DrawModel.formJson(Map<String, dynamic> json) {
    return DrawModel(
        id: json["IntDisciplineId"] != null ? json["IntDisciplineId"] : 0,
        code: json["DisciplineCode"]!= null ? json["DisciplineCode"] : "",
        name: json["DisciplineName"] != null ? json["DisciplineName"] : ""
        );
  }
}