import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/InputIdOption.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner2.dart';
import 'package:ovo_ui/Screen/Home/Component/TitleText.dart';
import 'package:ovo_ui/Screen/Home/Component/product.dart';
import 'package:ovo_ui/Constant/AppData.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/AppTheme.dart';
import 'package:ovo_ui/Screen/Home/Component/dropdown_city.dart';
import 'package:ovo_ui/Screen/Home/Component/productJs_Service.dart';
import 'package:ovo_ui/Screen/Home/Component/scannerJs.dart';

class ShoppingCartPage extends StatefulWidget {
  final String? Total;
  final String? id_user;
  final String? judul;

  ShoppingCartPage({this.Total, this.id_user, this.judul});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  TextEditingController produkcontrol = new TextEditingController();
  List<ProductJSModel> listproductjs1 = [];
  double totalHarga = 0;
  List<JenisSampahBody> listSampah = [];
  int id_k = 0;

  _getData() async {
    listproductjs1 = await getProductJson.getProductJs(id_k);
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Dropdown(
          onChange: (id) {
            id_k = id;
            _getData();
          },
        )),
        bottomNavigationBar: BottomAppBar(
          elevation: 8,
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.fromLTRB(15, 16, 15, 7),
                width: double.infinity,
                height: 100,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Total Harga : " +
                            NumberFormat.currency(
                                    locale: 'id', symbol: '', decimalDigits: 0)
                                .format(totalHarga) +
                            " Poin",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                          color: darkpurple,
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Center(
                            child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return InputIdOption(
                                Tipe: 'Jual Sampah',
                                listSampah: listSampah,
                              );
                              // return QrScanner2(
                              //   Tipe: 'Jual Sampah',
                              //   listSampah: listSampah,
                              // );
                            }));
                          },
                          child: Text(
                            "Lanjutkan",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                      )
                    ],
                  ),
                )),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                    padding: AppTheme.padding,
                    margin: EdgeInsets.all(3),
                    child: listproductjs1 != null
                        ? listproductjs1.length > 0
                            ? Column(
                                children: [
                                  InfoCard(
                                    id: listproductjs1[index].id!,
                                    imgpath: listproductjs1[index].imagejs!,
                                    title: listproductjs1[index].juduljs!,
                                    harga: listproductjs1[index]
                                        .hargajs!
                                        .toString(),
                                    onChange: (id, judul, berat, totalLama,
                                        totalPerItem) {
                                      totalHarga = totalHarga - totalLama;
                                      totalHarga = totalHarga + totalPerItem;
                                      judul = listproductjs1[index].juduljs;
                                      listSampah
                                          .removeWhere((it) => it.id_js == id);
                                      listSampah.add(JenisSampahBody(
                                          id_js: id,
                                          judul_js: judul,
                                          jumlah_js: berat));
                                    },
                                  ),
                                  // _cartItems(),
                                  // Divider(
                                  //   thickness: 1,
                                  //   height: 70,
                                  // ),
                                  //_price(),
                                  //SizedBox(height: 30),
                                ],
                              )
                            : SizedBox()
                        : SizedBox());
              },
              childCount: listproductjs1 != null ? listproductjs1.length : 0,
            ))
          ],
        ));
  }
}

class InfoCard extends StatefulWidget {
  final Function? onpress;
  final String? imgpath;
  final String? title;
  final String? harga;
  final String? textbutton;
  final Function? onChange;
  final int? id;

  const InfoCard(
      {Key? key,
      this.title,
      this.harga,
      this.imgpath,
      this.textbutton,
      this.onpress,
      this.onChange,
      this.id})
      : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  double total_harga_peritem = 0;
  TextEditingController controller = new TextEditingController();

  void updateHargaPerItem() {
    double total_harga_lama = total_harga_peritem;
    String inputBerat = '0';

    if (controller.text.length > 0) {
      inputBerat = controller.text;
    }

    total_harga_peritem =
        double.parse(inputBerat) * double.parse(widget.harga ?? "0");
    setState(() {});
    widget.onChange!(widget.id, widget.title, inputBerat, total_harga_lama,
        total_harga_peritem);
  }

  @override
  Widget build(BuildContext context) {
    double radius = 8.0;
    return Container(
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
        width: double.infinity,
        //height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(radius)),
              child: Container(
                height: 83,
                width: 83,
                child: CachedNetworkImage(
                  imageUrl: widget.imgpath!,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            Container(
              width: 90,
              padding: EdgeInsets.fromLTRB(9, 13, 9, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 14),
                  Text(
                    widget.harga! + " Poin",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                  // SizedBox(
                  //   height: 28,
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: TextField(
                    onChanged: (value) {
                      updateHargaPerItem();
                    },
                    controller: controller,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "0 kg/pcs",
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

// Widget _cartItems() {
//  // return Column(children: listproductjs1.map((x) => _item(x)).toList());
// }

// Widget _item(){

// }

// // Widget _item(ProductJSModel model) {
// //   return Container(
// //     height: 80,
// //         child: Row(
// //           children: <Widget>[
// //             AspectRatio(
// //               aspectRatio: 1.2,
// //               child: Stack(
// //                 children: <Widget>[
// //                   Align(
// //                     alignment: Alignment.bottomLeft,
// //                     child: Container(
// //                       height: 70,
// //                       width: 70,
// //                       child: Stack(
// //                         children: <Widget>[
// //                           Align(
// //                             alignment: Alignment.bottomLeft,
// //                             child: Container(
// //                               decoration: BoxDecoration(
// //                                   color: Colors.grey,
// //                                   borderRadius: BorderRadius.circular(10)),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   Positioned(
// //                     left: -20,
// //                     bottom: -20,
// //                     child: Image.network(listproductjs1[index].imagejs),
// //                   )
// //                 ],
// //               ),
// //             ),
// //             Expanded(
// //                 child: ListTile(
// //                     title: TitleText(
// //                       text: listproductjs1[index].juduljs,
// //                       fontSize: 15,
// //                       fontWeight: FontWeight.w700,
// //                     ),
// //                     subtitle: Row(
// //                       children: <Widget>[
// //                         TitleText(
// //                           text: '\Rp ',
// //                           color: Colors.redAccent,
// //                           fontSize: 12,
// //                         ),
// //                         TitleText(
// //                           text: listproductjs1[index].hargajs.toString(),
// //                           fontSize: 14,
// //                         ),
// //                       ],
// //                     ),
// //                     trailing: Container(
// //                         width: 50,
// //                         height: 35,
// //                         alignment: Alignment.center,
// //                         decoration: BoxDecoration(
// //                             color: Colors.grey,
// //                             borderRadius: BorderRadius.circular(10)),
// //                         child: TextField(
// //                           controller: produkcontrol,
// //                           keyboardType: TextInputType.numberWithOptions(),
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                             fontSize: 20,
// //                           ),
// //                         )
// //                         // child: TitleText(
// //                         //   text: 'x${model.id}',
// //                         //   fontSize: 12,
// //                         // ),
// //                         )))
// //           ],
// //         );
// //       },
// //     ),
// //   );

// Widget _price() {
//   return Row(
//     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     // children: <Widget>[
//     //   TitleText(
//     //     text: '${listproductjs1.length} Items',
//     //     color: Colors.grey,
//     //     fontSize: 14,
//     //     fontWeight: FontWeight.w500,
//     //   ),
//     //   TitleText(
//     //     text: '\Rp${getPrice()}',
//     //     fontSize: 18,
//     //   ),
//     // ],
//   );
// }

// Widget _submitButton(BuildContext context) {
//   return TextButton(
//     onPressed: () {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text("Konfirmasi"),
//               content: Text("Apakah anda yakin untuk melanjutkan?"),
//               actions: [
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text("Tidak")),
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (context) {
//                         return ScannerJS();
//                         //UserPayment(/*user: barcode.code,*/);
//                       }));
//                     },
//                     child: Text("Ya"))
//               ],
//             );
//           });
//     },
//     style: ButtonStyle(
//       shape: MaterialStateProperty.all(
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       ),
//       backgroundColor: MaterialStateProperty.all<Color>(darkpurple),
//     ),
//     child: Container(
//       alignment: Alignment.center,
//       padding: EdgeInsets.symmetric(vertical: 4),
//       width: AppTheme.fullWidth(context) * .75,
//       child: TitleText(
//         text: 'Lanjutkan',
//         color: Colors.black45,
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//   );
// }

  // double getPrice() {
  //   double hargajs = 0;
  //   listproductjs1.forEach((x) {
  //     hargajs += x.hargajs * x.id;
  //   });
  //   return hargajs;
  // }


