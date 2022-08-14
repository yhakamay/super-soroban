import 'package:flutter/material.dart';

import '../atoms/open_add_payment_method_fab.dart';
import '../atoms/open_new_party_fab.dart';
import '../atoms/profile_button.dart';
import '../molecules/home_page_navigation_bar.dart';
import '../organisms/parties_screen.dart';
import '../organisms/payment_methods_screen.dart';

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
        onDestinationSelected: _onDestinationSelected,
      ),
      body: [
        const PartiesScreen(),
        const PaymentMethodsScreen(),
      ][_currentIndex],
      floatingActionButton: _currentIndex == 0
          ? const OpenNewPartyFAB()
          : const OpenAddPaymentMethodFAB(),
    );
  }

  void _onDestinationSelected(index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
