import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../atoms/new_party_fab.dart';

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
            icon: Icon(Icons.wine_bar),
            label: 'Parties',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box_rounded),
            label: 'Profile',
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
        const ProfileScreen(
          providerConfigs: [
            EmailProviderConfiguration(),
          ],
          avatarSize: 96.0,
        )
      ][_currentIndex],
      floatingActionButton: _currentIndex == 0 ? const NewPartyFAB() : null,
    );
  }
}
