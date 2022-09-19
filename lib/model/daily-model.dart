import 'package:image_picker/image_picker.dart';

class fromDailyReportModel {
  int disciplineId = -1;
  String textData = '';
  int locationId = -1;
  String locationTypeId = '';
  List<XFile> listImages =[];
  
  fromDailyReportModel();
  void setTextData(String data) {
    textData = data;
  }

  void setListImages(List<XFile> _images) {
    listImages = _images;
  }

  void setLocation(int _location) {
    locationId = _location;
  }
  void setLocationTypeId(String _locationTypeId) {
    locationTypeId = _locationTypeId;
  }

  void setDiscripline(int _discripline) {
    disciplineId = _discripline;
  }
}
