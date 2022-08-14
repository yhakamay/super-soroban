import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/payment_method.dart';
import '../utils.dart';

class PaymentMethodDetails extends StatefulWidget {
  const PaymentMethodDetails(
    this.id, {
    Key? key,
    this.readOnly = false,
  }) : super(key: key);

  const PaymentMethodDetails.readOnly(
    this.id, {
    Key? key,
    this.readOnly = true,
  }) : super(key: key);

  final String id;
  final bool readOnly;

  @override
  State<PaymentMethodDetails> createState() => _PaymentMethodDetailsState();
}

class _PaymentMethodDetailsState extends State<PaymentMethodDetails> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _urlController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.readOnly ? 'Payment Method' : 'Edit Payment Method'),
      ),
      body: FutureBuilder(
        future: _fetchPaymentMethod(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final paymentMethod = PaymentMethod.fromJson(
              snapshot.data!.data() as Map<String, dynamic>);

          // Set the initial values
          _nameController.text = paymentMethod.name;
          _urlController.text = paymentMethod.url ?? '';
          _descriptionController.text = paymentMethod.description ?? '';

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Name
                  TextFormField(
                    controller: _nameController,
                    readOnly: widget.readOnly,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      icon: Icon(Icons.wallet),
                    ),
                    maxLength: 24,
                    validator: (value) => _emptyValidator(value),
                  ),
                  // URL
                  TextFormField(
                    controller: _urlController,
                    readOnly: widget.readOnly,
                    decoration: const InputDecoration(
                      labelText: 'URL (optional)',
                      icon: Icon(Icons.link),
                    ),
                    validator: (value) => _urlValidator(value),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Description
                  TextFormField(
                    controller: _descriptionController,
                    readOnly: widget.readOnly,
                    decoration: const InputDecoration(
                      labelText: 'Description (optional)',
                      icon: Icon(Icons.description),
                    ),
                    maxLines: 6,
                    maxLength: 200,
                  ),
                  FloatingActionButton.extended(
                    onPressed: widget.readOnly
                        ? () => Navigator.pop(context)
                        : _updatePaymentMethod,
                    label: Text(
                        widget.readOnly ? 'Close' : 'Update Payment Method'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<Object?>? _fetchPaymentMethod() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final myDoc = FirebaseFirestore.instance.collection('users').doc(uid);
    final paymentMethod =
        await myDoc.collection('payment_methods').doc(widget.id).get();

    return paymentMethod;
  }

  _updatePaymentMethod() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final url = _urlController.text;
      final description = _descriptionController.text;
      final paymentMethod = PaymentMethod(
        name: name,
        url: url,
        description: description,
      );

      final uid = FirebaseAuth.instance.currentUser!.uid;
      final myDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      final myPaymentMethods = myDoc.collection('payment_methods');
      final currentPaymentMethod = myPaymentMethods.doc(widget.id);

      await currentPaymentMethod.update(
        paymentMethod.toJson(),
      );

      _nameController.clear();
      _urlController.clear();
      _descriptionController.clear();

      if (!mounted) return;
      Navigator.pop(context);
    } else {
      Utils.showSnackBar(context, 'Name field cannot be blank.');
    }
  }

  _emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name field cannot be blank.';
    }
    return null;
  }

  _urlValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      final result = Uri.tryParse(value)?.hasAbsolutePath ?? false;
      return result ? null : 'Invalid URL.';
    }
    return null;
  }
}
