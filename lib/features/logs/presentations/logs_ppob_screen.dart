import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/features/logs/controllers/logs_ppob_controller.dart';
import 'package:ovo_ui/features/logs/controllers/logs_transfer_controller.dart';

class LogsPpobScreen extends StatelessWidget {
  const LogsPpobScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final LogsPpobController controller =
        Get.put(LogsPpobController()..fetchData(id, 'ppob'));

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
            leading: Icon(Icons.money_rounded),
            title: Text('${log.hargaTransaksiPpob}'),
            subtitle: Text(
                'Rp.${NumberFormat.currency(locale: 'id', symbol: ' ', decimalDigits: 0).format(
              int.parse(log.bayarTransaksiPpob),
            )}'),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(log.tanggalTransaksiPpob),
                Text('${log.statusPpob.capitalize}'),
              ],
            ),
          );
        },
      );
    });
  }
}
