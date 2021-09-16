import 'package:asset_movement_app/controller/style.dart';
import 'package:asset_movement_app/model/loading.dart';
import 'package:asset_movement_app/model/routes.dart';
import 'package:asset_movement_app/view/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:asset_movement_app/controller/loginController.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

var _loginid_txt = new TextEditingController();
var _password_txt = new TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MediaSize.size=size;
    return SafeArea(
      child: Container(
        decoration: applyBackgroundImage("assets/login.jpg"),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: new Image.asset(
                            'assets/logo.png',
                            height: size.height * 0.1,
                          )),
                      new Text(
                        "Asset Movement App",
                        style: headingStyle(),
                        textAlign: TextAlign.center,
                      ),
                      CustomRowButtonAndTextField("Login ID", "", false, _loginid_txt,Colors.black),
                      CustomRowButtonAndTextField("Password", "", true, _password_txt,Colors.black),
                      CustomButtonRow('Login', 'Cancel',(){
                        LoginController.loginAction(_loginid_txt.text,_password_txt.text,context);

                      },(){}),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


