import 'package:dwr0001/Application/OverViewPage.dart';
import 'package:dwr0001/components/body.dart';
import 'package:dwr0001/components/eventmenu/MainBox.dart';
import 'package:flutter/material.dart';

class River extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
                  child: Text('55555'),
                ),
                ListRiver(),
              ],
            )),
      ),
    );
  }
}

class ListRiver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/beach.png',
                  scale: 1.5,
                ),
                Text(
                  'หมวดหมู่ลุ่มแม่น้ำ',
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black87,
                          offset: Offset(2.0, 4.0),
                        ),
                      ],
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Mainbox(
                  title: "ลุ่มน้ำแม่กลอง",
                  color: Colors.white,
                  height: 135,
                  width: 370,
                  font: 30,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OverViewPage(1)),
                    );
                  },
                ),
                SizedBox(height: 10),
                Mainbox(
                  title: "ลุ่มน้ำสาละวิน",
                  color: Colors.white,
                  height: 135,
                  width: 370,
                  font: 30,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OverViewPage(2)),
                    );
                  },
                ),
                SizedBox(height: 10),
                Mainbox(
                  title: "ลุ่มน้ำกกและโขงเหนือ",
                  color: Colors.white,
                  height: 135,
                  width: 370,
                  font: 30,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OverViewPage(3)),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 25),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                ),
                height: 110,
                width: 450,
                child: IconButton(
                    icon: Image.asset('assets/images/home.png'),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Mainbody()),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
