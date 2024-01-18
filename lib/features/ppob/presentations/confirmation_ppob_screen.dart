import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/features/ppob/controllers/ppob_controller.dart';
import 'package:ovo_ui/features/verification/presentations/verification_screen.dart';

class ConfirmationPpobScreen extends StatelessWidget {
  const ConfirmationPpobScreen({
    Key? key,
    this.id_detail,
    this.harga,
    this.id_pelanggan,
    this.id_cat,
  }) : super(key: key);

  final int? id_detail;
  final String? harga;
  final String? id_pelanggan;
  final String? id_cat;

  @override
  Widget build(BuildContext context) {
    final PpobController ppobController = Get.find<PpobController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Konfirmasi"),
      ),
      body: Stack(
        children: [
          PurpleBG(),
          Container(
            height: 90,
            width: double.infinity,
            margin: EdgeInsets.all(20),
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
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "ID Detail",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          "ID Pelanggan",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text("Kategori",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16)),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  //flex: 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          " : " + id_detail.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          " : " + id_pelanggan!,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          " : " + harga!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        child: Obx(() {
          if (ppobController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ElevatedButton(
            onPressed: () async {
              ppobController.postPpob(
                  userId: id_pelanggan!, produk: id_detail.toString());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: darkpurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Transfer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
