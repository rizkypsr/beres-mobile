import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/features/sedekah/presentations/jemput_sampah_screen.dart';
import 'package:ovo_ui/features/env_learning/presentations/env_learning_screen.dart';
import 'package:ovo_ui/features/home/presentations/widgets/service_item.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                imgpath: "assets/images/sedekahsampah.png",
                title: "Sedekah Sampah",
                desc:
                    "Baju bekas, sampah Anorganik dll yang siap dijemput dirumah",
                textbutton: "Selengkapnya",
                onTap: () {
                  Get.to(JemputSampahScreen());
                },
              ),
              ServiceItem(
                imgpath: "assets/images/env.jpg",
                title: "Environment Learning",
                desc:
                    "Belajar menjaga lingkungan untuk menjaga generasi masa depan",
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
