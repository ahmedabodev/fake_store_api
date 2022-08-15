import 'package:fake_api/Home/view/homescreen.dart';
import 'package:fake_api/category/view/categoryscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Main_Controller extends GetxController{

  int index=0;
  List<Widget>Screens=[
    HomeScreen(),
    CategoryScreen(),
  ];
  changebottom(value){
    index=value;
    Screens[index];
    update();
  }
}