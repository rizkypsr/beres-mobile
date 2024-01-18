import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownV2<T> extends StatelessWidget {
  const DropdownV2({
    Key? key,
    required this.label,
    required this.isLoading,
    required this.items,
    this.itemAsString,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final bool isLoading;
  final List<T> items;
  final String Function(T)? itemAsString;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : DropdownSearch<T>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              dropdownSearchDecoration: InputDecoration(
                hintText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            items: items,
            itemAsString: itemAsString,
            onChanged: onChanged,
          );
  }
}
