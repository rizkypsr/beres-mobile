import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ovo_ui/Screen/Home/Component/JemputSampah_services.dart';
//import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner2.dart';
import 'package:ovo_ui/Screen/Home/Component/dropdown_city.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';

class JemputSampah extends StatefulWidget {
  // final String id_user;
  String? nama;
  String? nomor;
  String? alamat;
  String? jenis_sampah;
  String? kecamatan;
  String? Tipe;

  JemputSampah(
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

class _JemputSampah extends State<JemputSampah> {
  int run = 0;
  bool _validate = false;
  int selected_id_kc = 0;
  TextEditingController Namacontroller = new TextEditingController();
  TextEditingController Telpcontroller = new TextEditingController();
  TextEditingController Alamatcontroller = new TextEditingController();
  TextEditingController Jeniscontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Layanan Sedekah Sampah"),
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
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Layanan Sedekah Sampah',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 50),
                      buildName(),
                      SizedBox(
                        height: 10,
                      ),
                      buildPhone(),
                      SizedBox(
                        height: 10,
                      ),
                      buildAddress(),
                      SizedBox(
                        height: 10,
                      ),
                      buildJenisSampah(),
                      SizedBox(height: 10),
                      Text("Kota/Kecamatan",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 7),
                      dropdown(onChange: (id) {
                        selected_id_kc = id;
                      }),
                      buildSentBtn(),
                      // Container(
                      //   height: 20,
                      //   child: Row(
                      //     children: <Widget>[
                      //       Theme(
                      //           data: ThemeData(unselectedWidgetColor: Colors.white),
                      //           // child: Checkbox(
                      //           //   value: isRememberMe,
                      //           //   checkColor: Colors.blue,
                      //           //   activeColor: Colors.white,
                      //           //   onChanged: (value) {
                      //           //     setState(() {
                      //           //       isRememberMe = value;
                      //           //     });
                      //           //   },
                      //           // )
                      //           ),
                      //       Text(
                      //         'Remember Me',
                      //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      //  buildLoginBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nama',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: Namacontroller,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                errorText: _validate ? 'Kolom tidak boleh kosong' : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.account_circle_rounded,
                    color: Color(0xFF0e8e83)),
                hintText: 'Nama',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'No.Telp',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: Telpcontroller,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                errorText: _validate ? 'Kolom tidak boleh kosong' : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.phone_android, color: Color(0xFF0e8e83)),
                hintText: 'No.telp',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Alamat',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: Alamatcontroller,
            keyboardType: TextInputType.streetAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                errorText: _validate ? 'Kolom tidak boleh kosong' : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.location_city, color: Color(0xFF0e8e83)),
                hintText: 'Alamat',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildJenisSampah() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Jenis Sampah',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: Jeniscontroller,
            keyboardType: TextInputType.streetAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                errorText: _validate ? 'Kolom tidak boleh kosong' : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon:
                    Icon(Icons.restore_from_trash, color: Color(0xFF0e8e83)),
                hintText: 'Jenis Sampah',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildSentBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          setState(() {
            Namacontroller.text.isEmpty
                ? _validate = true
                : Telpcontroller.text.isEmpty
                    ? _validate = true
                    : Alamatcontroller.text.isEmpty
                        ? _validate = true
                        : Jeniscontroller.text.isEmpty
                            ? _validate = true
                            : run = 1;
          });
          if (run == 1) {
            var response = await JemputSampahservices.jemputsampahjs(
                Namacontroller.text,
                Telpcontroller.text,
                Alamatcontroller.text,
                Jeniscontroller.text,
                selected_id_kc);
            //var response = await JemputSampahservices.jemputsampahjs(widget.id_user,widget.nama,widget.nomor,widget.alamat, controller.text);
            if (response['status'] == 'success') {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SuccessPage(
                    // Tipe: 'Jemput Sampah',
                    // id_user: widget.id_user,
                    // nama: Namacontroller.text,
                    // nomor: Telpcontroller.text,
                    // Alamat: Alamatcontroller.text,
                    // Jenis_Sampah: Jeniscontroller.text,
                    // kecamatan: selected_id_kc,
                    );
              }));
            }
          } else {
            Fluttertoast.showToast(
                msg: "Kolom tidak boleh kosong",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER);
          }
          //JemputSampahservices();
        },
        child: Text("Kirim"),
      ),
    );
  }
}

// Widget buildPassword() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         'Password',
//         style: TextStyle(
//             color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//       ),
//       SizedBox(height: 10),
//       Container(
//         alignment: Alignment.centerLeft,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
//             ]),
//         height: 60,
//         child: TextField(
//           obscureText: true,
//           style: TextStyle(color: Colors.black87),
//           decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14),
//               prefixIcon: Icon(Icons.lock, color: Color(0xff2890c8)),
//               hintText: 'Password',
//               hintStyle: TextStyle(color: Colors.black38)),
//         ),
//       )
//     ],
//   );
// }
// }
