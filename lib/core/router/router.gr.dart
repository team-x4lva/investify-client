// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i11;
import 'package:flutter/material.dart' as _i10;
import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart'
    as _i12;
import 'package:investify/presentation/details/view/details.dart' as _i1;
import 'package:investify/presentation/generated_portfolio/view/generated_portfolio.dart'
    as _i2;
import 'package:investify/presentation/home/view/home.dart' as _i3;
import 'package:investify/presentation/portfolios/view/portfolios.dart' as _i4;
import 'package:investify/presentation/setup/view/setup.dart' as _i5;
import 'package:investify/presentation/signin/view/signin.dart' as _i6;
import 'package:investify/presentation/signup/view/signup.dart' as _i7;
import 'package:investify/presentation/simulation/view/simulation.dart' as _i8;

/// generated route for
/// [_i1.DetailsPage]
class DetailsRoute extends _i9.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i10.Key? key,
    required int days,
    required double amount,
    List<_i9.PageRouteInfo>? children,
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

  static _i9.PageInfo page = _i9.PageInfo(
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

  final _i10.Key? key;

  final int days;

  final double amount;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, days: $days, amount: $amount}';
  }
}

/// generated route for
/// [_i2.GeneratedPortfolio]
class GeneratedPortfolio extends _i9.PageRouteInfo<GeneratedPortfolioArgs> {
  GeneratedPortfolio({
    _i11.Key? key,
    required _i12.FinalGeneratedPortfolio portfolio,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          GeneratedPortfolio.name,
          args: GeneratedPortfolioArgs(
            key: key,
            portfolio: portfolio,
          ),
          initialChildren: children,
        );

  static const String name = 'GeneratedPortfolio';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GeneratedPortfolioArgs>();
      return _i2.GeneratedPortfolio(
        key: args.key,
        portfolio: args.portfolio,
      );
    },
  );
}

class GeneratedPortfolioArgs {
  const GeneratedPortfolioArgs({
    this.key,
    required this.portfolio,
  });

  final _i11.Key? key;

  final _i12.FinalGeneratedPortfolio portfolio;

  @override
  String toString() {
    return 'GeneratedPortfolioArgs{key: $key, portfolio: $portfolio}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.PortfoliosPage]
class PortfoliosRoute extends _i9.PageRouteInfo<void> {
  const PortfoliosRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PortfoliosRoute.name,
          initialChildren: children,
        );

  static const String name = 'PortfoliosRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.PortfoliosPage();
    },
  );
}

/// generated route for
/// [_i5.SetupPage]
class SetupRoute extends _i9.PageRouteInfo<void> {
  const SetupRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.SetupPage();
    },
  );
}

/// generated route for
/// [_i6.SignInPage]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.SignInPage();
    },
  );
}

/// generated route for
/// [_i7.SignUpPage]
class SignUpRoute extends _i9.PageRouteInfo<void> {
  const SignUpRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SignUpPage();
    },
  );
}

/// generated route for
/// [_i8.SimulationPage]
class SimulationRoute extends _i9.PageRouteInfo<void> {
  const SimulationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SimulationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SimulationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SimulationPage();
    },
  );
}
