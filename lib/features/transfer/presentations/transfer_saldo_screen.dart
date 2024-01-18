import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/TopUp/InstantTopUp/Component/TopUpKe.dart';
import 'package:ovo_ui/features/transfer/controllers/nominal_chip_controller.dart';
import 'package:ovo_ui/features/transfer/controllers/transfer_controller.dart';
import 'package:ovo_ui/features/transfer/presentations/confirmation_transfer_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_qr_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_screen.dart';
import 'package:ovo_ui/features/verification/widgets/text_field_regular.dart';

class TransferSaldoScreen extends StatelessWidget {
  TransferSaldoScreen({Key? key, required this.userId}) : super(key: key);

  final String userId;
  final Map<String, double> options = {
    '20.000': 20000,
    '50.000': 50000,
    '100.000': 100000,
  };

  final TextEditingController nominalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NominalChipController chipController = NominalChipController();
    final TransferController transferController =
        Get.find<TransferController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer/Pembayaran"),
      ),
      backgroundColor: greybgcolor,
      body: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                TopUpKe(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 250,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Pilih Nominal',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => Wrap(
                    spacing: 16.0,
                    children: options.entries.map((entry) {
                      return ChoiceChip(
                        label: Text(entry.key),
                        selected:
                            chipController.selectedIndex.value == entry.value,
                        onSelected: (bool selected) {
                          if (selected) {
                            chipController
                                .changeSelectedIndex(entry.value.toInt());
                            return;
                          }

                          chipController.selectedIndex.value = 0;
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Atau masukan nominal di sini',
                ),
                const SizedBox(height: 12),
                TextFieldRegular(
                  controller: nominalController,
                  keyboardType: TextInputType.number,
                  hintText: 'Masukan nominal',
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (transferController.isLoadingPost.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ElevatedButton(
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

                  final result = await Get.to(() => VerificationScreen(
                        needPin: false,
                      ));

                  if (result != null) {
                    final resultConfirmation =
                        await Get.to(() => ConfirmationTransferScreen(
                              pengirimId: userId,
                              penerimaId: result.toString(),
                              nominal: chipController.selectedIndex.value != 0
                                  ? chipController.selectedIndex.toInt()
                                  : int.parse(nominalController.text),
                            ));

                    if (resultConfirmation == null) {
                      return;
                    }

                    if (chipController.selectedIndex.value != 0) {
                      transferController.postTransfer(
                          userId, result, chipController.selectedIndex.toInt());
                      return;
                    }

                    if (nominalController.text.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Nominal tidak boleh kosong',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }

                    transferController.postTransfer(
                      userId,
                      result.toString(),
                      int.parse(nominalController.text),
                    );
                  }
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
              );
            }),
          ],
        ),
      ),
    );
  }
}
