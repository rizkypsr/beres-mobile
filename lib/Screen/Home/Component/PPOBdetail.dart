import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/PPOBcat_services.dart';
import 'package:ovo_ui/Screen/Home/Component/PPOBdetail_services.dart';

class PPOBdetail extends StatefulWidget {
  final Function? onChange;
  final int? iddet;
  PPOBdetail({
    this.iddet,
    this.onChange,
  });

  @override
  _PPOBdetail createState() => _PPOBdetail();
}

class _PPOBdetail extends State<PPOBdetail> {
  List<detailPPOBmodel> listdetail = [];
  bool isLoading = false;

  _getdetailppob() async {
    setState(() {
      isLoading = true;
    });
    listdetail = await getPPOBdetailJson.getPPOBdetailJs(widget.iddet);
    // listObject.map((item){
    //   listkotajs.add(item.kecamatanjs);
    // }).toList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getdetailppob();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PPOBdetail oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _getdetailppob();
  }

  @override
  Widget build(BuildContext context) {
    // return isLoading == true
    //     ? CircularProgressIndicator()
    //     : Container(
    //         margin: EdgeInsets.all(8),
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //         child: DropdownSearch<detailPPOBmodel>(
    //           dropdownSearchDecoration: InputDecoration(
    //               fillColor: Colors.white,
    //               hintText: "Nominal",
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //               contentPadding:
    //                   EdgeInsets.symmetric(vertical: 0, horizontal: 10)),
    //           mode: Mode.MENU,
    //           items: listdetail == null ? [] : listdetail,
    //           itemAsString: (item) => item.hrg_detpp, //+'-'+ item.bayar_detpp,
    //           // showSelectedItems: true,
    //           // items: [
    //           //   "Pilih Kota/Kecamatan",
    //           // ],
    //           //label: "Menu mode",
    //           //hint: "country in menu mode",
    //           //popupItemDisabled: (String s) => s.startsWith('I'),
    //           onChanged: (data) {
    //             print("on change : ");
    //             print(data);
    //             if (data != null) {
    //               widget.onChange!(data.id_detpp, data.hrg_detpp);
    //             }
    //           },
    //           // selectedItem: "Pilih Kota/Kecamatan",
    //           showClearButton: true,
    //           showSearchBox: true,
    //         ),
    //       );

    return Container();
  }
}
