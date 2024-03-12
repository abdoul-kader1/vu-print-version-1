import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VuPrintFonction{
  VuPrintFonction._();
  static bool isModeSombre(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  static Future chancePage(BuildContext context,Widget Function(BuildContext)param){
   return  Navigator.push(context,MaterialPageRoute(builder: param));
  }
  static String formateurDate(DateTime date){
   return DateFormat("dd-MM-yyyy").format(date);
  }
  static String coupeDate(String date){
    return date.substring(0,10);
  }
  static String changeTexteStatusJournalActiviter(String status){
    if(status == "UNSOLVED"){
      return "nom-resolu";
    }else if(status == "SUPPORTED"){
      return "pris en chage";
    }else if(status =="SOLVED"){
      return "resolu";
    }else{
      return "";
    }
  }
  static Color changeCouleurStatusJournalActiviter(String status){
    if(status == "UNSOLVED"){
      return Colors.orange;
    }else if(status == "SUPPORTED"){
      return Colors.greenAccent;
    }else if(status =="SOLVED"){
      return Colors.amber;
    }else{
      return Colors.white;
    }
  }
  static String convertirUtf8(String elements){
    List<int>bytes = latin1.encode(elements);
    return utf8.decode(bytes);
  }
}