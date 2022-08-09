class LoginResponseModel {
  final bool canLogin;
  final List<dynamic> project;
  final String error;

  LoginResponseModel({required this.canLogin,required this.error,required this.project});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      canLogin: json["canLogin"] != null ? json["canLogin"] : false,
      project: json["project"]!= null ? json["project"] : [],
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String email ='';
  String password = '';

  LoginRequestModel();
  void setEmail(String email){
    this.email = email;

  }
   void setPassword(String password){
    this.password = password;

  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
