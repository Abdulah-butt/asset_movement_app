import 'package:asset_movement_app/model/routes.dart';
import 'package:asset_movement_app/view/homeScreen.dart';
import 'package:asset_movement_app/view/loginScreen.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      initialRoute: RoutesClass.loginPage,
      routes: {
        RoutesClass.loginPage:(context)=>LoginScreen(),
        RoutesClass.HomePage:(context)=>HomeScreen()
      },
    )
  );
}