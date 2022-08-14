import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

import 'party_card.dart';

class PartiesScreen extends StatefulWidget {
  const PartiesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PartiesScreen> createState() => _PartiesScreenState();
}

class _PartiesScreenState extends State<PartiesScreen> {
  final myPartiesQuery = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('parties');

  @override
  Widget build(BuildContext context) {
    return FirestoreListView(
      query: myPartiesQuery,
      itemBuilder: (context, snapshot) {
        final partyId = snapshot.id;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: PartyCard(partyId),
        );
      },
    );
  }
}
