import 'package:flutter/material.dart';

import 'service.dart';

class customersales extends StatefulWidget {
  final String varpbuser;
  final String varniksales;
  final String varkdsales;
  final String varnmuser;
  final String bagian;

  customersales(this.varpbuser, this.varniksales, this.varkdsales,
      this.varnmuser, this.bagian);
  @override
  State<customersales> createState() => _customersalesState();
}

class Customer {
  final String kode;
  final String nama;
  final String alamat;
  final String nmcamat;
  final String jenis;
  final String nik;
  final String kota;
  final String npwp;
  final String notelp;
  final String kdcamat;
  final String tgllahir;
  final String agama;
  final String nokk;
  final String email;
  final String nmcp;
  final String tlpcp;
  final String ketcust;
  final String blhedit;

  Customer({
    required this.kode,
    required this.nama,
    required this.alamat,
    required this.nmcamat,
    required this.jenis,
    required this.nik,
    required this.kota,
    required this.npwp,
    required this.notelp,
    required this.kdcamat,
    required this.tgllahir,
    required this.agama,
    required this.nokk,
    required this.email,
    required this.nmcp,
    required this.tlpcp,
    required this.ketcust,
    required this.blhedit,
  });
}

class _customersalesState extends State<customersales> {
  String txtcari = "";
  List<Customer> customers = []; // List untuk menyimpan data pelanggan

  @override
  void initState() {
    super.initState();
    fetchData(widget.varpbuser, 'salesawal',
        ''); // Ambil data pelanggan ketika widget diinisialisasi
  }

  // Ambil data pelanggan menggunakan API Anda
  Future<void> fetchData(
      String varpbuser, String varkeadaan1, String tcari1) async {
    try {
      final response = await ApiService.fetchcust(
        varpbuser,
        varkeadaan1,
        tcari1,
      );

      setState(() {
        customers = response
            .map((json) => Customer(
                  kode: json['kode'] ?? '',
                  nama: json['nama'] ?? '',
                  alamat: json['alamat'] ?? '',
                  nmcamat: json['nmcamat'] ?? '',
                  kota: json['Kota'] ?? '',
                  jenis: json['jenis'] ?? '',
                  nik: json['nik'] ?? '',
                  npwp: json['npwp'] ?? '',
                  notelp: json['notelp'] ?? '',
                  kdcamat: json['kdkecamatan'] ?? '',
                  tgllahir: json['tgllahir'] ?? '',
                  agama: json['agama'] ?? '',
                  nokk: json['nokk'] ?? '',
                  email: json['email'] ?? '',
                  nmcp: json['nmcp'] ?? '',
                  tlpcp: json['tlpcp'] ?? '',
                  ketcust: json['kdet'] ?? '',
                  blhedit: json['lbolehedit'] ?? '',
                ))
            .toList();
      });
    } catch (e) {
      // Tangani kesalahan
      print('Kesalahan mengambil data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.cable), label: "Cable"),
        ],
        onTap: (int index) {
          if (index == 0) {
            if (widget.bagian == 'sales') {
              Navigator.pushReplacementNamed(context, '/homesales', arguments: [
                widget.varpbuser,
                widget.varniksales,
                widget.varkdsales,
                widget.varnmuser,
                widget.bagian
              ]);
            } else if (widget.bagian == 'kacab') {
              Navigator.pushReplacementNamed(context, '/homekacab', arguments: [
                widget.varpbuser,
                widget.varniksales,
                widget.varkdsales,
                widget.varnmuser
              ]);
            } else if (widget.bagian == 'spv') {
              Navigator.pushReplacementNamed(context, '/homespv', arguments: [
                widget.varpbuser,
                widget.varniksales,
                widget.varkdsales,
                widget.varnmuser
              ]);
            }
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/homesales', arguments: [
              widget.varpbuser,
              widget.varniksales,
              widget.varkdsales,
              widget.varnmuser,
              widget.bagian
            ]);
            // Aksi untuk item "Profile"
            // Tambahkan kode yang ingin Anda jalankan di sini
          } else if (index == 2) {
            // Aksi untuk item "Cable"
            // Tambahkan kode yang ingin Anda jalankan di sini
          }
        },
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          color: Colors.grey[800],
                          icon: Icon(Icons.home),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          "Hallo Sales " + widget.varnmuser,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      color: Colors.grey[800],
                      icon: Icon(Icons.notifications),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Daftar Customer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          txtcari =
                              value; // Menyimpan nilai teks setiap kali berubah
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Cari Customer',
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Saat tombol "Cari" ditekan
                    fetchData(widget.varpbuser, 'salescari', txtcari);
                  },
                  child: Text('Cari'),
                ),
              ],
            ),
            IconButton(
              color: Colors.red[800],
              icon: Icon(Icons.add),
              onPressed: () {
                //untuk buka form customer baru
                Navigator.pushReplacementNamed(context, '/custbaru',
                    arguments: [
                      widget.varpbuser,
                      widget.varniksales,
                      widget.varkdsales,
                      widget.varnmuser,
                      widget.bagian,
                      'hsdffhfds',
                      'Perorangan',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '-',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                    ]);
              },
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Edit')),
                    DataColumn(label: Text('SPK')),
                    DataColumn(label: Text('Nama')),
                    DataColumn(label: Text('Alamat')),
                    DataColumn(label: Text('Kel/Kec')),
                    DataColumn(label: Text('Kota/Kab')),
                    DataColumn(label: Text('Jenis Cust')),
                    DataColumn(label: Text('NIK')),
                    DataColumn(label: Text('NPWP')),
                    DataColumn(label: Text('No Telp')),
                  ],
                  rows: customers.map((customer) {
                    return DataRow(cells: [
                      DataCell(ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 50),
                        child: IconButton(
                          color: Colors.blue[900],
                          icon: Icon(Icons.edit),
                          onPressed: customer.blhedit == '1'
                              ? () {
                                  Navigator.pushReplacementNamed(
                                      context, '/custbaru',
                                      arguments: [
                                        widget.varpbuser,
                                        widget.varniksales,
                                        widget.varkdsales,
                                        widget.varnmuser,
                                        widget.bagian,
                                        customer.kode,
                                        customer.jenis,
                                        customer.nama,
                                        customer.alamat,
                                        customer.kdcamat,
                                        customer.nmcamat,
                                        customer.tgllahir,
                                        customer.agama,
                                        customer.notelp,
                                        customer.npwp,
                                        customer.nokk,
                                        customer.nik,
                                        customer.email,
                                        customer.nmcp,
                                        customer.tlpcp,
                                        customer.ketcust
                                      ]);
                                }
                              : null,
                        ),
                      )),
                      DataCell(ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 50),
                        child: IconButton(
                          color: Colors.green[800],
                          icon: Icon(Icons.assignment),
                          onPressed: () {
                            //nmcust!, alamat!,kdcamat!,nmcamat!,notlp!,email!,nmcp!, tlpcp!
                            Navigator.pushReplacementNamed(context, '/spk',
                                arguments: [
                                  widget.varpbuser,
                                  widget.varniksales,
                                  widget.varkdsales,
                                  widget.varnmuser,
                                  widget.bagian,
                                  customer.kode,
                                  customer.nama,
                                  customer.alamat,
                                  customer.kdcamat,
                                  customer.nmcamat,
                                  customer.notelp,
                                  customer.email,
                                  customer.nmcp,
                                  customer.tlpcp,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                ]);
                          },
                        ),
                      )),
                      DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 150),
                          child: Text(customer.nama))),
                      DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 150),
                          child: Text(customer.alamat))),
                      DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 150),
                          child: Text(customer.nmcamat))),
                      DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 100),
                          child: Text(customer.kota))),
                      DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 80),
                          child: Text(customer.jenis))),
                      DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 100),
                          child: Text(customer.nik))),
                      DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 100),
                          child: Text(customer.npwp))),
                      DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 100),
                          child: Text(customer.notelp))),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        )),
      )),
    );
  }
}
