import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const bodybgColor=0xffffffff;
const buttonbgColor=0xff3a6cc6;
const headingTextColor=0xff4472c4;
const buttonTextColor=0xffffffff;
const textColor=0xff000000;

class MediaSize{
  static Size? size;
}

TextStyle headingStyle(){
  return TextStyle(
    color: Color(headingTextColor),
    fontSize: 28,
    fontWeight: FontWeight.bold
  );
}

TextStyle simpleTextStyle(){
  return TextStyle(
      color: Color(textColor),
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
}



TextStyle buttonTextStyle(){
  return TextStyle(
      color: Color(buttonTextColor),
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
}


BoxDecoration applyBackgroundImage(String path){
  return BoxDecoration(
    color: Colors.orangeAccent,
    image: DecorationImage(
      image: AssetImage(path),
      fit: BoxFit.cover,
      colorFilter: new ColorFilter.mode(Colors.white.withOpacity(1.0), BlendMode.softLight),
    ),

  );
}