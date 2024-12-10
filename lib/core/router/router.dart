import 'package:auto_route/auto_route.dart';
import 'package:investify/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, children: [
          AutoRoute(page: SetupRoute.page, path: 'setup'),
          AutoRoute(page: JournalRoute.page, path: 'journal')
        ])
      ];
}
