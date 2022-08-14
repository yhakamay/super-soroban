import 'package:flutter/material.dart';

import '../atoms/new_party_fab.dart';
import '../atoms/profile_button.dart';
import '../organisms/payment_method_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motchi'),
        actions: const [
          ProfileButton(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIndex: _currentIndex,
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
      ),
      body: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Motchi'),
            ],
          ),
        ),
        const PaymentMethodScreen(),
      ][_currentIndex],
      floatingActionButton: _currentIndex == 0 ? const NewPartyFAB() : null,
    );
  }
}
