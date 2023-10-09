import 'package:flutter/material.dart';
import 'package:zirangsales/utils/textisi.dart';

import 'service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _error = '';

  Future<void> login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    try {
      final response = await ApiService.login(username, password);
      if (response.isNotEmpty) {
        final bagian = response['bagian'];
        final varpbuser = response['userku'];
        final varniksales = response['niksales'];
        final varkdsales = response['kdsales'];
        final varnmuser = response['nama'];

        if (bagian == 'kacab') {
          Navigator.pushReplacementNamed(context, '/homekacab', arguments: [
            _usernameController.text,
            varniksales,
            varkdsales,
            varnmuser,
            bagian
          ]);
        } else if (bagian == 'spv') {
          Navigator.pushReplacementNamed(context, '/homespv', arguments: [
            varpbuser,
            varniksales,
            varkdsales,
            varnmuser,
            bagian
          ]);
        } else if (bagian == 'sales') {
          Navigator.pushReplacementNamed(context, '/homesales', arguments: [
            varpbuser,
            varniksales,
            varkdsales,
            varnmuser,
            bagian
          ]);
        } else if (bagian == 'Error') {
          setState(() {
            _error = 'Login gagal..User/password salah/tidak aktif';
          });
        }
      } else {
        print('coba login4');
        setState(() {
          _error = 'Login failed';
        });
      }
    } catch (e) {
      print('Exception during login: $e');
      setState(() {
        _error = 'Tidak konek ke server';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  Icon(
            //    Icons.lock_outline_rounded,
            //   size: 62.0,
            // ),
            Image.asset(
              'assets/zirang-1.png',
              width: 200,
              height: 150,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),

            Text(
              "Silahkan Login!",
              style: TextStyle(color: Colors.grey[700], fontSize: 26),
            ),
            SizedBox(height: 20),
            TextIsi(
                controller: _usernameController,
                hintText: 'Username',
                labeltextku: 'Username',
                obsecuretext: false),
            SizedBox(height: 20),
            TextIsi(
                controller: _passwordController,
                hintText: 'Password',
                labeltextku: 'Password',
                obsecuretext: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
            Text(_error, style: TextStyle(color: Colors.red)),
            Text(
              "----Daihatsu----",
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
