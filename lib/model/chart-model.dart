class ChartModel {
  final String lable;
  final double plan;
  final double actuality;

  ChartModel(
      {required this.lable, required this.plan, required this.actuality});

  factory ChartModel.formJson(Map<String, dynamic> json) {
    return ChartModel(
        lable: json["lable"] != null ? json["lable"] : "",
        plan: json["plan"] != null ? json["plan"].toDouble() : 0.0,
        actuality: json["actuality"] != null ? json["actuality"].toDouble() : 0.0);
  }
}