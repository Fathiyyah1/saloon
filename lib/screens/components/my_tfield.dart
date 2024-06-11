import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.title,
    this.icon,
    this.emptyValidator,
    this.canBeEmpty = false,
    this.obscure = false,
  });
  final TextEditingController controller;
  final String title;
  final Icon? icon;
  final String? emptyValidator;
  final bool canBeEmpty;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        label: Text(title),
        icon: icon,
      ),
      validator: canBeEmpty
          ? null
          : (value) {
              if (value == null || value.isEmpty) {
                return emptyValidator ?? "This field can't be empty.";
              }
              return null;
            },
    );
  }
}
