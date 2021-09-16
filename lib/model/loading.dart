import 'package:flutter/cupertino.dart';

class Loading extends ChangeNotifier{
  bool isAsync=false;
  void RefreshLoading(){
    notifyListeners();
  }
}