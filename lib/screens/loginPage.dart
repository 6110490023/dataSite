import 'package:flutter/material.dart';
import 'package:basicflutter/ProgressHUD.dart';
import 'package:basicflutter/service/api-service.dart';
import 'package:basicflutter/model/login-model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel = LoginRequestModel();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(inAsyncCall: isApiCallProcess, child: _uiSetup(context));
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 100.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String? input) {
                          loginRequestModel.setEmail(input!);
                        },
                        validator: (input) => !input!.contains('@')
                            ? "Email Id should be valid"
                            : null,
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.2))),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        // style: const TextStyle(color: Colors.red),
                        keyboardType: TextInputType.text,
                        onSaved: (String? input) =>
                            loginRequestModel.setPassword(input!),
                        validator: (input) => input!.length < 3
                            ? "Password should be more than 3 characters"
                            : null,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.2))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).accentColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            color:
                                Theme.of(context).accentColor.withOpacity(0.4),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          if (validateAndSave()) {
                            print(loginRequestModel.toJson());

                            setState(() {
                              isApiCallProcess = true;
                            });

                            APIService apiService = APIService();
                            apiService.login(loginRequestModel).then((value) {
                              if (value != null) {
                                setState(() {
                                  isApiCallProcess = false;
                                });

                                if (value.token.isNotEmpty) {
                                  if(value.token.length>1){
                                    print("test");
                                  }
                            
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/', (route) => false);
                                }
                                else {
                                  final snackBar =
                                      SnackBar(content: Text(value.error));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            });
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          margin: const EdgeInsets.only(top: 26.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (route) => false);
                            },
                            child: Text('CONTAINED BUTTON'),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
