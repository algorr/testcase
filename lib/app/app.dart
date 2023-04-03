import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testcase/features/resources/theme_manager.dart';
import 'package:testcase/features/router/app_router.dart';
import 'package:testcase/features/viewmodel/binding/controller_bindings.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBindings(router: _appRouter),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: getAppTheme(),
    );
  }
}
