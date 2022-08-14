import 'package:flutter/material.dart';

import '../pages/add_payment_method_page.dart';

class OpenAddPaymentMethodFAB extends StatelessWidget {
  const OpenAddPaymentMethodFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _openAddPaymentMethodPage(context),
      label: const Text('Add Method'),
      icon: const Icon(Icons.add),
    );
  }

  void _openAddPaymentMethodPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const AddPaymentMethodPage(),
      ),
    );
  }
}
