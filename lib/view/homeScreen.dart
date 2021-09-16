
import 'dart:convert';
import 'dart:io';

import 'package:asset_movement_app/controller/style.dart';
import 'package:asset_movement_app/model/dbConnection.dart';
import 'package:asset_movement_app/view/customWidgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:asset_movement_app/controller/loginController.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

var _serialNo_txt = new TextEditingController();
var _remark_txt = new TextEditingController();

File? img_file;
String? image_data;

String imageName='----No Image Selected-----';
class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: 200,
        width: 200,
        decoration: applyBackgroundImage("assets/finalHome.jpg"),
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
                      SizedBox(height: size.height * 0.05,),
                      CustomButtom("Take a Photo",(){
                        selectFile(context);
                      }),
                      new Text("$imageName",style: simpleTextStyle(),),
                      SizedBox(height: size.height * 0.01,),
                      CustomButtom("Scan a Bar Code",() async {
                        _serialNo_txt.text= await getBarcode();
                      }),
                      CustomRowButtonAndTextField("Serial No", "", false, _serialNo_txt,Colors.white),
                      CustomRowButtonAndTextField("Quantity", "", false, _remark_txt,Colors.white),
                      CustomButtonRow('Submit', 'Clear',(){
                        uploadData(image_data,_serialNo_txt.text,_remark_txt.text,context);
                      },
                            // clear button action
                              (){
                        clearData();
                              }),

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





  Future selectFile(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null){
        print("Null");
      }else{
        print("${image.path}");
      }

       setState(() {
         img_file = File(image!.path);
         imageName = basename(img_file!.path);
         image_data=base64Encode(img_file!.readAsBytesSync());

       });
    }catch(e){
      print("Failed to pick Image $e");
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar("$e",Duration(seconds: 3)));
    }
  }


  Future<String> getBarcode() async{
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.BARCODE);
    return barcodeScanRes;
  }

  void uploadData(String? image_data, String barcode, String remark,BuildContext context) async{
    try{
      if(image_data==null||barcode==''){
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
            "Please upload both Image and Barcode ", Duration(seconds: 3)));
      }else {
        print("imae data : ${image_data}");
        print("barcode : ${barcode}\nreview : ${remark}");
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
            "Uploading........please wait", Duration(minutes: 1)));

        bool output = await DbConnection.InsertIntoDatabase(
            image_data, barcode, remark);
        if (output) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar("UPLOADED SUCCESSFULLY", Duration(seconds: 3)));
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar("Error Occured ", Duration(seconds: 3)));
        }
      }
    }catch(e){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar("$e",Duration(seconds: 3)));
    }

  }




  void clearData(){
    setState(() {
       img_file=null;
      image_data='';
      imageName='----No Image Selected-----';
      _remark_txt.text='';
      _serialNo_txt.text='';
    });
  }

}





