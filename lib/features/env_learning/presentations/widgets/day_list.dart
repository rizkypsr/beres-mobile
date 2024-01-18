import 'package:flutter/material.dart';
import 'package:ovo_ui/features/env_learning/presentations/widgets/day_item.dart';

class DayList extends StatelessWidget {
  DayList({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> days = [
    {'index': 1, 'label': 'Senin'},
    {'index': 2, 'label': 'Selasa'},
    {'index': 3, 'label': 'Rabu'},
    {'index': 4, 'label': 'Kamis'},
    {'index': 5, 'label': 'Jumat'},
    {'index': 6, 'label': 'Sabtu'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: days.length,
      itemBuilder: (BuildContext context, int index) {
        return DayItem(
          index: days[index]['index'],
          label: days[index]['label'],
        );
      },
    );
  }
}
