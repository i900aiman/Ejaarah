import 'package:ejaarah_app/View/Tab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
   runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // translations: LocalString(),
    // locale: locale,
    home: UserTab(),
    routes: {
      '/home': (context) => UserTab(),
    },
  ));
}

