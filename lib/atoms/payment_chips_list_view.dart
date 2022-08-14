import 'package:flutter/material.dart';
import 'package:motchi/models/payment_method.dart';

class PaymentChipsListView extends StatelessWidget {
  const PaymentChipsListView({
    Key? key,
    required this.paymentMethods,
    required this.onDeleted,
  }) : super(key: key);

  final List<PaymentMethod> paymentMethods;
  final void Function(PaymentMethod) onDeleted;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(width: 40.0),
        for (final paymentMethod in paymentMethods)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text(paymentMethod.name),
              deleteIcon: const Icon(
                Icons.cancel,
                size: 18.0,
              ),
              onDeleted: () => onDeleted(paymentMethod),
            ),
          ),
      ],
    );
  }
}
