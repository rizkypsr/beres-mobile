import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/kecamatan_services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';

class dropdown extends StatefulWidget {
  final Function onChange;

  dropdown({required this.onChange});

  @override
  _dropdown createState() => _dropdown();
}

class _dropdown extends State<dropdown> {
  List<KotaJSModel> listkotajs = [];

  _getDatakec() async {
    listkotajs = await getKecamatanJson.getKecamatanJs();

    // listObject.map((item){
    //   listkotajs.add(item.kecamatanjs);
    // }).toList();

    setState(() {});
  }

  @override
  void initState() {
    _getDatakec();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   child: DropdownSearch<KotaJSModel>(
    //     dropdownSearchDecoration: InputDecoration(
    //         fillColor: Colors.white,
    //         hintText: "Pilih Kota/Kecamatan",
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10)),
    //     mode: Mode.MENU,
    //     items: listkotajs == null ? [] : listkotajs,
    //     itemAsString: (item) => item.kecamatanjs + " , " + item.kotajs.kota,
    //     // showSelectedItems: true,
    //     // items: [
    //     //   "Pilih Kota/Kecamatan",
    //     // ],
    //     //label: "Menu mode",
    //     //hint: "country in menu mode",
    //     //popupItemDisabled: (String s) => s.startsWith('I'),
    //     onChanged: (data) {
    //       print("on change : ");
    //       print(data);
    //       if (data != null) {
    //         widget.onChange(data.idkc);
    //       }
    //     },
    //     // selectedItem: "Pilih Kota/Kecamatan",
    //     showClearButton: true,
    //     showSearchBox: true,
    //   ),
    // );

    return Container();
  }
}
