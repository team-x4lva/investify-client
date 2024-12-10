// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:investify/presentation/home/view/home.dart' as _i1;
import 'package:investify/presentation/journal/view/journal.dart' as _i2;
import 'package:investify/presentation/setup/view/setup.dart' as _i3;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.JournalPage]
class JournalRoute extends _i4.PageRouteInfo<void> {
  const JournalRoute({List<_i4.PageRouteInfo>? children})
      : super(
          JournalRoute.name,
          initialChildren: children,
        );

  static const String name = 'JournalRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.JournalPage();
    },
  );
}

/// generated route for
/// [_i3.SetupPage]
class SetupRoute extends _i4.PageRouteInfo<void> {
  const SetupRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SetupPage();
    },
  );
}
