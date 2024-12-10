import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

@RoutePage()
class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Начините инвестировать прямо сейчас',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => SizedBox(
                        height: 300,
                        child: CupertinoPicker(
                            itemExtent: 50.0,
                            onSelectedItemChanged: (_) {},
                            useMagnifier: true,
                            children: const [
                              Center(
                                child: CupertinoText(
                                    'Короткосрочный (неделя - месяц)'),
                              ),
                              Center(
                                  child: CupertinoText(
                                      'Среднесрочный (месяц - год)')),
                              Center(
                                  child: CupertinoText(
                                      'Долгосрочный (несколько лет)'))
                            ]),
                      ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                'Выбрать срок инвестиций',
                style: theme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InvestifyTextInput(hintText: ' Введите сумму инвестиций'),
          ),
          InvestifyButton(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Продолжить',
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: theme.colorScheme.onSurface,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class CupertinoText extends StatelessWidget {
  const CupertinoText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: '.SF Pro Display',
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SfDateRangePicker(
        enablePastDates: false,
        showNavigationArrow: true,
        selectionColor: theme.primaryColor,
        todayHighlightColor: theme.primaryColor,
        backgroundColor: theme.colorScheme.surface,
        headerStyle: DateRangePickerHeaderStyle(
          backgroundColor: theme.colorScheme.surface,
          textStyle: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}

class InvestifyButton extends StatelessWidget {
  const InvestifyButton({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.showShadow = true,
    this.width,
  });

  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final EdgeInsets? margin;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [theme.primaryColor, theme.colorScheme.secondary]),
              boxShadow: showShadow
                  ? [
                      BoxShadow(
                          offset: const Offset(5, 3),
                          blurRadius: 20,
                          color: theme.colorScheme.secondary),
                    ]
                  : null,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          margin: margin,
          child: child),
    );
  }
}

class InvestifyTextInput extends StatelessWidget {
  const InvestifyTextInput({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        hintStyle: TextStyle(
            color: theme.hintColor.withOpacity(0.3),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: theme.colorScheme.secondary, width: 2.5),
            borderRadius: BorderRadius.circular(20)),
        hintText: hintText,
      ),
    );
  }
}
