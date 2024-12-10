import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investify/core/router/router.gr.dart';
import 'package:investify/core/widgets/fullscreen_loading.dart';
import 'package:investify/presentation/signup/bloc/signup_bloc.dart';
import 'package:investify/presentation/signup/widgets/widgets.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signUpBloc = context.read<SignUpBloc>();

    final theme = Theme.of(context);
    return BlocListener<SignUpBloc, SignUpState>(
      bloc: signUpBloc,
      listener: (context, state) {
        if (state is SignUpSuccess) {
          if (context.mounted) {
            Navigator.pop(context);
          }
          context.router.replace(const HomeRoute());
        } else if (state is SignUpInProgress) {
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
              'Добро пожаловать',
              style: theme.textTheme.titleLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DefaultAuthView(
                emailController: emailController,
                passwordController: passwordController,
                secondPasswordController: passwordController2,
                theme: theme,
                buttonText: 'Зарегистрироваться',
                smallInfoText: 'Уже есть аккаунт? Войти',
                onTextTap: () {
                  context.router.replace(const SignInRoute());
                },
                onButtonTap: () {
                  if (passwordController.text == passwordController2.text) {
                    signUpBloc.add(SignUpWithEmailPassword(
                        email: emailController.text,
                        password: passwordController.text));
                  }
                }),
          )),
    );
  }
}
