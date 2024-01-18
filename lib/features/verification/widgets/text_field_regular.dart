import 'package:flutter/material.dart';

class TextFieldRegular extends StatelessWidget {
  const TextFieldRegular({
    Key? key,
    this.controller,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.disabled = false, // Add disabled property
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool disabled; // Add disabled property

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: disabled
            ? Colors.grey
            : Colors.white, // Update color based on disabled property
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 1), // changes the shadow direction
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
          enabled: !disabled, // Set enabled based on disabled property
        ),
      ),
    );
  }
}
