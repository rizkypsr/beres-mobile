import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Screen/Home/Component/productumkm_service.dart';
import 'dart:convert';
import 'productJs_Service.dart';

import 'package:ovo_ui/Constant/ProductJsModel.dart';

// //String stringResponse;
// Map mapResponse;
// Map dataResponse;
// List listResponse;

class ProductView2 extends StatefulWidget {
  final int? idUmkm;
  ProductView2({this.idUmkm});
  @override
  _ProductView2 createState() => _ProductView2();
}

class _ProductView2 extends State<ProductView2> {
  // Future apicall() async {
  //   http.Response response;
  //   response = await http
  //       .get(Uri.parse("https://banksampah.beres.my.id/api/produkjs"));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       // stringResponse = response.body;
  //       dynamic mapResponse = jsonDecode(response.body);
  //       dynamic listResponse =
  //           mapResponse['data'];
  //     });
  //   }
  // }

  List<ProductUMKMmodel> listproductjs = [];

  _getData() async {
    listproductjs = await getProductUmkmJson.getProductUmkmJs(widget.idUmkm);
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
        title: Text("Produk UMKM"),
      ),
      backgroundColor: Colors.white,
      // Jika list product null, maka menampilkan loading
      body: listproductjs == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          :
          // Jika tidak null, maka menampilkan list
          CustomScrollView(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
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
                        child: listproductjs != null
                            ? listproductjs.length > 0
                                ? Column(children: [
                                    CachedNetworkImage(
                                      imageUrl: listproductjs[index].imageum,
                                      fit: BoxFit.cover,
                                      height: 100,
                                      errorWidget: (context, url, error) =>
                                          Center(child: Icon(Icons.error)),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(listproductjs[index].judulum,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87)),
                                    Text(listproductjs[index].deskripsium,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            color: Colors.black87)),
                                  ])
                                : SizedBox()
                            : SizedBox(),
                      );
                    },
                    // Jika list produk null, maka panjang list di set 0, jika tidak null maka di set sesuai panjang list produk
                    childCount:
                        listproductjs != null ? listproductjs.length : 0,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12),
                )
              ],
            ),
    );
  }
}
