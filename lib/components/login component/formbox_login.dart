import 'package:flutter/material.dart';

class formbox extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isRequired;

  final IconData? prefixIcon;

  const formbox({
    Key? key,
    required this.hintText,
    this.controller,
    this.isRequired = false,
    this.prefixIcon,
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
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Peringatan'),
                    content: Text('$hintText tidak boleh kosong'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                return '';
              }
              return null;
            }
          : null,
    );
  }
}
