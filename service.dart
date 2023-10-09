import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const root = "http://192.168.110.112/api";
  //static const root = "http://192.168.100.14/api";
  //static const root = "http://zirang.ddns.net:81/nug/api";
  //static const root = "http://localhost/api";

  static const _LOGIN_ACTION = "LOGIN";

  static Future<dynamic> login(String username, String password) async {
    final url = root +
        '/api.php?action=$_LOGIN_ACTION&username1=$username&password1=$password';
    //print(url);
    final response = await http.get(Uri.parse(url));
    //print(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final bagian = jsonResponse['bagian'];
      final varpbuser = jsonResponse['userku'];
      final varniksales = jsonResponse['niksales'];
      final varkdsales = jsonResponse['kdsales'];
      final varnmuser = jsonResponse['nama'];

      return jsonResponse;
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<String> gantiPassword(
      String varpbuser, String oldPassword, String newPassword) async {
    final url =
        '$root/api.php?action=GANTIPWD&pbuser1=$varpbuser&passlama=$oldPassword&passbaru=$newPassword';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final hasil = jsonResponse[0]['@hasil'];

      if (hasil == 'Gagal, password lama salah') {
        return 'Password Lama Anda Salah';
      } else if (hasil == 'Sukses') {
        return 'Ganti Password Berhasil';
      }
    }

    return 'Terjadi kesalahan';
  }

  static Future<List<Map<String, dynamic>>> typeready(
      String varbagian, String varpbuser) async {
    final url = '$root/api.php?action=typeready';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchStok(String varbagian,
      String varpbuser, String varkondisi, String varjenis) async {
    final url =
        '$root/api.php?action=STOKSALES&pbuser1=$varpbuser&bagian1=$varbagian&kondisi1=$varkondisi&jenis1=$varjenis';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> jmlspk(String varpbuser) async {
    final url = '$root/api.php?action=jmlspk&pbuser1=$varpbuser';
    final response = await http.get(Uri.parse(url));
    // print(url);

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchStokByType(
      String varbagian, String varpbuser, String selectedType) async {
    String varkondisi = 'cari';
    final url =
        '$root/api.php?action=STOKSALES&pbuser1=$varpbuser&bagian1=$varbagian&kondisi1=$varkondisi&jenis1=$selectedType';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> acttype(String varpbuser) async {
    final url = '$root/api.php?action=actjenis';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> actsumberdata(
      String varpbuser) async {
    final url = '$root/api.php?action=Actsumbdata';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> actpekerjaan(
      String varpbuser) async {
    final url = '$root/api.php?action=Actpekerjaan';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> actbaru(
      String varpbuser,
      String nmcust1,
      String alcust1,
      String notlp1,
      String typeact,
      String sumberact,
      String notlprumah,
      String pekerjaanku,
      String penghasilan1,
      String jmlklg,
      String ket1,
      String tglact) async {
    final url =
        '$root/api.php?action=Actbuat&pbuser1=$varpbuser&nama1=$nmcust1&alamat1=$alcust1&notelp1=$notlp1&type1=$typeact&sumber1=$sumberact&notlprumah1=$notlprumah&pekerjaan1=$pekerjaanku&penghasilan1=$penghasilan1&jmlklg1=$jmlklg&ket1=$ket1&tgl1=$tglact';
    final response = await http.get(Uri.parse(url));
    //print(url);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> actawal(
    String varpbuser,
  ) async {
    final url = '$root/api.php?action=Actawal&pbuser1=$varpbuser';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> actupdate(
      String varpbuser,
      String varnotrans,
      String varketsales,
      String varketspv,
      String varurut,
      String varstatusact) async {
    //final url = '$root/api.php?action=Actawal&pbuser1=$varpbuser';
    final url =
        '$root/api.php?action=actupdated&pbuser1=$varpbuser&notrans1=$varnotrans&ketsales1=$varketsales&ketspv1=$varketspv&urut1=$varurut&statusact1=$varstatusact';
    //print(url);
    final response = await http.get(Uri.parse(url));
    //print(response);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> actpenghasilan(
      String varpbuser) async {
    final url = '$root/api.php?action=Actpenghasilan';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchcust(
      String varpbuser, String varkeadaan1, String tcari1) async {
    final url =
        '$root/api.php?action=customerbrowse&pbuser1=$varpbuser&keadaan1=$varkeadaan1&tcari1=$tcari1';
    //print(url);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> buatcust(
    String varpbuser,
    String jenis1,
    String nama1,
    String alamat,
    String kdcamat,
    String tgllahir,
    String nik1,
    String npwp1,
    String agama1,
    String notelp1,
    String email1,
    String nmcp1,
    String tlpcp1,
    String nokk1,
    String ket1,
    String kdedit,
  ) async {
    final url =
        '$root/api.php?action=buatcust&pbuser=$varpbuser&jenis1=$jenis1&nama1=$nama1&alamat=$alamat&kdcamat=$kdcamat&tgllahir=$tgllahir&nik1=$nik1&npwp1=$npwp1&agama1=$agama1&notelp1=$notelp1&email1=$email1&nmcp1=$nmcp1&tlpcp1=$tlpcp1&nokk1=$nokk1&ket1=$ket1&kdedit=$kdedit';
    //print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> custagama(String varpbuser) async {
    final url = '$root/api.php?action=custagama';
    // print(url);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchbuatspk(
      String varpbuser, String varkondisi, String tcari1) async {
    final url =
        '$root/api.php?action=carinospk&pbuser1=$varpbuser&kondisi1=$varkondisi&tcari1=$tcari1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }

  static Future<List<Map<String, dynamic>>> kecamatan(
      String varkeadaan1, String tcari1) async {
    final url =
        '$root/api.php?action=kecamatan&keadaan1=$varkeadaan1&tcari1=$tcari1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body == "error") {
        return [];
      } else {
        if (jsonDecode(response.body) == 'error') {
          return [];
        } else {
          return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        }
      }
    } else {
      throw Exception('Failed to retrieve data from the API');
    }
  }
}

class Jenis {
  final String kdjenis;
  final String nama;
  Jenis({required this.kdjenis, required this.nama});
}

class Transaksi {
  final String notrans;
  final String kodesrv;
  final String kdjenis;
  final String npasang;
  final String nrp;
  final String waktu;
  final String lvalid;
  final String lcetak;

  Transaksi({
    required this.notrans,
    required this.kodesrv,
    required this.kdjenis,
    required this.npasang,
    required this.nrp,
    required this.waktu,
    required this.lvalid,
    required this.lcetak,
  });
}
