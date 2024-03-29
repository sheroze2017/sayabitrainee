import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayabidev_group_assign_1/Api/weatherApi.dart';
import 'package:sayabidev_group_assign_1/view/home_screen.dart';
import 'package:sayabidev_group_assign_1/view/login_screen.dart';
import 'package:sayabidev_group_assign_1/view/register_screen.dart';
import 'package:sayabidev_group_assign_1/view/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
  // fetchAlbum('Karachi');
  // //fetchAlbum();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: loginScreen());
  }
}
