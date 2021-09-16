import 'dart:async';
import 'dart:io';

import 'package:mysql1/mysql1.dart';
class DbConnection{
  static var conn;
  static Future<MySqlConnection> connectDb()  async {
    var settings = new ConnectionSettings(
        host: 'sql456.main-hosting.eu',
        port: 3306,
        user: 'u428164805_eng_stor',
        password: '#EYORgmNydq7',
        db: 'u428164805_vbl_asset_move'
    );
    conn = await MySqlConnection.connect(settings);
    return conn;
  }


  static Future<bool> IsUserExist(String username,String password) async {
    var results = await conn.query("select * from users where Email='${username}' and Password='${password}'");
    if(results.isNotEmpty){
      return true;
    }else{
      return false;
    }


  }


  static Future<bool> InsertIntoDatabase(String? img,String barcode,String remark) async {
    try {
      await DbConnection.connectDb();
      print("Inserting....");
      await conn.query("INSERT INTO asset(IMAGE,BARCODE,QUANTITY) VALUES('${img}','${barcode}','${remark}')");
      print("Added");
      return true;
    } catch(e){
      if(e.toString().contains("Future not completed")){
        print("after time out");
        return true;
      }else {
        print("Insert QUery Error : \n ${e}");
        return false;
      }
    }

  }
}
