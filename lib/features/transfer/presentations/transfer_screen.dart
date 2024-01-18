import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/features/transfer/controllers/transfer_controller.dart';
import 'package:ovo_ui/features/transfer/presentations/transfer_saldo_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_screen.dart';
import 'package:ovo_ui/main_screen.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final TransferController controller =
        Get.put(TransferController()..fetchUser(id));

    return Scaffold(
      appBar: AppBar(
        title: Text('Saldo Cek'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Stack(
          children: [
            PurpleBG(),
            Column(
              children: <Widget>[
                Container(
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Saldo Beres \n" +
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: ' ',
                                          decimalDigits: 0)
                                      .format(
                                    int.parse(controller
                                            .customer.value?.saldoCustomer
                                            .toString() ??
                                        "-"),
                                  ) +
                                  " Poin",
                              // 'Saldo Beres \n Rp ${widget.saldo}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(4),
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
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 5),
                                  SizedBox(height: 5),
                                  Text(
                                    '${controller.customer.value?.nama ?? "-"}',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '${controller.customer.value?.alamatCustomer ?? "-"}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'ID \t: ${controller.customer.value?.idCustomer ?? "-"}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // buildBayarBtn(),
                // SizedBox(
                //   height: 5,
                // ),
                // buildHomepageBtn(),
                ElevatedButton(
                  onPressed: () async {
                    Get.to(
                      () => TransferSaldoScreen(
                        userId: id,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkpurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Lanjutkan Pembayaran',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    Get.off(
                      () => MainScreen(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkpurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Kembali Ke Halaman Utama',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
