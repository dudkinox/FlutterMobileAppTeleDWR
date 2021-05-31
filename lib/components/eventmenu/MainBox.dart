import 'package:flutter/material.dart';

// สร้าง container ต้นแบบ
class Mainbox extends StatelessWidget {
  final String title; //ชื่อหัวข้อ
  final Color color; //สีกล่อง
  final double height; //ความสูงกล่อง
  final double width; //ความกว้างกล่อง
  final press; //การใช้งาน

  const Mainbox({
    Key key,
    this.title,
    this.color,
    this.height,
    this.width,
    this.press,
    int font,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // <-- Radius
          ),
        ),
        onPressed: press,
        child: Text(
          title,
          style: TextStyle(shadows: [
            Shadow(
              blurRadius: 5.0,
              color: Colors.black87,
              offset: Offset(2.0, 4.0),
            ),
          ], fontSize: 38, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
