import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/features/logs/controllers/logs_transfer_controller.dart';
import 'package:ovo_ui/features/logs/controllers/logs_transfer_penerima_controller.dart';

class LogTransferPenerimaScreen extends StatelessWidget {
  const LogTransferPenerimaScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final LogTransferPenerimaController controller = Get.put(
        LogTransferPenerimaController()..fetchData(id, 'transfer_penerima'));

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.logs.isEmpty) {
        return const Center(child: Text('Tidak ada log'));
      }

      return ListView.builder(
        itemCount: controller.logs.length,
        itemBuilder: (context, index) {
          final log = controller.logs[index];
          return ListTile(
            leading: Icon(Icons.description),
            title: Text('${log.tanggal}'),
            subtitle: Text('Oleh ${log.customer.nama}'),
            trailing: Text('${log.nominal} Poin'),
          );
        },
      );
    });
  }
}
