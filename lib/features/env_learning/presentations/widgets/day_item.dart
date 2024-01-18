import 'package:flutter/material.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/env_learning/presentations/challenge_screen.dart';

class DayItem extends StatelessWidget {
  DayItem({Key? key, required this.index, required this.label})
      : super(key: key);

  final int index;
  final String label;

  final day = DateTime.now().weekday;

  bool isToday() {
    return index == day;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isToday()) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChallengeScreen(day: label)),
          );
        }
      },
      child: Card(
        elevation: 1.0,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: isToday() ? darkpurple : darkpurple.withAlpha(30),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        color: isToday() ? Colors.white : Colors.black,
                        fontWeight:
                            isToday() ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    color: isToday() ? darkpurple : Colors.grey.shade500,
                    fontSize: 20.0,
                    fontWeight: isToday() ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
