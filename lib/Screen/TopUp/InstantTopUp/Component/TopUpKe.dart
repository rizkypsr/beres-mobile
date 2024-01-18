import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovo_ui/Constant/Color.dart';

class TopUpKe extends StatelessWidget {
  const TopUpKe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Up dari",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 13),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  offset: Offset(0, 5),
                  color: Colors.grey.withOpacity(0.2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                  decoration: BoxDecoration(
                      color: darkpurple,
                      borderRadius: BorderRadius.circular(3)),
                  // child: SvgPicture.asset(
                  //   "assets/icons/logoovo.svg",
                  //   height: 8,
                  // ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //children: [
                    Text(
                      "Beres Saldo",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    // TextField(
                    //   style: TextStyle(fontSize: 14),
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     contentPadding: EdgeInsets.only(top: 14),
                    //     prefixIcon: Icon(Icons.phone_android),
                    //     hintText: "ID Pelanggan",
                    //   ),
                    // ),
                    // SizedBox(height: 20),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
