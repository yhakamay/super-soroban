import 'package:flutter/material.dart';

import '../organisms/create_party_screen.dart';

class CreatePartyPage extends StatelessWidget {
  const CreatePartyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Party'),
      ),
      body: const CreatePartyScreen(),
    );
  }
}
