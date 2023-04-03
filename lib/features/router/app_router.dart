import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testcase/features/model/albums.dart';
import 'package:testcase/features/view/detail_view.dart';
import 'package:testcase/features/view/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeViewRoute.page, path: '/'),
    AutoRoute(page: DetailViewRoute.page),
  ];
}
