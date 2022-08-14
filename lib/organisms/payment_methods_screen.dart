import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../models/payment_method.dart';
import 'payment_method_card.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  final myPaymentMethodsQuery = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('payment_methods')
      .orderBy('name');

  @override
  Widget build(BuildContext context) {
    return FirestoreListView(
      query: myPaymentMethodsQuery,
      itemBuilder: (context, snapshot) {
        final paymentMethod =
            PaymentMethod.fromJson(snapshot.data() as Map<String, dynamic>);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: PaymentMethodCard(
            id: snapshot.id,
            name: paymentMethod.name,
            url: paymentMethod.url,
            description: paymentMethod.description,
          ),
        );
      },
    );
  }
}
