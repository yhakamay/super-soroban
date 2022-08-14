import 'package:flutter/material.dart';

import '../pages/create_party_page.dart';

class OpenNewPartyFAB extends StatelessWidget {
  const OpenNewPartyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _createParty(context),
      tooltip: 'Increment',
      label: const Text('Create Party'),
      icon: const Icon(Icons.add),
    );
  }

  void _createParty(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const CreatePartyPage(),
      ),
    );
  }
}
