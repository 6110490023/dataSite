class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token,required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
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
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
