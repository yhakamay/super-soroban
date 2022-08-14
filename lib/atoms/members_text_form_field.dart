import 'package:flutter/material.dart';

class MembersTextFormField extends StatelessWidget {
  const MembersTextFormField({
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
      maxLength: 8,
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Members',
        icon: const Icon(Icons.people),
        suffix: IconButton(
          onPressed: onSaved,
          icon: const Icon(Icons.add),
        ),
      ),
      validator: validator,
    );
  }
}
