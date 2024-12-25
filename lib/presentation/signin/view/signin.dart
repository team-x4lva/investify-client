import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/core/router/router.gr.dart';
import 'package:investify/core/widgets/fullscreen_loading.dart';
import 'package:investify/domain/managers/auth_manager/auth_manager.dart';
import 'package:investify/presentation/signin/bloc/signin_bloc.dart';
import 'package:investify/core/widgets/default_auth_view.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final authManager = GetIt.I<AuthManager>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signInBloc = context.read<SignInBloc>();
    final theme = Theme.of(context);
    return BlocListener<SignInBloc, SignInState>(
      bloc: signInBloc,
      listener: (context, state) async {
        if (state is SignInSuccess) {
          if (context.mounted) {
            Navigator.pop(context);
          }
          context.router.replace(const HomeRoute());
        } else if (state is SignInInProgress) {
          showFullscreenLoading(context);
        } else {
          if (context.mounted) {
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Добро пожаловать!',
            style: theme.textTheme.titleLarge,
          ),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SignInWidget(
              signInBloc: signInBloc,
              emailController: emailController,
              passwordController: passwordController,
              theme: theme),
        ),
      ),
    );
  }
}

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    super.key,
    required this.signInBloc,
    required this.emailController,
    required this.passwordController,
    required this.theme,
  });

  final SignInBloc signInBloc;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return DefaultAuthView(
        emailController: emailController,
        passwordController: passwordController,
        buttonText: 'Войти',
        onTextTap: () {
          context.router.replace(const SignUpRoute());
        },
        onButtonTap: () {
          signInBloc.add(SignInWithEmailPassword(
              email: emailController.text, password: passwordController.text));
        },
        smallInfoText: 'Нету аккаунта? Зарегистрироваться',
        theme: theme);
  }
}
