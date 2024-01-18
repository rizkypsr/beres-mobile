import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ovo_ui/Screen/Home/Component/kecamatan_services.dart';
import 'package:ovo_ui/features/home/entitties/kecamatan.dart';

class Dropdown extends StatefulWidget {
  final Function onChange;

  Dropdown({required this.onChange});

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<Kecamatan> listkotajs = [];
  bool isLoading = true;

  _getDatakec() async {
    listkotajs = await getKecamatanJson.getKecamatanJs();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getDatakec();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : DropdownSearch<Kecamatan>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Pilih Kota/Kecamatan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                ),
              ),
              items: listkotajs,
              itemAsString: (Kecamatan? item) =>
                  item == null ? "" : "${item.nama}, ${item.kota!.nama}",
              onChanged: (Kecamatan? data) {
                if (data != null) {
                  widget.onChange(data.id);
                }
              },
            ),
    );
  }
}
