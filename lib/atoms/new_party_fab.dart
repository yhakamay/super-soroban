import 'package:flutter/material.dart';

import '../pages/create_party_page.dart';

class NewPartyFAB extends StatelessWidget {
  const NewPartyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _createParty(context),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
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
