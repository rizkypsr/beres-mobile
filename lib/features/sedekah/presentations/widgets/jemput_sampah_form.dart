import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/dropdown_city.dart';
import 'package:ovo_ui/core/presentations/widgets/form/text_field_with_icon.dart';
import 'package:ovo_ui/features/sedekah/controllers/jemput_sampah_controller.dart';

class JemputSampahForm extends StatelessWidget {
  JemputSampahForm({
    Key? key,
    required this.onSubmit,
    required this.onDropdownChanged,
  }) : super(key: key);

  final Function(String nama, String telp, String alamat, String jenis)
      onSubmit;
  final Function onDropdownChanged;

  final TextEditingController namaController = new TextEditingController();
  final TextEditingController telpController = new TextEditingController();
  final TextEditingController alamatController = new TextEditingController();
  final TextEditingController jenisController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JemputSampahController>();

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldWithIcon(
            controller: namaController,
            label: "Nama",
            hint: "Masukkan nama",
            icon: Icons.account_circle_rounded,
            errorText: controller.error['nama'],
          ),
          SizedBox(height: 20),
          TextFieldWithIcon(
            controller: telpController,
            label: "No.Telp",
            hint: "Masukkan No.Telp",
            icon: Icons.phone_android,
            errorText: controller.error['nomor'],
          ),
          SizedBox(height: 20),
          TextFieldWithIcon(
            controller: alamatController,
            label: "Alamat",
            hint: "Masukkan alamat",
            icon: Icons.location_city,
            errorText: controller.error['alamat'],
          ),
          SizedBox(height: 20),
          TextFieldWithIcon(
            controller: jenisController,
            label: "Jenis Sampah",
            hint: "Masukkan jenis sampah",
            icon: Icons.restore_from_trash,
            errorText: controller.error['jenis_sampah'],
          ),
          SizedBox(height: 20),
          Text(
            "Kota/Kecamatan",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 7),
          Dropdown(onChange: onDropdownChanged),
          SizedBox(height: 20),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ElevatedButton(
              onPressed: () {
                onSubmit(
                  namaController.text,
                  telpController.text,
                  alamatController.text,
                  jenisController.text,
                );
              },
              child: Text(
                "Kirim",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF0e8e83),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 40),
              ),
            );
          }),
        ],
      );
    });
  }
}
