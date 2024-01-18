import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Screen/Home/Component/JemputSampah_services.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/features/sedekah/controllers/jemput_sampah_controller.dart';
import 'package:ovo_ui/features/sedekah/presentations/widgets/jemput_sampah_form.dart';

class JemputSampahScreen extends StatefulWidget {
  String? nama;
  String? nomor;
  String? alamat;
  String? jenis_sampah;
  String? kecamatan;
  String? Tipe;

  JemputSampahScreen(
      {
      // this.id_user,
      this.nama,
      this.nomor,
      this.alamat,
      this.jenis_sampah,
      this.kecamatan,
      this.Tipe});
  @override
  _JemputSampah createState() => _JemputSampah();
}

class _JemputSampah extends State<JemputSampahScreen> {
  int run = 0;
  bool _validate = false;
  int selected_id_kc = 0;

  @override
  Widget build(BuildContext context) {
    final JemputSampahController jemputSampahController = Get.put(
      JemputSampahController(),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Sedekah Sampah",
        ),
        foregroundColor: Colors.white,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0e8e83),
                      Color(0xFFF4F4F4),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: JemputSampahForm(
                    onDropdownChanged: (id) {
                      selected_id_kc = id;
                    },
                    onSubmit: (nama, telp, alamat, jenis) async {
                      await jemputSampahController.jemputsampahjs(
                        nama,
                        telp,
                        alamat,
                        jenis,
                        selected_id_kc,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
