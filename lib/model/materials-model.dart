/*
--------------------------------------------
Response from web
--------------------------------------------
 {
  'materials':[
    {'id': 11,'name': "a"},
    {'id': 12,'name': "a"},
    {'id': 13,'name': "a"},
    {'id': 14,'name': "a"},
    {'id': 15,'name': "a"},
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

class MaterialsResponseModel {
  final List<MaterialModel> materials;
  final String error;

  MaterialsResponseModel({required this.materials, required this.error});

  factory MaterialsResponseModel.fromJson(Map<String, dynamic> json) {
    List<MaterialModel> _materials = [];
    if (json["materials"] != null) {
      json["materials"].forEach((material) {
        MaterialModel chartModel = MaterialModel.formJson(material);
        _materials.add(chartModel);
      });
    }
    return MaterialsResponseModel(
      materials: _materials,
      error: json["error"] ?? "",
    );
  }
}

class MaterialsRequestModel {
  int projectId;

  MaterialsRequestModel({required this.projectId});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'pid': projectId};

    return map;
  }
}

class MaterialModel {
  final int id;
  final String name;
  final String namePath;

  MaterialModel({required this.id, required this.name ,required this.namePath});
  factory MaterialModel.formJson(Map<String, dynamic> json) {
    return MaterialModel(
        id: json["material_id"] ?? 0, name: json["name"] ?? "", namePath: json["name"] ?? "");
  }
}
