import '../../components/body.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment(0, 3.3),
                image: AssetImage('assets/images/bg2.png'),
                fit: BoxFit.fitWidth),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blue.shade700],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        height: size.height,
        width: double.infinity,
        child: Column(
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
                  fontWeight: FontWeight.bold,
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
        ));
  }
}
