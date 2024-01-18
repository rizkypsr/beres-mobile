import 'package:flutter/material.dart';
import 'package:ovo_ui/Constant/Color.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: darkpurple,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
