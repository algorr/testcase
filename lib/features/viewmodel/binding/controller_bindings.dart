// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import 'package:testcase/data/network/app_api.dart';
import 'package:testcase/features/repository/repository.dart';
import 'package:testcase/features/router/app_router.dart';
import 'package:testcase/features/viewmodel/controller/controller.dart';

class ControllerBindings extends Bindings {
  AppRouter router;
  ControllerBindings({
    required this.router,
  });
  @override
  void dependencies() {
    Get.lazyPut<Controller>(
        () => (Controller(Repository(AppServiceClient(Dio())))));
  }
}
