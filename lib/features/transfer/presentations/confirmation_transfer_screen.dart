import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/features/transfer/controllers/transfer_controller.dart';
import 'package:ovo_ui/features/transfer/presentations/transfer_saldo_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_screen.dart';
import 'package:ovo_ui/main_screen.dart';

class ConfirmationTransferScreen extends StatefulWidget {
  const ConfirmationTransferScreen({
    Key? key,
    required this.pengirimId,
    required this.penerimaId,
    required this.nominal,
  }) : super(key: key);

  final String pengirimId;
  final String penerimaId;
  final int nominal;

  @override
  State<ConfirmationTransferScreen> createState() =>
      _ConfirmationTransferScreenState();
}

class _ConfirmationTransferScreenState
    extends State<ConfirmationTransferScreen> {
  final TransferController controller = Get.find<TransferController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMultipleUsers([widget.pengirimId, widget.penerimaId]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Transfer'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.users.value.length == 0) {
          return Center(
            child: Text('User tidak ditemukan'),
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
                                  Text(
                                    'ID Pengirim: ${controller.users.value[0].idCustomer}',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Nama Pengirim: ${controller.users.value[0].nama}',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Nama Penerima: ${controller.users.value[1].nama}',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Nominal: ${widget.nominal.toString()} Poin',
                                    textAlign: TextAlign.justify,
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
              ],
            ),
          ],
        );
      }),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () async {
            final resultDialog = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Konfirmasi'),
                  content: Text('Anda yakin ingin melakukan transfer?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        'Batal',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(color: darkpurple),
                      ),
                    ),
                  ],
                );
              },
            );

            if (resultDialog == null || !resultDialog) {
              return;
            }

            Get.back(result: true);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: darkpurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            'Transfer',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
