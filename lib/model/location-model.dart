class LocationTypeModel {
  final int id;
  final String type;

  LocationTypeModel({required this.id, required this.type});
  factory LocationTypeModel.formJson(Map<String, dynamic> json) {
    return LocationTypeModel(
        id: json["IntLocationTypeId"] != null ? json["IntLocationTypeId"] : 0,
        type: json["LocationTypeName"]!= null ? json["LocationTypeName"] : "",
        
        );
  }
}

class LocationTypeResponseModel {
  final List<LocationTypeModel> locations;
  final String error;

  LocationTypeResponseModel({required this.locations ,required this.error});

  factory LocationTypeResponseModel.fromJson(Map<String, dynamic> json) {
    List<LocationTypeModel> _locations = [];
    if (json["disciplines"] != null) {
      json["disciplines"].forEach((location) {
        LocationTypeModel drawModel = LocationTypeModel.formJson(location);
        _locations.add(drawModel);
      });
    }
    return LocationTypeResponseModel(
      locations: _locations,
      error: json["error"] != null ? json["error"] : "",
    );
  }
}