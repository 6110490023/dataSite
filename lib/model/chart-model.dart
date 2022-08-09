class ChartModel {
  final double label;
  final double plan;
  final double actual;
  final String disciplineName;

  ChartModel(
      {required this.label, required this.plan, required this.actual ,required this.disciplineName});

  factory ChartModel.formJson(Map<String, dynamic> json) {
    return ChartModel(
        disciplineName: json["disciplineName"] ?? "",
        label: json["label"]!= null ? json["label"].toDouble() : 0.0, 
        plan: json["plan"] != null ? json["plan"].toDouble() : 0.0,
        actual: json["actual"] != null ? json["actual"].toDouble() : 0.0);
  }
}