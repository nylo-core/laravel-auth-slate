String stubRegister() => '''
import '/app/models/auth_response.dart';
import '/app/events/laravel_auth_event.dart';
import '/app/networking/laravel_auth_api_service.dart';
import '/bootstrap/helpers.dart';
import '/app/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class RegisterPage extends NyStatefulWidget {
  final Controller controller = Controller();
  
  static const path = '/register';
  
  RegisterPage({Key? key}) : super(key: key);
  
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends NyState<RegisterPage> {

  final TextEditingController _controllerEmailField = TextEditingController(),
      _controllerPasswordField = TextEditingController();

  @override
  init() async {
    super.init();
  }

  _registerUser() async {
    String email = _controllerEmailField.text,
        password = _controllerPasswordField.text;

    await validate(rules: {
      "email": "email",
      "password": "^(?=.*\d).{4,8}\$"
    }, data: {
      "email": email,
      "password": password
    }, onSuccess: () async {
      await lockRelease('login', perform: () async {
        LaravelAuthResponse? laravelAuthResponse = await api<LaravelAuthApiService>((request) => request.register(email, password));

        event<LaravelAuthEvent>(data: {"user": laravelAuthResponse});
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: "38b48b".toHexColor(),
        title: Text("Register"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 1,
                        blurRadius: 15
                    )
                  ]
              ),
              child: Column(children: <Widget>[
                NyTextField(
                  controller: _controllerEmailField,
                  labelText: "EMAIL",
                  enableSuggestions: false,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  dummyData: "admin@matesbet.com",
                ),
                NyTextField(
                  controller: _controllerPasswordField,
                  labelText: "PASSWORD",
                  obscureText: true,
                  dummyData: "password",
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text((isLocked('login') ? "Processing" : "Register")),
                    onPressed: _registerUser,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
''';
