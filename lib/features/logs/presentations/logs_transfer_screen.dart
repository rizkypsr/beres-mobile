import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/features/logs/controllers/logs_transfer_controller.dart';

class LogsTrasnferScreen extends StatelessWidget {
  const LogsTrasnferScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final LogTransferController controller =
        Get.put(LogTransferController()..fetchData(id, 'transfer'));

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
