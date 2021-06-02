import 'package:dwr0001/components/body.dart';
import '../../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../river/River.dart';
import 'package:url_launcher/url_launcher.dart';


class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Scaffold(
        backgroundColor: backgroundmainColor,
        body: Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              child: Container(
                height: 150,
                width: 377,
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.6),
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage('assets/images/river.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          backgroundmenu.withOpacity(0.45), BlendMode.dstATop)),
                  color: backgroundmenu,
                  boxShadow: [
                    BoxShadow(
                      color: backgroundmenu.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "หมวดหมู่ลุ่มแม่น้ำ",
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black87,
                            offset: Offset(2.0, 4.0),
                          ),
                        ],
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => River()),
                );
              },
            ),
            SizedBox(height: 12),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 180,
                      width: 170,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.6),
                        image: DecorationImage(
                          image: AssetImage('assets/images/web.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: backgroundmenu.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "เข้าสู่\nเว็บไซต์",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black87,
                                  offset: Offset(2.0, 4.0),
                                ),
                              ],
                              fontSize: 38,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onTap: () {
                      launch("http://tele-maeklong.dwr.go.th/");
                    },
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    child: Container(
                      height: 180,
                      width: 170,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.6),
                        image: DecorationImage(
                          image: AssetImage('assets/images/contact.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: backgroundmenu.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "ติดต่อเรา",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black87,
                                  offset: Offset(2.0, 4.0),
                                ),
                              ],
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Container(
                height: size.height * 1,
                width: size.width * 1,
                margin: const EdgeInsets.only(top: 130),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/wavedown.png"),
                      fit: BoxFit.cover),
                  gradient: LinearGradient(
                    colors: [waveup2, waveup1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

