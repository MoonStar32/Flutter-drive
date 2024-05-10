import 'package:auto_route/auto_route.dart';
import 'package:flutter_drive/src/features/auth/auth_main_page.dart';
import 'package:flutter_drive/src/features/auth/log_in_page.dart';
import 'package:flutter_drive/src/features/auth/sign_up_page.dart';
import 'package:flutter_drive/src/features/game%20over/victory_page.dart';
import 'package:flutter_drive/src/features/game%20over/loss.dart';
import 'package:flutter_drive/src/features/main%20page/main_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AouthMainRoute.page, path: '/'),
        AutoRoute(page: LogInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: LossRoute.page),
        AutoRoute(page: VictoryRoute.page),
      ];
}
