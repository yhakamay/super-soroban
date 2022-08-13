import 'package:flutter/material.dart';

class CreatePartyFAB extends StatelessWidget {
  const CreatePartyFAB({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Processing Data'),
            ),
          );

          // TODO: Send data to Firestore
        }
      },
      label: const Text('Create Party'),
    );
  }
}
