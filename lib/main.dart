import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/core/router/router.dart';
import 'package:investify/core/theme/theme.dart';
import 'package:investify/di.dart';
import 'package:investify/presentation/details/bloc/details_bloc.dart';
import 'package:investify/presentation/generated_portfolio/bloc/generated_portfolio_bloc.dart';
import 'package:investify/presentation/signin/bloc/signin_bloc.dart';
import 'package:investify/presentation/signup/bloc/signup_bloc.dart';

void main() async {
  await di();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final AppRouter _approuter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(create: (context) => GetIt.I<SignUpBloc>()),
        BlocProvider<SignInBloc>(create: (context) => GetIt.I<SignInBloc>()),
        BlocProvider<DetailsBloc>(create: (context) => GetIt.I<DetailsBloc>()),
        BlocProvider<GeneratedPortfolioBloc>(
            create: (context) => GetIt.I<GeneratedPortfolioBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        routerConfig: _approuter.config(),
      ),
    );
  }
}
