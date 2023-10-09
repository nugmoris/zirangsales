import 'package:flutter/material.dart';

class MenuTengah extends StatelessWidget {
  final IconData iconku;
  final String kalimatmenu;
  final String subtitle;
  final Function()? onTap;

  const MenuTengah({
    required this.iconku,
    required this.kalimatmenu,
    required this.subtitle,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(16),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.blue[200],
                  child: Icon(
                    iconku,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kalimatmenu,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
