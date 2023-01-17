import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


customSnackbar(String message,Color colorName){
  return Get.rawSnackbar(
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: colorName,
    snackStyle: SnackStyle.FLOATING,
    messageText: Text(message,style: TextStyle(color: Colors.white,fontFamily: 'Roboto'),),
  );
}