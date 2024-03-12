import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier{

  int initialePage = 0;
  static PageController pageController = PageController(initialPage: 0);

  changePageScroll(int valeur){
    initialePage = valeur;
    notifyListeners();
  }
  changePageBoutton(int valeur){
    initialePage=valeur;
    notifyListeners();
    pageController.animateToPage(valeur, duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }
}