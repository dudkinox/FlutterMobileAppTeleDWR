import 'package:dwr0001/Application/OverViewPage.dart';
import 'package:dwr0001/components/body.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class River extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
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
                                decoration: TextDecoration.none))),
                  ]),
            ),
            body: TabBarView(
              children: [
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: backgroundmainColor,
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
                GestureDetector(
                  child: Container(
                    height: 125,
                    width: 360,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.6),
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          image: AssetImage('assets/images/river1.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              backgroundmenu.withOpacity(0.45),
                              BlendMode.dstATop)),
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
                        "ลุ่มน้ำแม่กลอง",
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
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OverViewPage(1)),
                    );
                  },
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Container(
                    height: 125,
                    width: 360,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.6),
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          image: AssetImage('assets/images/river2.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              backgroundmenu.withOpacity(0.45),
                              BlendMode.dstATop)),
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
                        "ลุ่มน้ำสาละวิน",
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
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OverViewPage(2)),
                    );
                  },
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Container(
                    height: 125,
                    width: 360,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.6),
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          image: AssetImage('assets/images/river3.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              backgroundmenu.withOpacity(0.45),
                              BlendMode.dstATop)),
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
                        "ลุ่มน้ำกกและโขงเหนือ",
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
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
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
                height: size.height * 1,
                width: size.width * 1,
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/wavedown.png"),
                      fit: BoxFit.fill),
                  gradient: LinearGradient(
                    colors: [waveup2, waveup1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
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
