import 'package:flutter/material.dart';
import 'package:ovo_ui/features/env_learning/presentations/widgets/day_list.dart';

class EnvLearning extends StatelessWidget {
  const EnvLearning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges'),
      ),
      body: DayList(),
    );
  }
}
