// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:investify/presentation/details/view/details.dart' as _i1;
import 'package:investify/presentation/home/view/home.dart' as _i2;
import 'package:investify/presentation/journal/view/journal.dart' as _i3;
import 'package:investify/presentation/setup/view/setup.dart' as _i4;

/// generated route for
/// [_i1.DetailsPage]
class DetailsRoute extends _i5.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i6.Key? key,
    required int days,
    required double amount,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            days: days,
            amount: amount,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i1.DetailsPage(
        key: args.key,
        days: args.days,
        amount: args.amount,
      );
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.days,
    required this.amount,
  });

  final _i6.Key? key;

  final int days;

  final double amount;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, days: $days, amount: $amount}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.JournalPage]
class JournalRoute extends _i5.PageRouteInfo<void> {
  const JournalRoute({List<_i5.PageRouteInfo>? children})
      : super(
          JournalRoute.name,
          initialChildren: children,
        );

  static const String name = 'JournalRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.JournalPage();
    },
  );
}

/// generated route for
/// [_i4.SetupPage]
class SetupRoute extends _i5.PageRouteInfo<void> {
  const SetupRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SetupPage();
    },
  );
}
