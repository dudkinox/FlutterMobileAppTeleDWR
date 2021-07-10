import 'package:dwr0001/components/bodyold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Station/Select.dart';

class MenuPageOld extends StatefulWidget {
  final String data;

  MenuPageOld({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _MenuPageOldState createState() => _MenuPageOldState();
}

class _MenuPageOldState extends State<MenuPageOld> {
  DateTime backbuttonpressedTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/banner/banner02/background03.png'),
              fit: BoxFit.fill),
        ),
        child: Column(children: <Widget>[
          SizedBox(height: size.height * 0.15),
          GestureDetector(
            onTap: () {},
            child: Image(
              image: AssetImage('assets/banner/banner02/subhead01.png'),
              fit: BoxFit.cover,
              height: size.height * 0.15,
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StationOld(1)));
            },
            child: Image(
              image:
                  AssetImage('assets/banner/banner02/choice01_mae_klong.png'),
              fit: BoxFit.cover,
              height: size.height * 0.135,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StationOld(2)));
            },
            child: Image(
              image: AssetImage('assets/banner/banner02/choice02_salawin.png'),
              fit: BoxFit.cover,
              height: size.height * 0.14,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StationOld(3)));
            },
            child: Image(
              image: AssetImage('assets/banner/banner02/choice03_kok.png'),
              fit: BoxFit.cover,
              height: size.height * 0.13,
            ),
          )
        ]),
      ),
    );
  }
}

Future<bool> onWillPop() async {
  DateTime currentTime = DateTime.now();

  bool backButton = backbuttonpressedTime == null ||
      currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

  if (backButton) {
    backbuttonpressedTime = currentTime;
    Fluttertoast.showToast(
        msg: "กดอีกครั้งเพื่อออก!!",
        backgroundColor: Colors.black,
        textColor: Colors.white);
    return false;
  }
  return true;
}
