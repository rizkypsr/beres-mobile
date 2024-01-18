import 'package:flutter/material.dart';

class TextFieldWithIcon extends StatelessWidget {
  const TextFieldWithIcon({
    Key? key,
    required this.hint,
    required this.icon,
    this.label,
    this.errorText,
    this.controller,
  }) : super(key: key);

  final String? label;
  final String hint;
  final IconData icon;
  final String? errorText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? SizedBox()
            : Text(
                label!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
          ),
          height: 60,
          child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                icon,
                color: Color(0xFF0e8e83),
              ),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black38),
            ),
          ),
        ),
        errorText == null ? SizedBox() : SizedBox(height: 10),
        errorText == null
            ? SizedBox()
            : Text(
                errorText!,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }
}
