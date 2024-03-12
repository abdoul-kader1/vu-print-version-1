import 'package:flutter/material.dart';
import 'package:vu_print/Data/Repository/log_r.dart';
import '../../Modeles/logs.dart';

class LogController extends ChangeNotifier{

  LogController(){
    getListLog();
  }

  List<Log>listesLog = [];

  Future<void>getListLog()async{
    final donnee = await LogRepository().getListLog();
    listesLog = donnee;
    notifyListeners();
  }
}