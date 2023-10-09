import 'package:flutter/material.dart';

import 'service.dart';
import 'utils/textisi.dart';

class ActivitySls extends StatefulWidget {
  final String varpbuser;
  final String varniksales;
  final String varkdsales;
  final String varnmuser;
  final String bagian;

  ActivitySls(this.varpbuser, this.varniksales, this.varkdsales, this.varnmuser,
      this.bagian);

  @override
  State<ActivitySls> createState() => _ActivitySlsState();
}

class _ActivitySlsState extends State<ActivitySls> {
  TextEditingController _ketsalesController = TextEditingController();

  TextEditingController _noact = TextEditingController();
  TextEditingController _dateController = TextEditingController(
      text: DateTime.now().toLocal().toString().split(' ')[0]);
  TextEditingController _nama = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  TextEditingController _notelp = TextEditingController();
  TextEditingController _tlprumah = TextEditingController();
  TextEditingController _jmlklg = TextEditingController();
  TextEditingController _ket = TextEditingController();

  String _selectedOccupation = '';
  String _selectedIncome = '';
  String _selectedDataSource = '';
  String _selectedVehicleType = '';

  List<Map<String, dynamic>> typeData = [];
  List<Map<String, dynamic>> sumberData = [];
  List<Map<String, dynamic>> pekerjaanData = [];
  List<Map<String, dynamic>> penghasilanData = [];
  List<Map<String, dynamic>> actData = [];

  Future<List<Map<String, dynamic>>>? actawalData;

  @override
  void initState() {
    super.initState();
    actpekerjaan();
    actpenghasilan();
    actsumberdata();
    acttype();
    actawalData = ApiService.actawal(widget.varpbuser);
  }

  void simpanact() async {
    try {
      final List<Map<String, dynamic>> newData = await ApiService.actbaru(
        widget.varpbuser,
        _nama.text,
        _alamat.text,
        _notelp.text,
        _selectedVehicleType,
        _selectedDataSource,
        _tlprumah.text,
        _selectedOccupation,
        _selectedIncome,
        _jmlklg.text,
        _ket.text,
        _dateController.text,
      );

      if (newData != null && newData.isNotEmpty) {
        final result = newData[0];

        if (result.containsKey("Sukses") && result["Sukses"] == "Sukses") {
          actawalData = ApiService.actawal(widget.varpbuser);
          setState(() {
            actData = newData;
          });
          _nama.text = '';
          _alamat.text = '';
          _notelp.text = '';
          _tlprumah.text = '';
          _jmlklg.text = '';
          _ket.text = '';
          _dateController.text =
              DateTime.now().toLocal().toString().split(' ')[0];
          _selectedOccupation = '';
          _selectedIncome = '';
          _selectedVehicleType = '';
          _selectedDataSource = '';
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                result.entries.first.value.toString(),
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }
      } else {
        print('Invalid or empty response from API.');
      }
    } catch (e) {
      print('Error fetching data from API: $e');
    }
  }

  Future<void> acttype() async {
    try {
      List<Map<String, dynamic>> newData =
          await ApiService.acttype(widget.varpbuser);

      setState(() {
        typeData = newData;
      });
    } catch (e) {
      print('Error fetching dropdown data: $e');
    }
  }

  Future<void> actsumberdata() async {
    try {
      List<Map<String, dynamic>> newData =
          await ApiService.actsumberdata(widget.varpbuser);

      setState(() {
        sumberData = newData;
      });
    } catch (e) {
      print('Error fetching dropdown data: $e');
    }
  }

  Future<void> actpekerjaan() async {
    try {
      List<Map<String, dynamic>> newData =
          await ApiService.actpekerjaan(widget.varpbuser);

      setState(() {
        pekerjaanData = newData;
      });
    } catch (e) {
      print('Error fetching dropdown data: $e');
    }
  }

  Future<void> actpenghasilan() async {
    try {
      List<Map<String, dynamic>> newData =
          await ApiService.actpenghasilan(widget.varpbuser);

      setState(() {
        penghasilanData = newData;
      });
    } catch (e) {
      print('Error fetching dropdown data: $e');
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
                                Navigator.pushReplacementNamed(
                                    context, '/homesales',
                                    arguments: [
                                      widget.varpbuser,
                                      widget.varniksales,
                                      widget.varkdsales,
                                      widget.varnmuser,
                                      widget.bagian
                                    ]);
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
                TextFormField(
                  controller: _noact,
                  decoration: InputDecoration(
                    labelText: 'Activity',
                    enabled: false,
                  ),
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'Tanggal',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          final DateTime currentDate = DateTime.now();
                          final DateTime sevenDaysLater =
                              currentDate.add(Duration(days: 7));

                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (selectedDate != null &&
                              selectedDate != DateTime.now()) {
                            setState(() {
                              _dateController.text = selectedDate
                                  .toLocal()
                                  .toString()
                                  .split(' ')[0];
                            });
                          }
                        },
                        icon: Icon(Icons.calendar_today),
                      ),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Tanggal tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                TextIsi(
                  controller: _nama,
                  hintText: 'Nama Customer',
                  labeltextku: 'Nama Customer',
                  obsecuretext: false,
                ),
                SizedBox(height: 10),
                TextIsi(
                  controller: _alamat,
                  hintText: 'Alamat Customer',
                  labeltextku: 'Alamat Customer',
                  obsecuretext: false,
                ),
                SizedBox(height: 10),
                TextIsi(
                  controller: _notelp,
                  hintText: 'No Tlp / HP',
                  labeltextku: 'No Tlp / HP',
                  obsecuretext: false,
                ),
                SizedBox(height: 10),
                TextIsi(
                  controller: _tlprumah,
                  hintText: 'No tlp Rumah',
                  labeltextku: 'No tlp Rumah',
                  obsecuretext: false,
                ),
                SizedBox(height: 10),
                TextIsi(
                  controller: _jmlklg,
                  hintText: 'Jumlah Anggota Keluarga',
                  labeltextku: 'Jumlah Anggota Keluarga',
                  obsecuretext: false,
                ),
                SizedBox(height: 10),
                TextIsi(
                  controller: _ket,
                  hintText: 'Keterangan',
                  labeltextku: 'Keterangan',
                  obsecuretext: false,
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Pekerjaan :', // Label teks di sini
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(25),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedOccupation.isNotEmpty
                            ? _selectedOccupation
                            : null,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedOccupation = newValue ?? '';
                          });
                          actpekerjaan();
                        },
                        icon: Icon(Icons.arrow_drop_down,
                            color: Colors.blueAccent),
                        isExpanded: true,
                        underline: SizedBox(),
                        items: pekerjaanData.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['kode'],
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: Text(
                                item['nama'] ?? '-',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Text(
                      ' Penghasilan :', // Label teks di sini
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(25),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        value:
                            _selectedIncome.isNotEmpty ? _selectedIncome : null,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedIncome = newValue ?? '';
                          });
                          actpenghasilan();
                        },
                        icon: Icon(Icons.arrow_drop_down,
                            color: Colors.blueAccent),
                        isExpanded: true,
                        underline: SizedBox(),
                        items: penghasilanData.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['penghasilan'],
                            child: Text(item['penghasilan'] ?? '-'),
                          );
                        }).toList(),
                      ),
                    ),
                    Text(
                      ' Type Kendaraan :', // Label teks di sini
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(25),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedVehicleType.isNotEmpty
                            ? _selectedVehicleType
                            : null,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedVehicleType = newValue ?? '';
                          });
                          acttype();
                        },
                        icon: Icon(Icons.arrow_drop_down,
                            color: Colors.blueAccent),
                        isExpanded: true,
                        underline: SizedBox(),
                        items: typeData.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['kode'],
                            child: Text(item['nama'] ?? '-'),
                          );
                        }).toList(),
                      ),
                    ),
                    Text(
                      ' Sumber Data :', // Label teks di sini
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(25),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedDataSource.isNotEmpty
                            ? _selectedDataSource
                            : null,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedDataSource = newValue ?? '';
                          });
                          actsumberdata();
                        },
                        icon: Icon(Icons.arrow_drop_down,
                            color: Colors.blueAccent),
                        isExpanded: true,
                        underline: SizedBox(),
                        items: sumberData.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['kode'],
                            child: Text(item['nama'] ?? '-'),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    simpanact();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 86, 196, 247)),
                  ),
                  child: Text(
                    'Simpan Cust Activity Baru',
                    style: TextStyle(
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: actawalData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Terjadi kesalahan: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('Data tidak ditemukan.');
                    } else {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text(
                                'Tanggal',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(label: Text('Alamat')),
                            DataColumn(label: Text('No Telp')),
                            DataColumn(label: Text('Ket Sales')),
                            DataColumn(
                              label: Text('Aksi',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DataColumn(label: Text('Ket SPV')),
                          ],
                          rows: snapshot.data!.map((data) {
                            return DataRow(
                              key: ValueKey(data['urut']),
                              cells: [
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 250),
                                    child: Text(
                                        data['tgl']?.split(' ')[0] ?? '-',
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 150),
                                    child: Text(data['nama'] ?? '-',
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 150),
                                    child: Text(data['alamat'] ?? '-',
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 150),
                                    child: Text(data['notelp'] ?? '-',
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 250),
                                    child: TextFormField(
                                      controller: TextEditingController(
                                          text: data['ketsales'] ?? ''),
                                      onChanged: (newValue) {
                                        data['ketsales'] =
                                            newValue; // Memperbarui nilai di dalam data Anda saat pengguna mengubah teks
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(InkWell(
                                  onTap: () async {
                                    final newValue = data['ketsales'] ?? '';
                                    final urut = data['urut'] ?? '';
                                    final statusact = data['statusact'] ?? '';

                                    final result = await ApiService.actupdate(
                                      widget.varpbuser,
                                      data['notrans']?.trim() ?? '',
                                      newValue,
                                      data['ketspv']?.trim() ?? '',
                                      urut,
                                      statusact,
                                    );

                                    if (result.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Gagal menyimpan perubahan.'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Berhasil menyimpan perubahan.'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      setState(() {
                                        data['ketsales'] = newValue;
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .green, // Warna latar belakang hijau
                                      borderRadius: BorderRadius.circular(
                                          5.0), // Ubah sesuai kebutuhan
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons
                                              .task_alt, // Ganti dengan ikon task_alt
                                          color:
                                              Colors.white, // Warna ikon putih
                                        ),
                                        SizedBox(
                                            width:
                                                5.0), // Jarak antara ikon dan teks
                                        Text(
                                          'Update', // Teks pada tombol
                                          style: TextStyle(
                                            color: Colors
                                                .white, // Warna teks putih
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 250),
                                    child: Text(data['ketspv'] ?? '-',
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
