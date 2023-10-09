import 'package:flutter/material.dart';

import 'ganti_pwd.dart';
import 'login.dart';
import 'menu.dart';
import 'service.dart';

class Home_sales extends StatefulWidget {
  final String varpbuser;
  final String varniksales;
  final String varkdsales;
  final String varnmuser;
  final String bagian;

  Home_sales(this.varpbuser, this.varniksales, this.varkdsales, this.varnmuser,
      this.bagian);

  @override
  State<Home_sales> createState() => _Home_salesState();
}

class _Home_salesState extends State<Home_sales> {
  List<Map<String, dynamic>> menuItems = []; // Inisialisasi di sini

  @override
  void initState() {
    super.initState();
    loadJmlSpkAndDo();
    // Inisialisasi menuItems di sini
    menuItems = [
      {
        'icon': Icons.access_alarm,
        'text': 'Menu 1',
        'subtitle': 'Subjudul 1',
        'onTap': fungsi1,
      },
      {
        'icon': Icons.favorite,
        'text': 'Menu 2',
        'subtitle': 'Subjudul 2',
        'onTap': fungsi2,
      },
      {
        'icon': Icons.access_alarm,
        'text': 'Menu 1',
        'subtitle': 'Subjudul 1',
        'onTap': fungsi1,
      },
      {
        'icon': Icons.favorite,
        'text': 'Menu 2',
        'subtitle': 'Subjudul 2',
        'onTap': fungsi2,
      },
      {
        'icon': Icons.access_alarm,
        'text': 'Menu 1',
        'subtitle': 'Subjudul 1',
        'onTap': fungsi1,
      },
      {
        'icon': Icons.favorite,
        'text': 'Menu 2',
        'subtitle': 'Subjudul 2',
        'onTap': fungsi2,
      },
      {
        'icon': Icons.access_alarm,
        'text': 'Menu 1',
        'subtitle': 'Subjudul 1',
        'onTap': fungsi1,
      },
      {
        'icon': Icons.favorite,
        'text': 'Menu 2',
        'subtitle': 'Subjudul 2',
        'onTap': fungsi2,
      },
      {
        'icon': Icons.access_alarm,
        'text': 'Menu 1',
        'subtitle': 'Subjudul 1',
        'onTap': fungsi1,
      },
      {
        'icon': Icons.favorite,
        'text': 'Menu 2',
        'subtitle': 'Subjudul 2',
        'onTap': fungsi2,
      },
      {
        'icon': Icons.access_alarm,
        'text': 'Menu 1',
        'subtitle': 'Subjudul 1',
        'onTap': fungsi1,
      },
      {
        'icon': Icons.favorite,
        'text': 'Menu 2',
        'subtitle': 'Subjudul 2',
        'onTap': fungsi2,
      },
      // Tambahkan item menu lainnya di sini sesuai kebutuhan
    ];
  }

  int spkValue = 0; // Variabel untuk menyimpan nilai SPK
  int doValue = 0; // Variabel untuk menyimpan nilai DO

  void loadJmlSpkAndDo() async {
    try {
      final data = await ApiService.jmlspk(widget.varpbuser);
      if (data.isNotEmpty) {
        spkValue = int.tryParse(data[0]['jmlspk'] ?? '0') ?? 0;
        doValue = int.tryParse(data[0]['jmldo'] ?? '0') ?? 0;
        setState(() {
          // Set ulang nilai SPK dan DO
        });
      }
    } catch (e) {
      print('Error loading SPK and DO: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.cable), label: ""),
        ],
      ),
      body: SafeArea(
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
                          icon: Icon(Icons.person_rounded),
                          iconSize: 30,
                          onPressed: () {
                            showMenu(
                              color: Colors.grey[600],
                              context: context,
                              position:
                                  //  RelativeRect.fromLTRB(1000.0, 80.0, 0.0, 0.0),
                                  RelativeRect.fromLTRB(0.0, 80.0, 0.0, 0.0),
                              items: [
                                PopupMenuItem(
                                  child: ListTile(
                                    title: Text(
                                      'Ganti Password',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                      Future.delayed(Duration(milliseconds: 10),
                                          () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GantiPwdPage(widget.varpbuser),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                    title: Text(
                                      'Logout',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
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
                        "Penjualan Bulan Ini",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('SPK : $spkValue',
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('DO : $doValue',
                                  style: TextStyle(
                                    fontSize: 55,
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    color: Colors
                        .white, // Ganti dengan warna latar belakang yang diinginkan
                    padding: EdgeInsets.all(
                        16), // Sesuaikan dengan padding yang Anda inginkan
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              _buildIconButtonWithText(
                                  "Activity",
                                  Icons.work_sharp,
                                  factivitysales,
                                  Colors.lightGreen,
                                  Colors.lightGreen),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                              _buildIconButtonWithText(
                                  "Customer",
                                  Icons.tty_rounded,
                                  fcustomer,
                                  Colors.orangeAccent,
                                  Colors.orangeAccent),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                              _buildIconButtonWithText(
                                  "Stock",
                                  Icons.time_to_leave_rounded,
                                  _lihatstock,
                                  Colors.redAccent,
                                  Colors.redAccent),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                            width: 35,
                          ),
                          Column(
                            children: [
                              _buildIconButtonWithText(
                                  "SPK",
                                  Icons.crop_din_rounded,
                                  fungsi1,
                                  Colors.lime,
                                  Colors.lime),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                              _buildIconButtonWithText(
                                  "DO Sales",
                                  Icons.no_crash_rounded,
                                  fungsi2,
                                  Colors.blue,
                                  Colors.blue),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                              _buildIconButtonWithText(
                                  "DO by Admin",
                                  Icons.check_box_rounded,
                                  fungsi3,
                                  Colors.lightGreen,
                                  Colors.lightGreen),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                            width: 35,
                          ),
                          Column(
                            children: [
                              _buildIconButtonWithText(
                                  "AfterSales",
                                  Icons.sell_rounded,
                                  fungsi1,
                                  Colors.blue,
                                  Colors.blue),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                              _buildIconButtonWithText(
                                  "Lap. Activity",
                                  Icons.menu_book_rounded,
                                  fungsi2,
                                  Colors.brown,
                                  Colors.brown),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                              _buildIconButtonWithText(
                                  "Lap. Prospek",
                                  Icons.content_paste_go_rounded,
                                  fungsi3,
                                  Colors.red,
                                  Colors.red),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                            width: 35,
                          ),
                          Column(
                            children: [
                              _buildIconButtonWithText(
                                  "Lap SPK",
                                  Icons.chrome_reader_mode_rounded,
                                  fungsi1,
                                  Colors.deepOrange,
                                  Colors.deepOrange),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                              _buildIconButtonWithText(
                                  "Lap DO",
                                  Icons.menu_book_rounded,
                                  fungsi2,
                                  Colors.blue,
                                  Colors.blue),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                              _buildIconButtonWithText(
                                  "Menu ..",
                                  Icons.menu_rounded,
                                  fungsi3,
                                  Colors.blueGrey,
                                  Colors.blueGrey),
                              SizedBox(
                                height: 25,
                                width: 25,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final menuItem = menuItems[index];
                  return MenuTengah(
                    iconku: menuItem['icon'],
                    kalimatmenu: menuItem['text'],
                    subtitle: menuItem['subtitle'],
                    onTap: menuItem['onTap'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButtonWithText(String text, IconData iconData,
      Function onPressedFunction, Color iconColor, Color textColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if (onPressedFunction != null) {
              onPressedFunction();
            }
          },
          icon: Icon(
            iconData,
            size: 35,
            color: iconColor, // Gunakan variabel iconColor
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: textColor, // Gunakan variabel textColor
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void fungsi1() {
    print("coba fungsi1");
  }

  void fungsi2() {
    print("coba fungsi2");
  }

  void fungsi3() {
    print("coba fungsi3");
  }

  void fcustomer() {
    Navigator.pushReplacementNamed(context, '/customersales', arguments: [
      widget.varpbuser,
      widget.varniksales,
      widget.varkdsales,
      widget.varnmuser,
      widget.bagian
    ]);
  }

  void _lihatstock() {
    Navigator.pushReplacementNamed(context, '/stocksales', arguments: [
      widget.varpbuser,
      widget.varniksales,
      widget.varkdsales,
      widget.varnmuser,
      widget.bagian
    ]);
  }

  void factivitysales() {
    Navigator.pushReplacementNamed(context, '/activitysls', arguments: [
      widget.varpbuser,
      widget.varniksales,
      widget.varkdsales,
      widget.varnmuser,
      widget.bagian
    ]);
  }
}
