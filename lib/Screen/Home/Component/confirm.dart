import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/CustomerGet.dart';
import 'package:ovo_ui/Screen/Home/Component/FailedPage.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/Screen/Home/Component/transfer_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class confirm extends StatefulWidget {
  final int? id_detail;
  final String namapengirim;
  final String nominal;
  final String id_user;
  final String id_pengirim;
  confirm(
      {this.id_detail,
      required this.nominal,
      required this.id_user,
      required this.id_pengirim,
      required this.namapengirim});
  @override
  _confirmState createState() => _confirmState();
}

class _confirmState extends State<confirm> {
  customerModel? listname = null;
  bool isbuttonactive = true;

  _getData() async {
    listname = await getCustomerGetJson.getCustomerGetJs(widget.id_user);
    setState(() {});
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Konfirmasi"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              PurpleBG(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
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
                child: listname != null
                    ? Row(
                        children: [
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "ID Pengirim",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Pengirim",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Penerima",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Text("Nominal",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16)),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            //flex: 1,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    " : " + widget.id_pengirim.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    " : " + widget.namapengirim.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    " : " + listname!.nama_customer.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      " : " +
                                          NumberFormat.currency(
                                                  locale: 'id',
                                                  symbol: ' ',
                                                  decimalDigits: 0)
                                              .format(int.parse(widget.nominal))
                                              .toString() +
                                          " Poin",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16)),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                //CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 16, 15, 7),
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
              color: darkpurple,
              borderRadius: BorderRadius.circular(19),
            ),
            child: Center(
                child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Konfirmasi"),
                        content: Text("Apakah anda yakin untuk melanjutkan?"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Tidak")),
                          ElevatedButton(
                              child: Text("Ya"),
                              onPressed: isbuttonactive
                                  ? () async {
                                      var response =
                                          await Transferservices.Transferjs(
                                              widget.id_pengirim,
                                              listname!.id_customer.toString(),
                                              widget.nominal);
                                      print(response);
                                      if (response['status'] == 'success') {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SuccessPage();
                                        }));
                                        setState(() => isbuttonactive = false);
                                      } else if (response['status'] !=
                                          'success') {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return FailedPage();
                                        }));
                                      }
                                    }
                                  : null),
                        ],
                      );
                    });
              },
              child: Text(
                "Transfer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
