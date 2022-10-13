class LocationNameModel {
  final int intLocationId;
  final int intLocationTypeId; 
  final String locationName;
  LocationNameModel({required this.intLocationId, required this.intLocationTypeId ,required this.locationName});
  factory LocationNameModel.formJson(Map<String, dynamic> json) {
    return LocationNameModel(
      intLocationId:json["IntLocationId"] != null ? json["IntLocationId"] : 0,
      intLocationTypeId: json["IntLocationTypeId"] != null ? json["IntLocationTypeId"] : 0,
      locationName: json["LocationName"]!= null ? json["LocationName"] : "",
        
        );
  }
}

class LocationNameResponseModel {
  final List<LocationNameModel> locations;
  final String error;

  LocationNameResponseModel({required this.locations ,required this.error});

  factory LocationNameResponseModel.fromJson(Map<String, dynamic> json) {
    List<LocationNameModel> _locations = [];
    if (json["locations"] != null) {
      json["locations"].forEach((location) {
        LocationNameModel drawModel = LocationNameModel.formJson(location);
        _locations.add(drawModel);
      });
    }
    return LocationNameResponseModel(
      locations: _locations,
      error: json["error"] != null ? json["error"] : "",
    );
  }
}