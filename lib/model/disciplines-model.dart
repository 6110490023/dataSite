

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


class DisciplineResponseModel {
  final List<DisciplineModel> disciplines;
  final String error;

  DisciplineResponseModel({required this.disciplines ,required this.error});

  factory DisciplineResponseModel.fromJson(Map<String, dynamic> json) {
    List<DisciplineModel> _disciplines = [];
    if (json["disciplines"] != null) {
      json["disciplines"].forEach((discipline) {
        DisciplineModel drawModel = DisciplineModel.formJson(discipline);
        _disciplines.add(drawModel);
      });
    }
    return DisciplineResponseModel(
      disciplines: _disciplines,
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class DisciplineRequestModel {
  int projectId; 
  int typeId;

  DisciplineRequestModel({required this.projectId ,required this.typeId});


  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'project_id': projectId,
      'type_id':typeId,
    };

    return map;
  }
}




class DisciplineModel {
  final int id;
  final String code;
  final String name;
  final String namePath;

  DisciplineModel({required this.id, required this.code,required this.name , required this.namePath});
  factory DisciplineModel.formJson(Map<String, dynamic> json) {
    return DisciplineModel(
        id: json["IntDisciplineId"] != null ? json["IntDisciplineId"] : 0,
        code: json["DisciplineCode"]!= null ? json["DisciplineCode"] : "",
        name: json["DisciplineName"] != null ? json["DisciplineName"] : "",
        namePath: json["DisciplinePic"] != null ? json["DisciplinePic"] : "",
        );
  }
}