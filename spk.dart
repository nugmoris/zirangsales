import 'package:flutter/material.dart';
import 'package:zirangsales/utils/textisi.dart';

import 'service.dart';

class spk extends StatefulWidget {
  final String varpbuser;
  final String varniksales;
  final String varkdsales;
  final String varnmuser;
  final String bagian;
  final String kdcust;
  final String nmcust;
  final String alamat;
  final String kdcamat;
  final String nmcamat;
  final String notlp;
  final String email;
  final String nmcp;
  final String tlpcp;
  final String nospk;
  final String kdleasing;
  final String nmleasing;
  final String kdlokasi;
  final String tglspk;
  final String kdwarna;
  final String nmwarna;
  final String kdtype;
  final String nmtype;

  spk(
      this.varpbuser,
      this.varniksales,
      this.varkdsales,
      this.varnmuser,
      this.bagian,
      this.kdcust,
      this.nmcust,
      this.alamat,
      this.kdcamat,
      this.nmcamat,
      this.notlp,
      this.email,
      this.nmcp,
      this.tlpcp,
      this.nospk,
      this.kdleasing,
      this.nmleasing,
      this.kdlokasi,
      this.tglspk,
      this.kdwarna,
      this.nmwarna,
      this.kdtype,
      this.nmtype);
  @override
  State<spk> createState() => _spkState();
}

class _spkState extends State<spk> {
  TextEditingController _kdcust = TextEditingController();
  TextEditingController _nmcust = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  TextEditingController _kecamatan = TextEditingController();
  TextEditingController _notelp = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _nmcp = TextEditingController();
  TextEditingController _tlpcp = TextEditingController();
  TextEditingController _kdtype = TextEditingController();
  TextEditingController _nmtype = TextEditingController();
  TextEditingController _kdwarna = TextEditingController();
  TextEditingController _nmwarna = TextEditingController();
  TextEditingController _kdleasing = TextEditingController();
  TextEditingController _nmleasing = TextEditingController();
  TextEditingController _kdsales = TextEditingController();
  TextEditingController _nmsales = TextEditingController();
  TextEditingController _nospk = TextEditingController();
  TextEditingController _tglspk = TextEditingController();
  TextEditingController _kdlokasi = TextEditingController();

  void _typePopup(BuildContext context) async {
    TextEditingController _cariController = TextEditingController();

    try {
      List<Map<String, dynamic>> popupData = await ApiService.fetchbuatspk(
        widget.varpbuser,
        'caritypeawal',
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
                                labelText: 'Cari Type',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () async {
                                    filteredData =
                                        await ApiService.fetchbuatspk(
                                      widget.varpbuser,
                                      'caritypespk',
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
                                _kdtype.text = data['kode'];
                                _nmtype.text = data['nama'];
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

  void _warnaPopup(BuildContext context) async {
    TextEditingController _cariController = TextEditingController();

    try {
      List<Map<String, dynamic>> popupData = await ApiService.fetchbuatspk(
        widget.varpbuser,
        'cariwarnaawal',
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
                                labelText: 'Cari Warna',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () async {
                                    filteredData =
                                        await ApiService.fetchbuatspk(
                                      widget.varpbuser,
                                      'cariwarnaspk',
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
                                _kdwarna.text = data['kode'];
                                _nmwarna.text = data['nama'];
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

  void _nospkPopup(BuildContext context) async {
    TextEditingController _cariController = TextEditingController();

    try {
      List<Map<String, dynamic>> popupData = await ApiService.fetchbuatspk(
        widget.varpbuser,
        'carinospkawal',
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
                                labelText: 'Cari No SPK',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () async {
                                    filteredData =
                                        await ApiService.fetchbuatspk(
                                      widget.varpbuser,
                                      'carinospk',
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
                            title: Text(data['nospk']),
                            subtitle: Text(data['nospk']),
                            onTap: () async {
                              setState(() {
                                _nospk.text = data['nospk'];
                                // _nmwarna.text = data['nama'];
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

  void _leasingPopup(BuildContext context) async {
    TextEditingController _cariController = TextEditingController();

    try {
      List<Map<String, dynamic>> popupData = await ApiService.fetchbuatspk(
        widget.varpbuser,
        'carileasingawal',
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
                                labelText: 'Cari Leasing',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () async {
                                    filteredData =
                                        await ApiService.fetchbuatspk(
                                      widget.varpbuser,
                                      'carileasingspk',
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
                                _kdleasing.text = data['kode'];
                                _nmleasing.text = data['nama'];
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

  void initState() {
    super.initState();
    _nmcust.text = widget.nmcust.trim();
    _alamat.text = widget.alamat.trim() + widget.nmcamat.trim();
    _kecamatan.text = widget.alamat.trim();
    _notelp.text = widget.notlp.trim();
    _nmcp.text = widget.nmcp.trim();
    _tlpcp.text = widget.tlpcp.trim();
    _email.text = widget.email.trim();
    _kdsales.text = widget.varkdsales.trim();
    _nmsales.text = widget.varnmuser;
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.varnmuser,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('SPK',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //  SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 430,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white10,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          color: Colors.green[800],
                          icon: Icon(Icons.search),
                          onPressed: () {
                            _nospkPopup(context);
                          },
                        ),
                        Container(
                          width: 200.0, // Atur lebar Container sesuai kebutuhan
                          child: TextFormField(
                            controller: _nospk,
                            decoration: InputDecoration(
                              hintText: 'No SPK',
                              // labelText: 'Kode Type Kendaraan',
                            ),
                          ),
                        )
                      ],
                    ),
                    TextIsi(
                        controller: _tglspk,
                        hintText: 'TGL SPK',
                        labeltextku: 'TGL SPK',
                        obsecuretext: false),
                    TextIsi(
                        controller: _kdsales,
                        hintText: 'Kode Sales',
                        labeltextku: 'Kode Sales',
                        obsecuretext: false),
                    TextIsi(
                        controller: _nmsales,
                        hintText: 'Sales',
                        labeltextku: 'Sales',
                        obsecuretext: false),
                    TextIsi(
                        controller: _kdlokasi,
                        hintText: 'Lokasi',
                        labeltextku: 'Lokasi',
                        obsecuretext: false),
                    Row(
                      children: [
                        IconButton(
                          color: Colors.green[800],
                          icon: Icon(Icons.search),
                          onPressed: () {
                            _leasingPopup(context);
                          },
                        ),
                        Container(
                          width: 200.0, // Atur lebar Container sesuai kebutuhan
                          child: TextFormField(
                            controller: _kdleasing,
                            decoration: InputDecoration(
                              hintText: 'Kode Leasing',
                              // labelText: 'Kode Type Kendaraan',
                            ),
                          ),
                        )
                      ],
                    ),
                    TextIsi(
                        controller: _nmleasing,
                        hintText: 'Leasing',
                        labeltextku: 'Leasing',
                        obsecuretext: false),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 430,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue[50],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    TextIsi(
                        controller: _kdcust,
                        hintText: 'Kode Customer',
                        labeltextku: 'Kode Customer',
                        obsecuretext: false),
                    TextIsi(
                        controller: _nmcust,
                        hintText: 'Customer',
                        labeltextku: 'Customer',
                        obsecuretext: false),
                    TextIsi(
                        controller: _alamat,
                        hintText: 'Alamat',
                        labeltextku: 'Alamat',
                        obsecuretext: false),
                    TextIsi(
                        controller: _notelp,
                        hintText: 'No Tlp',
                        labeltextku: 'No Tlp',
                        obsecuretext: false),
                    TextIsi(
                        controller: _email,
                        hintText: 'Alamat Email',
                        labeltextku: 'Alamat Email',
                        obsecuretext: false),
                    TextIsi(
                        controller: _nmcp,
                        hintText: 'Contact Person',
                        labeltextku: 'Contact Person',
                        obsecuretext: false),
                    TextIsi(
                        controller: _tlpcp,
                        hintText: 'No Tlp Contact Person',
                        labeltextku: 'No Tlp Contact Person',
                        obsecuretext: false),
                  ],
                ),
              ),
            ),
            // TextField(widget.kdcust),
            // TextField(widget.nmcust),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue[200],
                ),
                child: Column(
                  children: [
                    // SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          color: Colors.green[800],
                          icon: Icon(Icons.search),
                          onPressed: () {
                            _typePopup(context);
                          },
                        ),
                        Container(
                          width: 200.0, // Atur lebar Container sesuai kebutuhan
                          child: TextFormField(
                            controller: _kdtype,
                            decoration: InputDecoration(
                              hintText: 'Kode Type Kendaraan',
                              // fillColor: Colors.white,
                              // hintStyle: TextStyle(color: Colors.white60),
                              // labelText: 'Kode Type Kendaraan',
                            ),
                          ),
                        )
                      ],
                    ),
                    TextIsi(
                        controller: _nmtype,
                        hintText: 'Type Kendaraan',
                        labeltextku: 'Type Kendaraan',
                        obsecuretext: false),
                    Row(
                      children: [
                        IconButton(
                          color: Colors.green[800],
                          icon: Icon(Icons.search),
                          onPressed: () {
                            _warnaPopup(context);
                          },
                        ),
                        Container(
                          width: 200.0, // Atur lebar Container sesuai kebutuhan
                          child: TextFormField(
                            controller: _kdwarna,
                            decoration: InputDecoration(
                              hintText: 'Kode Warna Kendaraan',
                            ),
                          ),
                        )
                      ],
                    ),
                    TextIsi(
                        controller: _nmwarna,
                        hintText: 'Warna Kendaraan',
                        labeltextku: 'Warna Kendaraan',
                        obsecuretext: false),
                  ],
                ),
              ),
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
                      onPressed: () {},
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
          ],
        ),
      )),
    );
  }
}
