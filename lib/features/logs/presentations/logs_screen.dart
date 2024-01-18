import 'package:flutter/material.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/logs/presentations/logs_jual_sampah_screen.dart';
import 'package:ovo_ui/features/logs/presentations/logs_ppob_screen.dart';
import 'package:ovo_ui/features/logs/presentations/logs_transfer_penerima_screen.dart';
import 'package:ovo_ui/features/logs/presentations/logs_transfer_screen.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log Transaksi'),
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'Transfer Pengirim'),
              Tab(text: 'Transfer Penerima'),
              Tab(text: 'Jual Sampah'),
              Tab(text: 'PPOB'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LogsTrasnferScreen(id: id),
            LogTransferPenerimaScreen(id: id),
            LogsJualSampahScreen(id: id),
            LogsPpobScreen(id: id)
          ],
        ),
      ),
    );
  }
}
