import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'eventmenu/Eventpage.dart';
import '../constants.dart';

class Mainbody extends StatefulWidget {
  @override
  _MainbodyState createState() => _MainbodyState();
}

DateTime backbuttonpressedTime;

class _MainbodyState extends State<Mainbody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Container(
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                    color: Colors.black,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                      icon: Image.asset(
                        'assets/images/search.png',
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                ],
                centerTitle: true,
                bottom: TabBar(
                    indicatorColor: Colors.lightBlueAccent,
                    indicatorWeight: 3.5,
                    indicatorPadding: EdgeInsets.only(left: 40, right: 40),
                    tabs: [
                      Tab(
                        child: Text(
                          'แผนที่',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Righteous',
                          ),
                        ),
                      ),
                      Tab(
                          child: Text('หน้ากิจกรรม',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: 'Righteous',
                              ))),
                    ]),
              ),
              body: WillPopScope(
                onWillPop: onWillPop,
                child: TabBarView(
                  children: [
                    Center(
                      child: Text('TEST'),
                    ),
                    EventPage(),
                  ],
                ),
              )),
        ),
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
