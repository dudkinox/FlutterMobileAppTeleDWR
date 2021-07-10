import 'package:dwr0001/Application/MenuOld.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class WelcomeOld extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeOld> {
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
              image: AssetImage('assets/banner/banner01/background02.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.8),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => MenuPageOld(
                            data: '',
                          )),
                );
              },
              child: Image(
                image: AssetImage('assets/banner/banner01/sign_in.png'),
                fit: BoxFit.cover,
                height: size.height * 0.11,
              ),
            ),
          ],
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
