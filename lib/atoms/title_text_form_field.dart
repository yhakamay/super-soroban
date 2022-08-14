import 'package:flutter/material.dart';

class TitleTextFormField extends StatelessWidget {
  const TitleTextFormField({
    Key? key,
    required this.controller,
    required this.onSaved,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function() onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 24,
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Title',
        icon: Icon(Icons.wine_bar),
      ),
      validator: validator,
      onSaved: (_) => onSaved(),
      onChanged: (_) => onSaved(),
    );
  }
}
