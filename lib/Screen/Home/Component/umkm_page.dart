import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/dropdown_city.dart';
import 'package:ovo_ui/Screen/Home/Component/productview2.dart';
import 'package:ovo_ui/Screen/Home/Component/tokoUmkm_services.dart';

class UMKMPage extends StatefulWidget {
  @override
  _UMKMPage createState() => _UMKMPage();
}

class _UMKMPage extends State<UMKMPage> {
  List<TokoUMKMmodel> listtokojs = [];
  int selected_id_kecamatan = 0;

  _getData() async {
    listtokojs = await getTokoUmkmJson.getTokoUmkmJs(selected_id_kecamatan);
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
      appBar: AppBar(title: dropdown(
        onChange: (id) {
          selected_id_kecamatan = id;
          _getData();
        },
      )),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                child: listtokojs != null
                    ? listtokojs.length > 0
                        ? InfoCard(
                            imgpath: listtokojs[index].imageum,
                            title: listtokojs[index].namaum,
                            desc: listtokojs[index].deskripsium,
                            textbutton: "selengkapnya",
                            onpress: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ProductView2(
                                    idUmkm: listtokojs[index].id_um);
                                //UserPayment(/*user: barcode.code,*/);
                              }));
                            })
                        : SizedBox()
                    : SizedBox(),
              );

              //   InfoCard(
              //     imgpath: "",
              //     title: "" ,
              //     desc: "" ,
              //     textbutton: "" ,
              //   );
              // },
              //     delegate: SliverChildListDelegate(
              //   [
              //     InfoCard(
              //       imgpath: "assets/images/27122.jpg",
              //       title: "Indomaret",
              //       desc: "orang paling bersih sedunia",
              //       textbutton: "Selengkapnya",
              //       onpress: () {
              //         Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //   return ProductView2();
              //   //UserPayment(/*user: barcode.code,*/);
              // }));
              //       },
              //     ),
              //     SizedBox(height: 20),
              //     InfoCard(
              //       imgpath: "assets/images/27053.jpg",
              //       title: "Alfamart",
              //       desc: "Master the one and only",
              //       textbutton: "Selengkapnya",
              //       onpress: () {
              //         Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //   return ProductView2();
              //   //UserPayment(/*user: barcode.code,*/);
              // }));
              //       },
              //     ),
              //     SizedBox(height: 20),
              //     InfoCard(
              //       imgpath: "assets/images/27053.jpg",
              //       title: "Alfamart",
              //       desc: "Master the one and only",
              //       textbutton: "Selengkapnya",
              //       onpress: () {
              //         Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //   return ProductView2();
              //   //UserPayment(/*user: barcode.code,*/);
              // }));
              //       },
              //     ),
              //     SizedBox(height: 20)
              //   ],
              // )
            },
            childCount: listtokojs != null ? listtokojs.length : 0,
          )),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Function? onpress;
  final String? imgpath;
  final String? title;
  final String? desc;
  final String? textbutton;

  const InfoCard({
    Key? key,
    this.title,
    this.desc,
    this.imgpath,
    this.textbutton,
    this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 8.0;
    return GestureDetector(
      onTap: () {
        onpress!();
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
        //width: (MediaQuery.of(context).size.width - 57) * 0.5,
        height: 200,
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
                child: Image.network(
                  imgpath!,
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
                    title!,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  SizedBox(height: 14),
                  Text(
                    desc!,
                    style: TextStyle(fontSize: 12, color: greytext),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textbutton!,
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
