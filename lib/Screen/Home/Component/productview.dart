import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Screen/Home/Component/Transaction_page.dart';
import 'dart:convert';
import 'productJs_Service.dart';
import 'package:ovo_ui/Screen/Home/Component/dropdown_city.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';

// //String stringResponse;
// Map mapResponse;
// Map dataResponse;
// List listResponse;

class ProductView extends StatefulWidget {
  @override
  _ProductView createState() => _ProductView();
}

class _ProductView extends State<ProductView> {
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

  List<ProductJSModel> listproductjs = [];
  int selected_id_kecamatan = 0;

  _getData() async {
    listproductjs = await getProductJson.getProductJs(selected_id_kecamatan);
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
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ShoppingCartPage();
            }));
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 16, 15, 7),
            width: double.infinity,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                color: darkpurple,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Center(
                  child: Text(
                "Lanjutkan Transaksi",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )),
            ),
          ),
        ),
      ),
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
                              color: Colors.grey.shade200,
                            ),
                          ],
                        ),
                        child: listproductjs != null
                            ? listproductjs.length > 0
                                ? listproductjs[index].deskripsijs != null
                                    ? Container(
                                        margin: EdgeInsets.all(8),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                listproductjs[index].imagejs!,
                                                height: 120,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                  listproductjs[index].juduljs!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black87)),
                                              Text(
                                                  listproductjs[index]
                                                          .hargajs! +
                                                      " Poin" +
                                                      "/" +
                                                      listproductjs[index]
                                                          .satuanjs!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black87)),

                                              Text(
                                                  listproductjs[index]
                                                      .deskripsijs!,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue,
                                                  ))
                                              // Text(
                                              //     "/ " +
                                              //         listproductjs[index].satuanjs,
                                              //     textAlign: TextAlign.left,
                                              //     style: TextStyle(
                                              //         fontWeight: FontWeight.w600,
                                              //         color: Colors.black87)),
                                            ]),
                                      )
                                    : Container(
                                        margin: EdgeInsets.all(8),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                listproductjs[index].imagejs!,
                                                height: 120,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                  listproductjs[index].juduljs!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black87)),
                                              Text(
                                                  listproductjs[index]
                                                          .hargajs! +
                                                      " Poin" +
                                                      "/" +
                                                      listproductjs[index]
                                                          .satuanjs!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black87)),

                                              // Text(listproductjs[index].deskripsijs,
                                              //     style: TextStyle(
                                              //       fontWeight: FontWeight.w600,
                                              //       color: Colors.blue,
                                              //     ))
                                              // Text(
                                              //     "/ " +
                                              //         listproductjs[index].satuanjs,
                                              //     textAlign: TextAlign.left,
                                              //     style: TextStyle(
                                              //         fontWeight: FontWeight.w600,
                                              //         color: Colors.black87)),
                                            ]),
                                      )
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
