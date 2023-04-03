// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    DetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<DetailViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailView(
          key: args.key,
          albums: args.albums,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute({List<PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetailView]
class DetailViewRoute extends PageRouteInfo<DetailViewRouteArgs> {
  DetailViewRoute({
    Key? key,
    required Albums albums,
    List<PageRouteInfo>? children,
  }) : super(
          DetailViewRoute.name,
          args: DetailViewRouteArgs(
            key: key,
            albums: albums,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailViewRoute';

  static const PageInfo<DetailViewRouteArgs> page =
      PageInfo<DetailViewRouteArgs>(name);
}

class DetailViewRouteArgs {
  const DetailViewRouteArgs({
    this.key,
    required this.albums,
  });

  final Key? key;

  final Albums albums;

  @override
  String toString() {
    return 'DetailViewRouteArgs{key: $key, albums: $albums}';
  }
}
