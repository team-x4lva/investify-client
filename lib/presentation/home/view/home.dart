import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:investify/core/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      routes: const [SetupRoute(), JournalRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: (index) {
              tabsRouter.setActiveIndex(index);
            },
            height: 60,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: theme.colorScheme.surface,
            indicatorColor: Colors.transparent,
            indicatorShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            destinations: [
              NavigationDestination(
                  icon: Image.asset(
                    'assets/icons/gear.png',
                    width: 25,
                    color: theme.colorScheme.onSurface,
                  ),
                  label: 'Создание'),
              NavigationDestination(
                  icon: Image.asset(
                    'assets/icons/portfolio2.png',
                    width: 25,
                    color: theme.colorScheme.onSurface,
                  ),
                  label: 'Портфель')
            ],
          ),
        );
      },
    );
  }
}
