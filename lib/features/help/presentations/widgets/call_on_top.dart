import 'package:flutter/material.dart';

class CallOnTap extends StatelessWidget {
  final String text;
  final String icon;
  const CallOnTap({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      margin: EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 60,
            width: 60,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 13,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
