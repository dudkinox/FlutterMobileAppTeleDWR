import 'package:dwr0001/Application/OverViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StationOld extends StatelessWidget {
  StationOld(this.basinID);
  var basinID;
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyDisplayClass(basinID),
    );
    return materialApp;
  }
}

class MyDisplayClass extends StatelessWidget {
  MyDisplayClass(this.basinID);
  var basinID;
  // sentRiver(basinID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'TELEDWR-Menu',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kanit',
                fontSize: 18.0,
                fontWeight: FontWeight.w700),
          ),
          elevation: 10.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  basinID == 1
                      ? "ลุ่มน้ำแม่กลอง"
                      : basinID == 2
                          ? "ลุ่มน้ำสาละวิน"
                          : basinID == 3
                              ? "ลุ่มน้ำกกและโขงเหนือ"
                              : "ยังไม่ได้เลือกลุ่มแม่น้ำ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      child: RaisedButton(
                        child: Text(
                          'เลือกสถานี',
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Kanit',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // builder: (context) => OverViewPage()));
                                  builder: (context) => OverViewPage(basinID)));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      child: RaisedButton(
                        child: Text(
                          'การคาดการณ์',
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Kanit',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        color: Colors.white,
                        onPressed: () {
                          if (basinID == 3) {
                            launch("http://49.229.21.201/");
                          } else {
                            launch("http://49.229.21.203/");
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      child: RaisedButton(
                        child: Text(
                          'เกี่ยวกับโครงการ',
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Kanit',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        color: Colors.white,
                        onPressed: () {
                          if (basinID == 1) {
                            launch("https://bit.ly/3huKEBj");
                          } else if (basinID == 2) {
                            launch("https://bit.ly/3ApFWxk");
                          } else {
                            launch("https://bit.ly/3AovhTG");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }
}
