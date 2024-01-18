import 'package:flutter/material.dart';
import 'package:ovo_ui/Screen/Home/Component/FAQPage.dart';
import 'package:ovo_ui/Screen/Home/Component/teleService.dart';
import 'package:ovo_ui/Screen/Home/Component/waServices.dart';
import 'package:ovo_ui/features/help/presentations/widgets/call_on_top.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreen createState() => _HelpScreen();
}

Future<void> launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _HelpScreen extends State<HelpScreen> {
  List<WaJsModel> listwajs = [];
  List<TeleJsModel> listtelejs = [];

  _getData() async {
    listwajs = await getWaGetJson.getWagetJs();
    listtelejs = await getTeleGetJson.getTelegetJs();
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
      appBar: AppBar(
        title: Text("Help"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 64,
          ),
          Image.asset(
            "assets/images/cs.png",
            fit: BoxFit.cover,
            height: 120,
          ),
          Container(
            margin: EdgeInsets.all(10),
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
          ),
          Container(
            margin: EdgeInsets.all(10),
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
            child: InkWell(
              onTap: () {
                launchURL("https://wa.me/+62" + listwajs[0].deskripsi_sosmed);
              },
              child: CallOnTap(
                icon: "assets/images/wa.png",
                text: "What's app",
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
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
              child: InkWell(
                onTap: () {
                  launchURL("https://" + listtelejs[0].deskripsi_sosmed);
                },
                child: CallOnTap(
                  icon: "assets/images/tele.png",
                  text: "Telegram",
                ),
              )),
          Container(
            margin: EdgeInsets.all(10),
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
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FAQPages();
                }));
              },
              child: CallOnTap(
                icon: "assets/images/faq.png",
                text: "FAQ",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
