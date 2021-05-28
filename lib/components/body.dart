import 'package:flutter/material.dart';
import 'eventmenu/Eventpage.dart';

class Mainbody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue[50],
              title: Text('Dashboard',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              leading: IconButton(
                icon: Image.asset('assets/images/menu.png'),
                onPressed: () {},
              ),
              actions: <Widget>[
                IconButton(
                    icon: Image.asset('assets/images/bell.png'),
                    onPressed: () {}),
                IconButton(
                    icon: Image.asset('assets/images/search.png'),
                    onPressed: () {}),
              ],
              centerTitle: true,
              bottom: TabBar(tabs: [
                Tab(
                    child: Text('แผนที่',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ))),
                Tab(
                    child: Text('หน้ากิจกรรม',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ))),
              ]),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Text('TEST'),
                ),
                EventPage(),
              ],
            )),
      ),
    );
  }
}
