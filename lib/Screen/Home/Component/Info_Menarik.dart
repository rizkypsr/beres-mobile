import 'package:flutter/material.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/JemputSampah.dart';
import 'package:ovo_ui/Screen/Home/Component/qurbansampah.dart';

class InfoMenarik extends StatelessWidget {
  const InfoMenarik({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 25, bottom: 17, left: 19, right: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Layanan beresin sampah",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 6),
          Text(
            "Jadikan sampahmu sumber pahala !",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InfoCard(
                imgpath: "assets/images/jemputsampah.jpeg",
                title: "Layanan Sedekah Sampah",
                desc: "Sampah terpilah kamu akan dijemput ke rumah",
                textbutton: "Selengkapnya",
                onpress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return JemputSampah(/*user: barcode.code,*/);
                  }));
                },
              ),
              InfoCard(
                imgpath: "assets/images/qurbansampah.jpeg",
                title: "Layanan Qurban Sampah",
                desc: "Mari berqurban bersama kami",
                textbutton: "Selengkapnya",
                onpress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return qurbanSampah(/*user: barcode.code,*/);
                  }));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Function onpress;
  final String imgpath;
  final String title;
  final String desc;
  final String textbutton;

  const InfoCard({
    Key? key,
    required this.title,
    required this.desc,
    required this.imgpath,
    required this.textbutton,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 8.0;
    return GestureDetector(
      onTap: () {
        onpress();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8)
          ],
          borderRadius: BorderRadius.circular(radius),
        ),
        width: (MediaQuery.of(context).size.width - 57) * 0.5,
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(radius)),
              child: Container(
                height: 83,
                width: double.infinity,
                child: Image.asset(
                  imgpath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(9, 13, 9, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  SizedBox(height: 14),
                  Text(
                    desc,
                    style: TextStyle(fontSize: 12, color: greytext),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textbutton,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: cyantext),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
