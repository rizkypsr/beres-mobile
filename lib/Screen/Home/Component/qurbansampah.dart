import 'package:flutter/material.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/TitleText.dart';
import 'package:ovo_ui/Screen/Home/Component/qurban_services.dart';
import 'package:ovo_ui/main.dart';

class qurbanSampah extends StatefulWidget {
  @override
  State<qurbanSampah> createState() => _qurbanSampahState();
}

class _qurbanSampahState extends State<qurbanSampah> {
  List<Qurbanmodel> listqurbanjs = [];

  _getData() async {
    listqurbanjs = await getQurbanJson.getQurbanJs();
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
        title: Text("Qurban Sampah"),
      ),
      backgroundColor: greybgcolor,
      body: listqurbanjs == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: listqurbanjs != null ? listqurbanjs.length : 0,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: listqurbanjs != null
                      ? listqurbanjs.length > 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
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
                                  child: Center(
                                    child: Image.network(
                                      listqurbanjs[index].gambarqurban,
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TitleText(
                                      color: darkpurple,
                                      text: listqurbanjs[index].namaqurban,
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(listqurbanjs[index].deskripsiqurban),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          : SizedBox()
                      : SizedBox(),
                );
              }),
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 8,
      //   child: Container(
      //     padding: EdgeInsets.fromLTRB(15, 16, 15, 7),
      //     width: double.infinity,
      //     child: Container(
      //       width: double.infinity,
      //       height: MediaQuery.of(context).size.height / 15,
      //       decoration: BoxDecoration(
      //         color: darkpurple,
      //         borderRadius: BorderRadius.circular(19),
      //       ),
      //       child: Center(
      //           child: InkWell(
      //         onTap: () {},
      //         child: Text(
      //           "Hubungi",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.w600,
      //           ),
      //         ),
      //       )),
      //     ),
      //   ),
      // ),
    );
  }
}
