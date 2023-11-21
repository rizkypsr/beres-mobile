import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/FAQPage.dart';
import 'package:ovo_ui/Screen/Home/Component/teleService.dart';
import 'package:ovo_ui/Screen/Home/Component/waServices.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HelpPages extends StatefulWidget {
  @override
  _HelpPages createState() => _HelpPages();
}

Future<void> launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _HelpPages extends State<HelpPages> {
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
        title: Text("Help Pages"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  // Uri uri = Uri(
                  //     scheme: 'https',
                  //     host: 'https://wa.me/+62' + listwajs[0].deskripsi_sosmed);
                  //     Uri.https('wa.me/0' + listwajs[0].deskripsi_sosmed);
                  //launchURL(uri);
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
                    // final Uri uri =
                    //     Uri(scheme: 'https', host: 't.me/+gS6f4VXSTDFkNGI1');
                    //     Uri.https('wa.me/0' + listwajs[0].deskripsi_sosmed);
                    // launchURL(uri);
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
                    ))),
          ],
        ),
      ),
    );
  }
}

class CallOnTap extends StatelessWidget {
  final String text;
  final String icon;
  const CallOnTap({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      margin: EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 60,
            width: 60,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 13,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
