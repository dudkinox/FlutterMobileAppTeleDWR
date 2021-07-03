import 'package:dwr0001/components/bodyold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Station/Station.dart';

class MenuPageOld extends StatelessWidget {
  final String data;

  MenuPageOld({
    Key key,
    @required this.data,
  }) : super(key: key);

  DateTime backbuttonpressedTime;

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
                  'เลือกลุ่มแม่น้ำ',
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
                          'ลุ่มน้ำแม่กลอง',
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
                                  builder: (context) => StationOld(1)));
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
                          'ลุ่มน้ำสาละวิน',
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
                                  builder: (context) => StationOld(2)));
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
                          'ลุ่มน้ำกกและโขงเหนือ',
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
                                  builder: (context) => StationOld(3)));
                        },
                      ),
                    ),
                  ],
                ),
              ]),
        ));
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
