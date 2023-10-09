import 'package:flutter/material.dart';
import 'package:zirangsales/customersales.dart';
import 'package:zirangsales/gambar.dart';

import 'activitysls.dart';
import 'custbaru.dart';
import 'home_kacab.dart';
import 'home_sales.dart';
import 'home_spv.dart';
import 'login.dart';
import 'spk.dart';
import 'stocksales.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/gambar': (context) => Gambar(),
        '/homekacab': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
          final varpbuser =
              args?.isNotEmpty == true ? args![0] as String? : null;
          final varniksales =
              args?.isNotEmpty == true ? args![1] as String? : null;
          final varkdsales =
              args?.isNotEmpty == true ? args![2] as String? : null;
          final varnmuser =
              args?.isNotEmpty == true ? args![3] as String? : null;
          final bagian = args?.isNotEmpty == true ? args![4] as String? : null;
          return Home_kacab(
              varpbuser!, varniksales!, varkdsales!, varnmuser!, bagian!);
        },
        '/homespv': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
          final varpbuser =
              args?.isNotEmpty == true ? args![0] as String? : null;
          final varniksales =
              args?.isNotEmpty == true ? args![1] as String? : null;
          final varkdsales =
              args?.isNotEmpty == true ? args![2] as String? : null;
          final varnmuser =
              args?.isNotEmpty == true ? args![3] as String? : null;
          final bagian = args?.isNotEmpty == true ? args![4] as String? : null;

          return Home_spv(
              varpbuser!, varniksales!, varkdsales!, varnmuser!, bagian!);
        },
        '/homesales': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
          final varpbuser =
              args?.isNotEmpty == true ? args![0] as String? : null;
          final varniksales =
              args?.isNotEmpty == true ? args![1] as String? : null;
          final varkdsales =
              args?.isNotEmpty == true ? args![2] as String? : null;
          final varnmuser =
              args?.isNotEmpty == true ? args![3] as String? : null;
          final bagian = args?.isNotEmpty == true ? args![4] as String? : null;

          return Home_sales(
              varpbuser!, varniksales!, varkdsales!, varnmuser!, bagian!);
        },
        '/stocksales': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
          final varpbuser =
              args?.isNotEmpty == true ? args![0] as String? : null;
          final varniksales =
              args?.isNotEmpty == true ? args![1] as String? : null;
          final varkdsales =
              args?.isNotEmpty == true ? args![2] as String? : null;
          final varnmuser =
              args?.isNotEmpty == true ? args![3] as String? : null;
          final bagian = args?.isNotEmpty == true ? args![4] as String? : null;

          return StockSales(
              varpbuser!, varniksales!, varkdsales!, varnmuser!, bagian!);
        },
        '/activitysls': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
          final varpbuser =
              args?.isNotEmpty == true ? args![0] as String? : null;
          final varniksales =
              args?.isNotEmpty == true ? args![1] as String? : null;
          final varkdsales =
              args?.isNotEmpty == true ? args![2] as String? : null;
          final varnmuser =
              args?.isNotEmpty == true ? args![3] as String? : null;
          final bagian = args?.isNotEmpty == true ? args![4] as String? : null;

          return ActivitySls(
              varpbuser!, varniksales!, varkdsales!, varnmuser!, bagian!);
        },
        '/customersales': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
          final varpbuser =
              args?.isNotEmpty == true ? args![0] as String? : null;
          final varniksales =
              args?.isNotEmpty == true ? args![1] as String? : null;
          final varkdsales =
              args?.isNotEmpty == true ? args![2] as String? : null;
          final varnmuser =
              args?.isNotEmpty == true ? args![3] as String? : null;
          final bagian = args?.isNotEmpty == true ? args![4] as String? : null;

          return customersales(
              varpbuser!, varniksales!, varkdsales!, varnmuser!, bagian!);
        },
        '/spk': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
          final varpbuser =
              args?.isNotEmpty == true ? args![0] as String? : null;
          final varniksales =
              args?.isNotEmpty == true ? args![1] as String? : null;
          final varkdsales =
              args?.isNotEmpty == true ? args![2] as String? : null;
          final varnmuser =
              args?.isNotEmpty == true ? args![3] as String? : null;
          final bagian = args?.isNotEmpty == true ? args![4] as String? : null;
          final kdcust = args?.isNotEmpty == true ? args![5] as String? : null;
          final nmcust = args?.isNotEmpty == true ? args![6] as String? : null;
          final alamat = args?.isNotEmpty == true ? args![7] as String? : null;
          final kdcamat = args?.isNotEmpty == true ? args![8] as String? : null;
          final nmcamat = args?.isNotEmpty == true ? args![9] as String? : null;
          final notlp = args?.isNotEmpty == true ? args![10] as String? : null;
          final email = args?.isNotEmpty == true ? args![11] as String? : null;
          final nmcp = args?.isNotEmpty == true ? args![12] as String? : null;
          final tlpcp = args?.isNotEmpty == true ? args![14] as String? : null;
          final nospk = args?.isNotEmpty == true ? args![15] as String? : null;
          final kdleasing =
              args?.isNotEmpty == true ? args![16] as String? : null;
          final nmleasing =
              args?.isNotEmpty == true ? args![17] as String? : null;
          final kdlokasi =
              args?.isNotEmpty == true ? args![18] as String? : null;
          final tglspk = args?.isNotEmpty == true ? args![19] as String? : null;
          final kdwarna =
              args?.isNotEmpty == true ? args![20] as String? : null;
          final nmwarna =
              args?.isNotEmpty == true ? args![21] as String? : null;
          final kdtype = args?.isNotEmpty == true ? args![22] as String? : null;
          final nmtype = args?.isNotEmpty == true ? args![23] as String? : null;
          return spk(
              varpbuser!,
              varniksales!,
              varkdsales!,
              varnmuser!,
              bagian!,
              kdcust!,
              nmcust!,
              alamat!,
              kdcamat!,
              nmcamat!,
              notlp!,
              email!,
              nmcp!,
              tlpcp!,
              nospk!,
              kdleasing!,
              nmleasing!,
              kdlokasi!,
              tglspk!,
              kdwarna!,
              nmwarna!,
              kdtype!,
              nmtype!);
        },
        '/custbaru': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
          final varpbuser =
              args?.isNotEmpty == true ? args![0] as String? : null;
          final varniksales =
              args?.isNotEmpty == true ? args![1] as String? : null;
          final varkdsales =
              args?.isNotEmpty == true ? args![2] as String? : null;
          final varnmuser =
              args?.isNotEmpty == true ? args![3] as String? : null;
          final bagian = args?.isNotEmpty == true ? args![4] as String? : null;
          final kdcust = args?.isNotEmpty == true ? args![5] as String? : null;
          final jeniscust =
              args?.isNotEmpty == true ? args![6] as String? : null;
          final namacust =
              args?.isNotEmpty == true ? args![7] as String? : null;
          final alcust = args?.isNotEmpty == true ? args![8] as String? : null;
          final kdcamat = args?.isNotEmpty == true ? args![9] as String? : null;
          final nmcamat =
              args?.isNotEmpty == true ? args![10] as String? : null;
          final tgllahir =
              args?.isNotEmpty == true ? args![11] as String? : null;
          final agama = args?.isNotEmpty == true ? args![12] as String? : null;
          final notlp = args?.isNotEmpty == true ? args![13] as String? : null;
          final npwp = args?.isNotEmpty == true ? args![14] as String? : null;
          final nokk = args?.isNotEmpty == true ? args![15] as String? : null;
          final nikcust =
              args?.isNotEmpty == true ? args![16] as String? : null;
          final email = args?.isNotEmpty == true ? args![17] as String? : null;
          final nmcp = args?.isNotEmpty == true ? args![18] as String? : null;
          final tlpcp = args?.isNotEmpty == true ? args![19] as String? : null;
          final ketcust =
              args?.isNotEmpty == true ? args![20] as String? : null;

          return custbaru(
              varpbuser!,
              varniksales!,
              varkdsales!,
              varnmuser!,
              bagian!,
              kdcust!,
              jeniscust!,
              namacust!,
              alcust!,
              kdcamat!,
              nmcamat!,
              tgllahir!,
              agama!,
              notlp!,
              npwp!,
              nokk!,
              nikcust!,
              email!,
              nmcp!,
              tlpcp!,
              ketcust!);
        },
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container( width: 400,height: 600,  color: Colors.grey,  child: Text( 'Tempat berita... bla..bla..bla.',  style: TextStyle(fontSize: 100),                ),
                  // ),
                  SizedBox(height: 590.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.red, // Warna latar belakang
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('KZU Daihatsu Jateng',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.red, // Warna latar belakang
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/gambar');
                    },
                    child: Text('COba gambar',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
