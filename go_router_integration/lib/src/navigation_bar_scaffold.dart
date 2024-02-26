import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBarScaffold extends StatelessWidget {
  const NavigationBarScaffold({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _goBranch,
        selectedIndex: navigationShell.currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.pages),
            label: 'Banner',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.card_membership),
            icon: Icon(Icons.card_membership_outlined),
            label: 'Promobox',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.web_outlined),
            icon: Icon(Icons.web),
            label: 'HTML',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.thumb_up),
            icon: Icon(Icons.thumb_up_outlined),
            label: 'JSON',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.upcoming),
            icon: Icon(Icons.upcoming_outlined),
            label: 'Popup',
          ),
        ]),
      body: navigationShell,
    );
  }

}