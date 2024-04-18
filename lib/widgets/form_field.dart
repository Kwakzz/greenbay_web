import 'package:flutter/material.dart';
import 'package:greenbay_web/widgets/text.dart';

class MyFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;
  final Function()? onTap;

  const MyFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(
          text: label,
          fontSize: 14,
          weight: FontWeight.w600,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onTap: onTap,
            decoration: InputDecoration(   
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black26,
              ),
              fillColor: Colors.grey[200], // Set background color
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none, // Remove default border
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill in this field.';
              }
              return null;
            },
            maxLines: maxLines,
          ),
        )
      ],
    );
  }
}
