import 'package:flutter/material.dart';

class FormBox extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isRequired;
  final IconData? prefixIcon;
  final FormFieldSetter<String>? onSaved;

  const FormBox({
    Key? key,
    required this.hintText,
    this.controller,
    this.isRequired = false,
    this.prefixIcon,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: isRequired
          ? (value) {
              if (value == null || value.isEmpty) {
                return '$hintText tidak boleh kosong';
              }
              return null;
            }
          : null,
      onSaved: onSaved,
    );
  }
}
