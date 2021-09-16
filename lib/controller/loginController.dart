

import 'package:asset_movement_app/model/dbConnection.dart';
import 'package:asset_movement_app/model/loading.dart';
import 'package:asset_movement_app/model/routes.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:asset_movement_app/view/customWidgets.dart';
import 'package:provider/provider.dart';


class LoginController{

  static Future<void> loginAction(String id,String password, BuildContext context) async {

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar("Please wait.......", Duration(minutes: 1)),);
      await DbConnection.connectDb();
      print("Connection is ${DbConnection.conn}");
      bool result = await DbConnection.IsUserExist('$id', '$password');
      print('$id \n $password \n $result');
      if (result) {
        ScaffoldMessenger.of(context).clearSnackBars();
        Navigator.pushNamed(context, RoutesClass.HomePage);
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar("Incorrect Email/Password", Duration(seconds: 4)));
      }
    }catch(e){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar("${e}", Duration(seconds: 4)));
    }
  }

  static void cancelAction(){

  }
}