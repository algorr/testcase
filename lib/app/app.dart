import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testcase/features/resources/theme_manager.dart';
import 'package:testcase/features/view/home_view.dart';
import 'package:testcase/features/viewmodel/binding/controller_bindings.dart';

class MyApp extends StatefulWidget {
  //const MyApp({super.key}); // default constructor

  const MyApp._internal(); // private named constructor

  static const MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBindings(),
      home: const HomeView(),
      theme: getAppTheme(),
    );
  }
}
