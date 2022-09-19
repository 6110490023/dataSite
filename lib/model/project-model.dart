class ProjectResponseModel {
  final List<dynamic> projects;
  final String error;

  ProjectResponseModel({required this.error,required this.projects});

  factory ProjectResponseModel.fromJson(Map<String, dynamic> json) {
    return ProjectResponseModel(
      projects: json["project"]!= null ? json["project"] : [],
      error: json["error"] != null ? json["error"] : "",
    );
  }
}
