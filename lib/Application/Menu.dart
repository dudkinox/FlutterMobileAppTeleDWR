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
          title: Text('TELEDWR-Menu'),
          elevation: 10.0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'เลือกลุ่มแม่น้ำ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
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
                    'ลุ่มน้ำแม่กลอง',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // builder: (context) => OverViewPage()));
                            builder: (context) => OverViewPage()));
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
                    'ลุ่มน้ำสารวิน',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Colors.white,
                  onPressed: () {},
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
                    'ลุ่มน้ำกก',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
