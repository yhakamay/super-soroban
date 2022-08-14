import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motchi/pages/payment_method_details.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    Key? key,
    required this.id,
    required this.name,
    this.url,
    this.description,
    this.readOnly = false,
  }) : super(key: key);

  // PaymentMethodCard.readOnly
  const PaymentMethodCard.readOnly({
    super.key,
    required this.id,
    required this.name,
    this.url,
    this.description,
    this.readOnly = true,
  });

  final String id;
  final String name;
  final String? url;
  final String? description;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: Center(
          child: ListTile(
            title: Text(
              name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              url ?? '',
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => PaymentMethodDetails(id),
              ),
            ),
            trailing: readOnly
                ? null
                : IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deletePaymentMethod(id),
                  ),
          ),
        ),
      ),
    );
  }

  _deletePaymentMethod(String id) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('payment_methods')
        .doc(id)
        .delete();
  }
}
