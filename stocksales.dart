import 'package:flutter/material.dart';

import 'service.dart';

class TransaksiTable extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  TransaksiTable(this.data);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Type')),
        DataColumn(label: Text('Warna')),
        DataColumn(label: Text('No Rangka')),
        DataColumn(label: Text('No Mesin')),
        DataColumn(label: Text('Lokasi')),
      ],
      rows: data
          .map(
            (item) => DataRow(
              cells: [
                DataCell(Text(item['nmtype'] ?? '-')),
                DataCell(Text(item['nmwarna'] ?? '-')),
                DataCell(Text(item['norangka'] ?? '-')),
                DataCell(Text(item['nomesin'] ?? '-')),
                DataCell(Text(item['nmlokfisik'] ?? '-')),
              ],
              color: item['ldo'] == '2'
                  ? MaterialStateColor.resolveWith(
                      (states) => Color.fromARGB(255, 214, 239, 185))
                  : null,
            ),
          )
          .toList(),
    );
  }
}

class StockSales extends StatefulWidget {
  final String varpbuser;
  final String varniksales;
  final String varkdsales;
  final String varnmuser;
  final String bagian;

  StockSales(this.varpbuser, this.varniksales, this.varkdsales, this.varnmuser,
      this.bagian);

  @override
  State<StockSales> createState() => _StockSalesState();
}

class _StockSalesState extends State<StockSales> {
  List<Map<String, dynamic>> stokData = [];
  List<Map<String, dynamic>> dropdownData = [];
  String varkondisi = 'awal';
  String varjenis = 'fdsfds';
  String _selectedtype = '';

  @override
  void initState() {
    super.initState();
    _fetchDropdownData();
    _selectedtype = ''; // Inisialisasi _selectedtype
    fetchData();
  }

  Future<void> _fetchDropdownData() async {
    try {
      List<Map<String, dynamic>> newData =
          await ApiService.typeready(widget.bagian, widget.varpbuser);

      setState(() {
        dropdownData = newData;
      });
    } catch (e) {
      //print('Error fetching dropdown data: $e');
    }
  }

  void fetchData() async {
    try {
      final data = await ApiService.fetchStok(
          widget.bagian, widget.varpbuser, varkondisi, varjenis);
      setState(() {
        stokData = data;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void fetchStokByType() async {
    try {
      final data = await ApiService.fetchStokByType(
          widget.bagian, widget.varpbuser, _selectedtype);
      setState(() {
        stokData = data;
        print('stok pertype');
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    int jumlah = stokData.length;
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
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: _selectedtype.isEmpty,
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedtype = ''; // Reset _selectedtype
                    });
                    if (value == true) {
                      fetchData(); // Memanggil fetchData saat checkbox dicentang
                    }
                  },
                ),
                Text('Semua'),
                SizedBox(width: 25),
                Text('  Jenis : '),
                DropdownButton<String>(
                  value: _selectedtype.isNotEmpty ? _selectedtype : null,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedtype = newValue ?? '';
                    });
                    fetchStokByType(); // Memanggil fetchStokByType saat dropdown dipilih
                  },
                  items: dropdownData.map((item) {
                    return DropdownMenuItem<String>(
                      value: item['jenis'],
                      child: Text(item['jenis'] ?? '-'),
                    );
                  }).toList(),
                ),
                SizedBox(width: 10),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Jumlah : $jumlah', // Menampilkan jumlah total
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: TransaksiTable(stokData)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
