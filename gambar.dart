import 'package:flutter/material.dart';

class Gambar extends StatefulWidget {
  const Gambar({super.key});

  @override
  State<Gambar> createState() => _GambarState();
}

class _GambarState extends State<Gambar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 400,
          color: Colors.amber,
          child: Image(
            image: AssetImage("assets/coba.jpg"),
          ),
        ),
      ),
    );
  }
}
