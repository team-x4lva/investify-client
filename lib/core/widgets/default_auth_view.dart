import 'package:flutter/material.dart';
import 'package:investify/core/widgets/investify_button.dart';
import 'package:investify/core/widgets/investify_text_input.dart';
import 'package:lottie/lottie.dart';

// Отдельный виджет для экрана регистрации и входа
class DefaultAuthView extends StatefulWidget {
  const DefaultAuthView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.theme,
    this.secondPasswordController,
    required this.buttonText,
    required this.onButtonTap,
    required this.onTextTap,
    required this.smallInfoText,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? secondPasswordController;
  final String buttonText;
  final void Function() onButtonTap;
  final ThemeData theme;
  final VoidCallback onTextTap;
  final String smallInfoText;

  @override
  State<DefaultAuthView> createState() => _DefaultAuthViewState();
}

class _DefaultAuthViewState extends State<DefaultAuthView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Lottie.asset('assets/animations/login.json', height: 250),
              InvestifyTextInput(
                hintText: 'Почта',
                controller: widget.emailController,
                validator: EmailValidator.validate,
              ),
              const SizedBox(
                height: 20,
              ),
              InvestifyTextInput(
                hintText: 'Пароль',
                obscureText: true,
                controller: widget.passwordController,
                validator: PasswordValidator.validate,
              ),
              if (widget.secondPasswordController != null)
                const SizedBox(
                  height: 20,
                ),
              if (widget.secondPasswordController != null)
                InvestifyTextInput(
                  hintText: 'Повторите пароль',
                  obscureText: true,
                  controller: widget.secondPasswordController!,
                  validator: (value) =>
                      PasswordValidator.validateConfirmPassword(
                    value,
                    widget.passwordController.text,
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: widget.onTextTap,
                child: Text(
                  widget.smallInfoText,
                  style: widget.theme.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InvestifyButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, proceed with onButtonTap
                    widget.onButtonTap();
                  }
                },
                child: Text(
                  widget.buttonText,
                  style: widget.theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmailValidator {
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Почта обязательна';
    }
    if (!_emailRegex.hasMatch(value)) {
      return 'Введите правильную почту';
    }
    return null;
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пароль обязателен';
    }
    if (value.length < 6) {
      return 'Пароль должен состоять минимально из 6-ти символов';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста подтвердите пароль';
    }
    if (value != password) {
      return 'Пароли не совпадают';
    }
    return null;
  }
}
