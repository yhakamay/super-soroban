import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motchi/models/party.dart';

import '../utils.dart';

class CreatePartyFAB extends StatefulWidget {
  const CreatePartyFAB({
    Key? key,
    required this.formKey,
    required this.party,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final Party party;

  @override
  State<CreatePartyFAB> createState() => _CreatePartyFABState();
}

class _CreatePartyFABState extends State<CreatePartyFAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        if (widget.formKey.currentState!.validate()) {
          Utils.showSnackBar(context, 'Creating party...');

          await _createPartyOnFirestore();
          await Future.delayed(const Duration(milliseconds: 500));

          if (!mounted) return;
          Navigator.of(context).pop();
          Utils.showSnackBar(context, 'Party created!');
        } else {
          // Do nothing
        }
      },
      label: const Text('Create Party'),
    );
  }

  Future<void> _createPartyOnFirestore() async {
    final parties = FirebaseFirestore.instance.collection('parties');
    await parties.add(widget.party.toJson()).then((DocumentReference doc) {
      parties.doc(doc.id).update({'id': doc.id});
      _addPartyToUser(doc.id);
    });
  }

  Future<void> _addPartyToUser(String id) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final myDoc = FirebaseFirestore.instance.collection('users').doc(uid);
    final myParties = myDoc.collection('parties');

    await myParties.doc(id).set({
      // Only add id; Other data will be read from 'parties' collection.
      // Actually this is not necessary, but document cannot be blank.
      'id': id,
    });
  }
}
