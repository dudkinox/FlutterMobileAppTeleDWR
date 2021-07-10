import 'package:fluttertoast/fluttertoast.dart';
import '../../components/body.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  DateTime backbuttonpressedTime;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: -255,
                left: 20,
                child: Image.asset(
                  'assets/images/bg.png',
                  fit: BoxFit.cover,
                  width: size.width * 1.1,
                ),
              ),
              Positioned(
                bottom: -260,
                right: -10,
                child: Image.asset(
                  'assets/images/bg2.png',
                  fit: BoxFit.cover,
                  width: size.width * 1.1,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.png",
                    height: 246,
                    width: 212,
                  ),
                  Text(
                    "TeleDWR",
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 4.0,
                            color: Colors.black87,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                        fontSize: 60,
                        color: Colors.indigo[400],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Righteous',
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ระบบติดตามสถานะการณ์น้ำทางไกลอัตโนมัติ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Kanit',
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: 170),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Mainbody()));
                    },
                    child: Text(
                      "Start",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black87,
                              offset: Offset(2.0, 4.0),
                            ),
                          ],
                          fontSize: 38,
                          color: Colors.white,
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
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
}
