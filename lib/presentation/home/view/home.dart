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
      routes: const [
        SetupRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: (index) {
              tabsRouter.setActiveIndex(index);
            },
            height: 50,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: theme.colorScheme.surface,
            indicatorColor: theme.colorScheme.secondaryContainer,
            indicatorShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            destinations: [
              NavigationDestination(
                  icon: Icon(
                    Icons.inventory_sharp,
                    color: theme.colorScheme.onSurface,
                  ),
                  label: ''),
              const NavigationDestination(icon: Icon(Icons.backpack), label: '')
            ],
          ),
        );
      },
    );
  }
}
