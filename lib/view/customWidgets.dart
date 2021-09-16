import 'package:asset_movement_app/controller/style.dart';
import 'package:flutter/material.dart';

Widget CustomButtom(String text,final void Function() action){
  return ElevatedButton(
      onPressed:(){
        action();
      },
      child: new Text(
        "$text",
        style: buttonTextStyle(),
      ),
    style: ElevatedButton.styleFrom(
      primary: Color(buttonbgColor),
      minimumSize:Size(MediaSize.size!.width*0.3,MediaSize.size!.height*0.07,),
    ),
  );
}



Widget CustomRowButtonAndTextField(
    String label, String hint, bool show, TextEditingController controller,Color text_color) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: <Widget>[
        new Text(
          "$label",
          style: simpleTextStyle(),
        ),
        new SizedBox(
          width: 20,
        ),
        Expanded(
          child: new TextField(
            controller: controller,

            decoration: InputDecoration(
              hintText: "$hint",
            ),
            style: TextStyle(color:text_color),
            obscureText: show,
          ),
        )
      ],
    ),
  );
}








Widget CustomButtonRow(String btn1, String btn2,final void Function() onPressed1,final void Function() onPressed2) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CustomButtom(btn1,onPressed1),
        new SizedBox(
          width: 20,
        ),
        CustomButtom(btn2,onPressed2),
      ],
    ),
  );
}


SnackBar customSnackBar(String msg,Duration time){
  return  SnackBar(
      content: new Text("$msg",style: simpleTextStyle(),),
    backgroundColor: Colors.orangeAccent,
    elevation: 20,
    duration: time,
  );
}
