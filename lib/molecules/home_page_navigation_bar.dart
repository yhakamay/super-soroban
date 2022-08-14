import 'package:flutter/material.dart';

class HomePageNavigationBar extends StatelessWidget {
  const HomePageNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int) onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      selectedIndex: currentIndex,
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(Icons.wine_bar),
          icon: Icon(Icons.wine_bar_outlined),
          label: 'Parties',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.wallet),
          icon: Icon(Icons.wallet_outlined),
          label: 'Payment',
        ),
      ],
    );
  }
}
