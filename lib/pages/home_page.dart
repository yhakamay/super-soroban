import 'package:flutter/material.dart';

import '../atoms/new_party_fab.dart';
import '../atoms/profile_button.dart';
import '../molecules/home_page_navigation_bar.dart';
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
      bottomNavigationBar: HomePageNavigationBar(
        currentIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
