import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/env_learning/entities/challenge.dart';
import 'package:ovo_ui/features/env_learning/presentations/widgets/challenge_item.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key, required this.day}) : super(key: key);

  final String day;

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  List<Challenge> challenges = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          '${baseUrlApi}/challenge?limit=10&page=1&day=${widget.day}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> challengeList = List.from(data['data']);

        print(response.body);

        List<Challenge> parsedChallengeList = challengeList
            .map((articleData) => Challenge.fromJson(articleData))
            .toList();

        setState(() {
          challenges = parsedChallengeList;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load challenges');
      }
    } catch (error) {
      print(error);
      Fluttertoast.showToast(
        msg: 'Error: $error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Challenge'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : challenges.isEmpty
              ? Center(
                  child: Text('Tidak ada challenge pada hari ini'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: challenges.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChallengeItem(
                      challenge: challenges[index],
                    );
                  },
                ),
    );
  }
}
