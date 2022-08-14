import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motchi/models/payment_method.dart';
import 'package:motchi/utils.dart';

class AddPaymentMethodPage extends StatefulWidget {
  const AddPaymentMethodPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPaymentMethodPage> createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _urlController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Payment Method'),
      ),
      body: Padding(
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
                decoration: const InputDecoration(
                  labelText: 'Description (optional)',
                  icon: Icon(Icons.description),
                ),
                maxLines: 6,
                maxLength: 200,
              ),
              FloatingActionButton.extended(
                onPressed: _addPaymentMethod,
                label: const Text('Add Payment Method'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addPaymentMethod() async {
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

      await myPaymentMethods.add(paymentMethod.toJson());

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
