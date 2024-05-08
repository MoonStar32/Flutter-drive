// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LossRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LossPage(),
      );
    },
    VictoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VictoryPage(),
      );
    },
  };
}

/// generated route for
/// [LossPage]
class LossRoute extends PageRouteInfo<void> {
  const LossRoute({List<PageRouteInfo>? children})
      : super(
          LossRoute.name,
          initialChildren: children,
        );

  static const String name = 'LossRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VictoryPage]
class VictoryRoute extends PageRouteInfo<void> {
  const VictoryRoute({List<PageRouteInfo>? children})
      : super(
          VictoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'VictoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
