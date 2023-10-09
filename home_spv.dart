import 'package:flutter/material.dart';

import 'ganti_pwd.dart';
import 'login.dart';
import 'menu.dart';

class Home_spv extends StatefulWidget {
  final String varpbuser;
  final String varniksales;
  final String varkdsales;
  final String varnmuser;
  final String bagian;

  Home_spv(this.varpbuser, this.varniksales, this.varkdsales, this.varnmuser,
      this.bagian);

  @override
  State<Home_spv> createState() => _Home_spvState();
}

class _Home_spvState extends State<Home_spv> {
  List<Map<String, dynamic>> menuItems = []; // Inisialisasi di sini

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  // color: Colors.white70,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          color: Colors.grey[800],
                          icon: Icon(Icons.person_rounded),
                          iconSize: 60,
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
                          "Hallo SPV " + widget.varnmuser,
                          style: TextStyle(
                            fontSize: 12,
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
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.0), // Memberi jarak 10 dari ujung kiri
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Penjualan Bulan Ini",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('bla..bla..blaaaa'),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            _buildIconButtonWithText(
                                "Activity", Icons.work_sharp, fungsi1),
                            SizedBox(
                              height: 2,
                              width: 25,
                            ),
                            _buildIconButtonWithText(
                                "Customer", Icons.tty_rounded, fungsi2),
                            SizedBox(
                              height: 22,
                              width: 25,
                            ),
                            _buildIconButtonWithText(
                                "Stock", Icons.time_to_leave_rounded, fungsi3),
                            SizedBox(
                              height: 22,
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
                                "SPK", Icons.crop_din_rounded, fungsi1),
                            SizedBox(
                              height: 2,
                              width: 25,
                            ),
                            _buildIconButtonWithText(
                                "DO Sales", Icons.no_crash_rounded, fungsi2),
                            SizedBox(
                              height: 22,
                              width: 25,
                            ),
                            _buildIconButtonWithText("DO by Admin",
                                Icons.check_box_rounded, fungsi3),
                            SizedBox(
                              height: 22,
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
                                "AfterSales", Icons.sell_rounded, fungsi1),
                            SizedBox(
                              height: 10,
                              width: 25,
                            ),
                            _buildIconButtonWithText("Lap. Activity",
                                Icons.menu_book_rounded, fungsi2),
                            SizedBox(
                              height: 22,
                              width: 25,
                            ),
                            _buildIconButtonWithText("Lap. Prospek",
                                Icons.content_paste_go_rounded, fungsi3),
                            SizedBox(
                              height: 22,
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
                            _buildIconButtonWithText("Lap SPK",
                                Icons.chrome_reader_mode_rounded, fungsi1),
                            SizedBox(
                              height: 2,
                              width: 25,
                            ),
                            _buildIconButtonWithText(
                                "Lap DO", Icons.menu_book_rounded, fungsi2),
                            SizedBox(
                              height: 22,
                              width: 25,
                            ),
                            _buildIconButtonWithText(
                                "Menu ..", Icons.menu_rounded, fungsi3),
                            SizedBox(
                              height: 22,
                              width: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
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

  Widget _buildIconButtonWithText(
      String text, IconData iconData, Function onPressedFunction) {
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
            size: 50,
            color: Colors.blue[200],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
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
}
