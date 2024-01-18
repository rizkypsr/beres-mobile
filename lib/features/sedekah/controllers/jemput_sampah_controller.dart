import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Screen/Home/Component/response.dart';

class JemputSampahController extends GetxController {
  var isLoading = false.obs;
  var error = {}.obs;

  Future jemputsampahjs(
    String nama,
    String nomor,
    String alamat,
    String jenis_sampah,
    int kecamatan,
  ) async {
    isLoading(true);

    error.value = {};

    if (nama.isEmpty) {
      error["nama"] = "Nama tidak boleh kosong";
    }

    if (nomor.isEmpty) {
      error["nomor"] = "Nomor tidak boleh kosong";
    }

    if (alamat.isEmpty) {
      error["alamat"] = "Alamat tidak boleh kosong";
    }

    if (jenis_sampah.isEmpty) {
      error["jenis_sampah"] = "Jenis sampah tidak boleh kosong";
    }

    if (kecamatan == 0) {
      error["kecamatan"] = "Kecamatan tidak boleh kosong";
    }

    print(error);

    if (error.isNotEmpty) {
      isLoading(false);
      Fluttertoast.showToast(
        msg: "Pastikan semua data terisi",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
      return;
    }

    try {
      var uri = Uri.parse(jemputsampahUrl);

      var request = http.MultipartRequest("POST", uri);
      request.fields['nama_layanan'] = nama;
      request.fields['no_hp_layanan'] = nomor;
      request.fields['alamat_layanan'] = alamat;
      request.fields['jenis_sampah_layanan'] = jenis_sampah;
      request.fields['kecamatan_layanan'] = kecamatan.toString();

      var response = await request.send();

      if (response.statusCode == 200) {
        Get.off(() => SuccessPage());
      } else {
        Fluttertoast.showToast(
          msg: "Gagal mengirim data",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      }

      isLoading(false);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Gagal mengirim data",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } finally {
      isLoading(false);
    }
  }
}
