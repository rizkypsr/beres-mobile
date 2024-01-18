import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/core/presentations/widgets/form/dropdown_v2.dart';
import 'package:ovo_ui/features/home/entitties/kecamatan.dart';
import 'package:ovo_ui/features/umkm/controllers/umkm_controller.dart';
import 'package:ovo_ui/features/umkm/presentations/widgets/umkm_item.dart';

class UMKMScreen extends StatelessWidget {
  const UMKMScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UmkmController umkmController = Get.put(UmkmController());

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: DropdownV2<Kecamatan>(
            label: "Pilih Kecamatan",
            isLoading: umkmController.isLoadingKecamatan.value,
            items: umkmController.kecamatan.value,
            itemAsString: (Kecamatan? item) =>
                item == null ? "" : "${item.nama}, ${item.kota!.nama}",
            onChanged: (item) {
              umkmController.fetchUmkm(item!.id);
            },
          ),
        ),
        body: umkmController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : umkmController.umkm.value.isEmpty
                ? Center(child: Text('Tidak ada UMKM'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: umkmController.umkm.value.length,
                    itemBuilder: (context, index) {
                      final product = umkmController.umkm.value[index];
                      return UmkmItem(umkm: product);
                    },
                  ),
      ),
    );
  }
}
