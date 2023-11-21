import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/PPOBcat_services.dart';

class PPOBcat extends StatefulWidget {
  final Function? onChange;
  final int? index;

  PPOBcat({this.onChange, this.index});

  @override
  _PPOBcat createState() => _PPOBcat();
}

class _PPOBcat extends State<PPOBcat> {
  List<CatPPOBmodel> listcategory = [];
  CatPPOBmodel? selectedValue = null;

  _getcatppob() async {
    listcategory = await getCatPPOBJson.getCatPPOBJs();

    // listObject.map((item){
    //   listkotajs.add(item.kecamatanjs);
    // }).toList();

    setState(() {
      if (widget.index != null) {
        selectedValue =
            (listcategory.length < 1 ? null : listcategory[widget.index!])!;
        widget.onChange!(selectedValue!.id_pp);
      }
    });
  }

  @override
  void initState() {
    _getcatppob();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: EdgeInsets.all(8),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   child: DropdownSearch<CatPPOBmodel>(
    //     selectedItem: selectedValue,
    //     dropdownSearchDecoration: InputDecoration(
    //         fillColor: Colors.white,
    //         hintText: "Pilih Kategori",
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10)),
    //     mode: Mode.MENU,
    //     items: listcategory == null ? [] : listcategory,
    //     itemAsString: (item) => item.cat_pp,
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
    //         setState(() {
    //           selectedValue = data;
    //         });
    //         widget.onChange!(data.id_pp);
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
