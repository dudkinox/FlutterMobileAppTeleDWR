import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants.dart';
import 'eventmenu/Eventpage.dart';

class MainbodyOld extends StatefulWidget {
  @override
  _MainbodyOldState createState() => _MainbodyOldState();
}

DateTime backbuttonpressedTime;

class _MainbodyOldState extends State<MainbodyOld> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Container(
          child: Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/waveup.png"),
                        fit: BoxFit.fill),
                    gradient: LinearGradient(
                      colors: [waveup1, waveup2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 40,
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
                          child: Text('Main Page',
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
