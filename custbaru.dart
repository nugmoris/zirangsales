import 'package:flutter/material.dart';

import 'service.dart';
import 'utils/textisi.dart';

class custbaru extends StatefulWidget {
  final String varpbuser;
  final String varniksales;
  final String varkdsales;
  final String varnmuser;
  final String bagian;
  final String kdcust;
  final String jeniscust;
  final String namacust;
  final String alcust;
  final String kdcamat;
  final String nnmcamat;
  final String tgllahir;
  final String agama;
  final String notlp;
  final String npwp;
  final String nokk;
  final String nikcust;
  final String email;
  final String nmcp;
  final String tlpcp;
  final String ketcust;

  custbaru(
      this.varpbuser,
      this.varniksales,
      this.varkdsales,
      this.varnmuser,
      this.bagian,
      this.kdcust,
      this.jeniscust,
      this.namacust,
      this.alcust,
      this.kdcamat,
      this.nnmcamat,
      this.tgllahir,
      this.agama,
      this.notlp,
      this.npwp,
      this.nokk,
      this.nikcust,
      this.email,
      this.nmcp,
      this.tlpcp,
      this.ketcust);

  @override
  State<custbaru> createState() => _custbaruState();
}

class _custbaruState extends State<custbaru> {
  TextEditingController _kdcust = TextEditingController();
  TextEditingController _nama = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  TextEditingController _kecamatan = TextEditingController();
  TextEditingController _nmkecamatan = TextEditingController();
  TextEditingController _tgllahir = TextEditingController(
      text: DateTime.now().toLocal().toString().split(' ')[0]);
  TextEditingController _notelp = TextEditingController();
  TextEditingController _tlprumah = TextEditingController();
  TextEditingController _jmlklg = TextEditingController();
  TextEditingController _ket = TextEditingController();
  TextEditingController _nik = TextEditingController();
  TextEditingController _nokk = TextEditingController();
  //TextEditingController _agama = TextEditingController();
  TextEditingController _npwp = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _namacp = TextEditingController();
  TextEditingController _tlpcp = TextEditingController();

  String _agama = '';
  String? selectedAgama;
  String _selectedGrup = 'PERORANGAN'; // Inisialisasi dengan 'Perorangan'
  List<String> _grupOptions = [
    'PERORANGAN',
    'PERUSAHAAN',
    'BUMN',
    'PEMERINTAHAN'
  ];

  List<Map<String, dynamic>> agamaData = [];
  //Future<List<Map<String, dynamic>>>? custData;
  List<Map<String, dynamic>> custData = [];

  Future<void> custagama() async {
    try {
      List<Map<String, dynamic>> newData =
          await ApiService.custagama(widget.varpbuser);

      setState(() {
        agamaData = newData;
      });
    } catch (e) {
      print('Error fetching dropdown data: $e');
    }
  }

  void buatcust() async {
    try {
      final List<Map<String, dynamic>> newData = await ApiService.buatcust(
        widget.varpbuser,
        _selectedGrup.trim().toLowerCase(),
        _nama.text.trim(),
        _alamat.text.trim(),
        _kecamatan.text.trim(),
        _tgllahir.text.trim(),
        _nik.text.trim(),
        _npwp.text.trim(),
        _agama.trim(),
        _notelp.text.trim(),
        _email.text.trim(),
        _namacp.text.trim(),
        _tlpcp.text.trim(),
        _nokk.text.trim(),
        _ket.text.trim(),
        _kdcust.text.trim(),
      );

      if (newData != null && newData.isNotEmpty) {
        final result = newData[0];

        if (result.containsKey("Sukses") && result["Sukses"] == "Sukses") {
          final fetchedData = await ApiService.fetchcust(
              widget.varpbuser, 'hbsinput', _nama.text.trim());

          setState(() {
            custData = fetchedData;
          });
          _kdcust.text = '';
          _nama.text = '';
          _selectedGrup = 'perorangan';
          _alamat.text = '';
          _notelp.text = '';
          _tlprumah.text = '';
          _jmlklg.text = '';
          _ket.text = '';
          _kecamatan.text = ' ';
          _tgllahir.text = ' ';
          _nik.text = ' ';
          _npwp.text = ' ';
          // _agama = '-';
          _notelp.text = ' ';
          _email.text = ' ';
          _namacp.text = ' ';
          _tlpcp.text = ' ';
          _nokk.text = ' ';
          _ket.text = ' ';
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                result.entries.first.value.toString(),
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
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

  void _showKecamatanPopup(BuildContext context) async {
    TextEditingController _cariController = TextEditingController();

    try {
      List<Map<String, dynamic>> popupData = await ApiService.kecamatan(
        'awal',
        'xxx',
      );

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          List<Map<String, dynamic>> filteredData =
              []; // Menyimpan hasil pencarian

          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _cariController,
                              decoration: InputDecoration(
                                labelText: 'Cari Kelurahan/Kecamatan',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () async {
                                    filteredData = await ApiService.kecamatan(
                                      'cari',
                                      _cariController.text,
                                    );
                                    setState(
                                        () {}); // Refresh tampilan untuk menampilkan hasil pencarian
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredData.isNotEmpty
                            ? filteredData.length
                            : popupData.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data = filteredData.isNotEmpty
                              ? filteredData[index]
                              : popupData[index];

                          return ListTile(
                            title: Text(data['kode']),
                            subtitle: Text(data['nama']),
                            onTap: () async {
                              setState(() {
                                _kecamatan.text = data['kode'];
                                _nmkecamatan.text = data['nama'];
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    } catch (error) {}
  }

  @override
  void initState() {
    super.initState();
    custagama();
    _nama.text = widget.namacust.trim();
    _kdcust.text = widget.kdcust.trim();
    _selectedGrup = widget.jeniscust.trim().toUpperCase();
    //print(_selectedGrup);
    _alamat.text = widget.alcust.trim();
    _notelp.text = widget.notlp.trim();
    _kecamatan.text = widget.kdcamat.trim();
    _nmkecamatan.text = widget.nnmcamat.trim();
    _tgllahir.text = widget.tgllahir;
    _nik.text = widget.nikcust.trim();
    _npwp.text = widget.npwp.trim();
    selectedAgama = widget.agama.trim();
    _notelp.text = widget.notlp.trim();
    _email.text = widget.email.trim();
    _namacp.text = widget.nmcp.trim();
    _tlpcp.text = widget.tlpcp.trim();
    _nokk.text = widget.nokk.trim();
    _ket.text = widget.ketcust.trim();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Data Customer ' + widget.bagian + ' ' + widget.varnmuser,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _kdcust,
                enabled: false,
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jenis:'),
                      Row(
                        children: _grupOptions.map((grup) {
                          return Row(
                            children: [
                              Radio<String>(
                                value: grup,
                                groupValue: _selectedGrup,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGrup = value!;
                                  });
                                },
                              ),
                              Text(grup),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
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
              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.green[800],
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _showKecamatanPopup(context);
                        },
                      ),
                      SizedBox(
                          width:
                              10), // Spasi antara IconButton dan TextFormField
                      Expanded(
                        child: TextFormField(
                          controller: _kecamatan,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Kode Kelurahan/Kecamatan',
                            hintText: 'Kode Kelurahan/Kecamatan',
                            // contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue.shade700),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: _nmkecamatan,
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 200,
                  child: TextFormField(
                    controller: _tgllahir,
                    decoration: InputDecoration(
                      labelText: 'Tanggal lahir',
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
                              _tgllahir.text = selectedDate
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
              ),
              //  SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Row(
                    children: [
                      Text('Agama:',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10), // Spacer
                      Container(
                        margin: EdgeInsets.all(15),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton<String>(
                          value: selectedAgama, // Set nilai terpilih
                          items: agamaData.map<DropdownMenuItem<String>>(
                              (Map<String, dynamic> agama) {
                            return DropdownMenuItem<String>(
                              value: agama['kode'] as String,
                              child: Text(agama['kode'] as String),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedAgama = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 10),
              TextIsi(
                controller: _notelp,
                hintText: 'No Telepon',
                labeltextku: 'No Telepon',
                obsecuretext: false,
              ),
              SizedBox(height: 10),
              TextIsi(
                controller: _npwp,
                hintText: 'NPWP',
                labeltextku: 'NPWP',
                obsecuretext: false,
              ),
              SizedBox(height: 10),
              TextIsi(
                controller: _nokk,
                hintText: 'No KK',
                labeltextku: 'No KK',
                obsecuretext: false,
              ),
              SizedBox(height: 10),
              TextIsi(
                controller: _nik,
                hintText: 'NIK Customer',
                labeltextku: 'NIK Customer',
                obsecuretext: false,
              ),
              SizedBox(height: 10),
              TextIsi(
                controller: _email,
                hintText: 'Email Customer',
                labeltextku: 'Email Customer',
                obsecuretext: false,
              ),
              SizedBox(height: 10),
              TextIsi(
                controller: _namacp,
                hintText: 'Nama Contact Person',
                labeltextku: 'Nama Contact Person',
                obsecuretext: false,
              ),
              SizedBox(height: 10),
              TextIsi(
                controller: _tlpcp,
                hintText: 'No Tlp Contact Person',
                labeltextku: 'No Tlp Contact Person',
                obsecuretext: false,
              ),
              SizedBox(height: 10),
              TextIsi(
                controller: _ket,
                hintText: 'Keterangan',
                labeltextku: 'Keterangan',
                obsecuretext: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        color: Colors.green[800],
                        icon: Icon(Icons.save),
                        onPressed: () {
                          buatcust();
                        },
                      ),
                      Text('Save',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Colors.green[800], // Gunakan variabel textColor
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        color: Colors.red[800],
                        icon: Icon(Icons.reset_tv),
                        onPressed: () {},
                      ),
                      Text('Reset',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red, // Gunakan variabel textColor
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: SizedBox(width: 30, child: Text('Edit')),
                        //numeric: false,
                      ),
                      DataColumn(
                        label: SizedBox(width: 3, child: Text('SPK')),
                        //numeric: false,
                      ),
                      DataColumn(
                        label: SizedBox(width: 100, child: Text('Nama')),
                        //numeric: false,
                      ),
                      DataColumn(
                          label: SizedBox(width: 100, child: Text('Alamat'))),
                      DataColumn(
                          label: SizedBox(width: 100, child: Text('No Tlp'))),
                      DataColumn(
                          label:
                              SizedBox(width: 100, child: Text('Tgl Lahir'))),
                      DataColumn(
                          label: SizedBox(width: 70, child: Text('NIK'))),
                      DataColumn(
                          label: SizedBox(width: 70, child: Text('NPWP'))),

                      // Tambahkan kolom lain sesuai dengan kebutuhan Anda
                    ],
                    rows:
                        custData.map<DataRow>((Map<String, dynamic> customer) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(IconButton(
                            color: Colors.green[800],
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _kdcust.text = customer['kode'] ?? '';
                              _selectedGrup = customer['jenis'] ?? 'PERORANGAN';
                              _nama.text = customer['nama'] ?? '';
                              _alamat.text = customer['alamat'] ?? '';
                              _kecamatan.text = customer['kdcamat'] ?? '';
                              _tgllahir.text = customer['tgllahir'] ?? '';
                              _nik.text = customer['nik1'] ?? '';
                              _npwp.text = customer['npwp1'] ?? '';
                              _agama = customer['agama1'] ?? '-';
                              _notelp.text = customer['notelp1'] ?? '';
                              _email.text = customer['email1'] ?? '';
                              _namacp.text = customer['nmcp1'] ?? '';
                              _tlpcp.text = customer['tlpcp1'] ?? '';
                              _nokk.text = customer['nokk1'] ?? '';
                              _ket.text = customer['ket1'] ?? '';
                            },
                          )),
                          DataCell(Column(
                            children: [
                              IconButton(
                                color: Colors.blue[800],
                                icon: Icon(Icons.assignment),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/spk',
                                      arguments: [
                                        widget.varpbuser,
                                        widget.varniksales,
                                        widget.varkdsales,
                                        widget.varnmuser,
                                        widget.bagian,
                                        // customer.kode,
                                        // customer.nama
                                      ]);
                                },
                              ),
                            ],
                          )),
                          DataCell(SizedBox(
                              width: 100, child: Text(customer['nama']))),
                          DataCell(SizedBox(
                              width: 100,
                              child: Text(
                                  customer['alamat'] + customer['nmcamat']))),
                          DataCell(SizedBox(
                              width: 100, child: Text(customer['notelp']))),
                          DataCell(SizedBox(
                              width: 100, child: Text(customer['tgllahir']))),
                          DataCell(SizedBox(
                              width: 70, child: Text(customer['nik']))),
                          DataCell(SizedBox(
                              width: 70, child: Text(customer['npwp']))),

                          // Tambahkan sel lain sesuai dengan kolom yang ada
                        ],
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
