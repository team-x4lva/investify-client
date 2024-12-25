import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/core/router/router.gr.dart';
import 'package:investify/domain/managers/auth_manager/auth_manager.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authManager = GetIt.I<AuthManager>();
    if (authManager.getStatus() == AuthStatus.loggedIn) {
      resolver.next(true);
    } else {
      resolver.redirect(const SignUpRoute());
    }
  }
}
