import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/Color.dart';

class PilihTopUp extends StatefulWidget {
  final Function? nominalfunction;
  final String? nominal;

  const PilihTopUp({Key? key, this.nominal, this.nominalfunction})
      : super(key: key);

  @override
  _PilihTopUpState createState() => _PilihTopUpState();
}

class _PilihTopUpState extends State<PilihTopUp> {
  TextEditingController? nominalcontroller;
  int? amount;
  FocusNode? focusNode;

  @override
  void initState() {
    nominalcontroller = new TextEditingController();
    focusNode = new FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nominalcontroller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.fromLTRB(16, 16, 22, 40),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilih Nominal",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              nominalBTN(20000),
              nominalBTN(50000),
              nominalBTN(100000),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 3),
            child: Text(
              "Atau masukan nominal di sini",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          TextField(
            onChanged: (data) {
              widget.nominalfunction!(data);
            },
            onTap: () {
              setState(() {
                amount = 0;
              });
            },
            focusNode: focusNode,
            controller: nominalcontroller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: greybgcolor,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector nominalBTN(int nominal) {
    return GestureDetector(
      onTap: () {
        nominalcontroller!.clear();
        if (focusNode!.hasPrimaryFocus) {
          focusNode!.unfocus();
        }
        setState(() {
          amount = nominal;
        });
        widget.nominalfunction!(nominal.toString());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
              color: nominal == amount ? darkpurple : Colors.transparent),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0, 5),
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: Text(
          NumberFormat.currency(locale: 'id', symbol: ' ', decimalDigits: 0)
              .format(nominal),
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
