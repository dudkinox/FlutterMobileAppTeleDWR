import 'package:dwr0001/components/body.dart';
import '../../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'MainBox.dart';
import '../river/River.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(height: 20),
          Mainbox(
            height: 150,
            width: 377,
            title: "หมวดหมู่ลุ่มแม่น้ำ",
            color: Colors.green,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => River()),
              );
            },
          ),
          SizedBox(height: 12),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 8),
                Expanded(
                    child: Column(
                  children: [
                    Mainbox(
                      title: "ภาพ\nCCTV",
                      color: Colors.green,
                      height: 130,
                      width: 190,
                      press: () {},
                    ),
                    SizedBox(height: 6),
                    Mainbox(
                      title: "เข้าสู่\nเว็บไซต์",
                      color: Colors.green,
                      height: 180,
                      width: 190,
                      press: () {},
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Mainbox(
                      title: "กราฟ",
                      color: Colors.green,
                      height: 180,
                      width: 175,
                      press: () {},
                    ),
                    SizedBox(height: 6),
                    Mainbox(
                      title: "ติดต่อเรา",
                      color: Colors.green,
                      height: 130,
                      width: 175,
                      press: () {},
                    ),
                  ],
                ))
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: Container(
              height: 127,
              width: 450,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/wave.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: IconButton(
                  icon: Image.asset(
                    'assets/images/home.png',
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Mainbody()),
                    );
                  }),
            ),
          ),
        ],
      )),
    );
  }
}
