import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/Logs_service.dart';

class LogsPage extends StatefulWidget {
  final String? id_user;

  LogsPage({this.id_user});
  @override
  _LogsPage createState() => _LogsPage();
}

class _LogsPage extends State<LogsPage> {
  //List<LogsModel> listlogsjs = [];
  List<LogsModel> listppobjs = [];
  //List<LogsModel> listtransferjs = [];
  // List<LogsModel> newList = [];

  _getData() async {
    //listlogsjs = await getLogsJson.getLogsJsJs(widget.id_user);
    listppobjs = await getLogsJson.getLogsPPOBJs(widget.id_user);
    //listtransferjs = await getLogsJson.getLogsTfJs(widget.id_user);

    // newList = listlogsjs + listppobjs + listtransferjs;
    print("masok");
    print(listppobjs);
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
      appBar: AppBar(title: Text("Logs")),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin: EdgeInsets.all(15),
                  child: listppobjs != null
                      ? listppobjs.length > 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                listppobjs[index].id_transaksippob != null
                                    ? InfoLogs(
                                        //imgpath: "assets/images/27122.jpg",
                                        title: "Transaksi PPOB",
                                        desc: "Harga \t: " +
                                            listppobjs[index]
                                                .harga_transaksippob,
                                        transaksi: "Nomor \t: " +
                                            listppobjs[index].nomor_input,
                                        kondisi: "Status \t: " +
                                            listppobjs[index].status_ppob,
                                        tanggal: "Tanggal \t: " +
                                            listppobjs[index].tanggal_ppob,
                                        onpress: () {},
                                      )
                                    : listppobjs[index].id_transaksijs != null
                                        ? InfoLogs(
                                            //imgpath: "assets/images/27122.jpg",
                                            title: "Transaksi Jual Sampah",
                                            desc: "Jenis sampah \t: " +
                                                listppobjs[index]
                                                    .judulproduk
                                                    .juduljs!,
                                            transaksi: "Jumlah \t: " +
                                                listppobjs[index].jumlah_js,
                                            kondisi: "Status \t: " +
                                                listppobjs[index].status_js,
                                            tanggal: "Total \t: " +
                                                listppobjs[index].total_js,

                                            onpress: () {},
                                          )
                                        : InfoLogs(
                                            //imgpath: "assets/images/27122.jpg",
                                            title: "Transaksi Transfer",
                                            desc: "Penerima \t: " +
                                                listppobjs[index].penerima,
                                            transaksi: "Nominal \t: " +
                                                listppobjs[index].nominal,
                                            kondisi: "Status \t: Success",
                                            tanggal: "Tanggal \t: " +
                                                listppobjs[index]
                                                    .tanggal_transfer,
                                            onpress: () {},
                                          ),
                              ],
                            )
                          : SizedBox()
                      : SizedBox(),
                );
              },
              childCount: listppobjs != null ? listppobjs.length : 0,

              // [
              //   InfoLogs(
              //     //imgpath: "assets/images/27122.jpg",
              //     title: "Indomaret",
              //     desc: "fgejnrvje eklvarnmkn vaelrknmvkl kermgk",
              //     textbutton: "Selengkapnya",
              //     onpress: () {},
              //   ),
              //   InfoLogs(
              //     // imgpath: "assets/images/27053.jpg",
              //     title: "Alfamart",
              //     desc: "fijbnkerhbgfu fjlserbnfjkb jnsrfgjkvn vjnr",
              //     textbutton: "Selengkapnya",
              //     onpress: () {},
              //   ),

              // ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoLogs extends StatelessWidget {
  final Function? onpress;
  final String? transaksi;
  final String? kondisi;
  final String? tanggal;
  // final String imgpath;
  final String? title;
  final String? desc;

  const InfoLogs({
    Key? key,
    this.tanggal,
    this.kondisi,
    this.transaksi,
    this.title,
    this.desc,
    //this.imgpath,

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
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 8)
          ],
          borderRadius: BorderRadius.circular(radius),
        ),
        //width: (MediaQuery.of(context).size.width - 57) * 0.5,

        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(radius)),
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  title!,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                //   height: 83,
                //   width: double.infinity,
                //   // child: Image.asset(
                //   //   imgpath,
                //   //   fit: BoxFit.cover,
                //   // ),
              ),
            ),
            Container(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 10),
                    Text(
                      desc!,
                      style: TextStyle(
                          fontSize: 15,
                          color: greytext,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      transaksi!,
                      style: TextStyle(
                          fontSize: 15,
                          color: greytext,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      kondisi!,
                      style: TextStyle(
                          fontSize: 15,
                          color: greytext,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      tanggal!,
                      style: TextStyle(
                          fontSize: 15,
                          color: greytext,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     textbutton,
                    //     style: TextStyle(
                    //         fontSize: 13,
                    //         fontWeight: FontWeight.w600,
                    //         color: cyantext),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
