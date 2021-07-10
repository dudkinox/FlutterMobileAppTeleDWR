import 'package:dwr0001/Application/OverViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final String data;

  MenuPage({
    Key key,
    @required this.data,
  }) : super(key: key);

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
                      // ignore: deprecated_member_use
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
                                  builder: (context) => OverViewPage(1)));
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
                      // ignore: deprecated_member_use
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
                                  builder: (context) => OverViewPage(2)));
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
                      // ignore: deprecated_member_use
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
                                  builder: (context) => OverViewPage(3)));
                        },
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }
}
