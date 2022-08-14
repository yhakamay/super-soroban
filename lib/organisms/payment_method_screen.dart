import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Payment'),
        ],
      ),
    );
  }
}
