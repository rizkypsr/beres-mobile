import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/Screen/TopUp/InstantTopUp/Component/TopUpKe.dart';
import 'package:ovo_ui/core/presentations/widgets/form/dropdown_v2.dart';
import 'package:ovo_ui/core/presentations/widgets/form/text_field_with_icon.dart';
import 'package:ovo_ui/features/ppob/controllers/ppob_controller.dart';
import 'package:ovo_ui/features/ppob/controllers/ppob_detail_controller.dart';
import 'package:ovo_ui/features/ppob/models/ppob.dart';
import 'package:ovo_ui/features/ppob/models/ppob_detail.dart';
import 'package:ovo_ui/features/ppob/presentations/confirmation_ppob_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_screen.dart';

class PpobScreen extends StatelessWidget {
  PpobScreen({Key? key}) : super(key: key);

  final TextEditingController idPelangganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PpobController ppobController = Get.put(PpobController());
    final PpobDetailController ppobDetailController =
        Get.put(PpobDetailController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Top Up PPOB"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TopUpKe(),
              const SizedBox(
                height: 32,
              ),
              Obx(() {
                return DropdownV2<Ppob>(
                  label: "Pilih Kategori",
                  isLoading: ppobController.isLoading.value,
                  items: ppobController.ppob,
                  itemAsString: (Ppob item) => item.judul!,
                  onChanged: (p0) {
                    ppobController.setSelectedPpob(p0!);
                    ppobDetailController.fetchPpob(p0!.id!);
                  },
                );
              }),
              // Obx(() {
              //   return TextFieldWithIcon(
              //     controller: idPelangganController,
              //     hint: 'ID Pelanggan',
              //     icon: Icons.input_rounded,
              //     errorText: ppobController.error['idPelanggan'],
              //   );
              // }),
              const SizedBox(
                height: 32,
              ),
              Obx(() {
                if (ppobDetailController.ppob.value.length > 0) {
                  if (ppobDetailController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return DropdownV2<PpobDetail>(
                      label: "Pilih Nominal",
                      isLoading: ppobDetailController.isLoading.value,
                      items: ppobDetailController.ppob,
                      itemAsString: (PpobDetail item) =>
                          "${item.hargaDetailppob} - ${item.bayarDetailppob}",
                      onChanged: (p0) {
                        ppobDetailController.setSelectedPpob(p0!);
                      },
                    );
                  }
                } else {
                  return Text('Tidak ada data');
                }
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          elevation: 10,
          color: Colors.white,
          child: ElevatedButton(
            onPressed: ppobController.selectedPpob.value.id != null &&
                    ppobDetailController.selectedPpob.value.idDetailppob != null
                ? () async {
                    final result = await Get.to(() => VerificationScreen());

                    if (result != null) {
                      Get.to(
                        () => ConfirmationPpobScreen(
                          id_detail: ppobDetailController
                              .selectedPpob.value.idDetailppob,
                          id_pelanggan: result['userId'],
                          harga: ppobDetailController
                              .selectedPpob.value.hargaDetailppob
                              .toString(),
                        ),
                      );
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: darkpurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Lanjutkan Transaksi',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}
