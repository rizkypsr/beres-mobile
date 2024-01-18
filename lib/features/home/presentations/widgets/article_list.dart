import 'package:flutter/material.dart';
import 'package:ovo_ui/features/env_learning/presentations/env_learning_screen.dart';
import 'package:ovo_ui/features/home/presentations/widgets/service_item.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.only(top: 25, bottom: 17, left: 19, right: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Layanan beresin sampah",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          Text(
            "Jadikan sampahmu sumber pahala !",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ServiceItem(
                imgpath: "assets/images/jemputsampah.jpeg",
                title: "Layanan Sedekah Sampah",
                desc: "Sampah terpilah kamu akan dijemput ke rumah",
                textbutton: "Selengkapnya",
                onTap: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return JemputSampah(/*user: barcode.code,*/);
                  // }));
                },
              ),
              ServiceItem(
                imgpath: "assets/images/qurbansampah.jpeg",
                title: "Environment Learning",
                desc: "Mari berqurban bersama kami",
                textbutton: "Selengkapnya",
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return EnvLearning();
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
