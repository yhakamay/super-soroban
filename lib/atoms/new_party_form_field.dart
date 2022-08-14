import 'package:flutter/material.dart';

class NewPartyFormField extends StatelessWidget {
  const NewPartyFormField({
    Key? key,
    required this.controller,
    required this.onPressed,
    required this.labelText,
    required this.iconData,
    required this.suffixIconData,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function() onPressed;
  final String labelText;
  final IconData iconData;
  final IconData suffixIconData;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 24,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        icon: Icon(iconData),
        suffix: IconButton(
          onPressed: onPressed,
          icon: Icon(suffixIconData),
        ),
      ),
      validator: validator,
      onSaved: (_) => onPressed(),
    );
  }
}
