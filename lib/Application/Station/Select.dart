import 'package:dwr0001/Application/OverViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
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

// ignore: must_be_immutable
class MyDisplayClass extends StatelessWidget {
  MyDisplayClass(this.basinID);
  var basinID;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/banner/banner02/background03.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 120),
              GestureDetector(
                onTap: () {},
                child: Image(
                  image: AssetImage(
                    basinID == 1
                        ? "assets/banner/banner02/subhead02.png"
                        : basinID == 2
                            ? "assets/banner/banner02/subhead03.png"
                            : basinID == 3
                                ? "assets/banner/banner02/subhead04.png"
                                : "",
                  ),
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OverViewPage(basinID)));
                },
                child: Image(
                  image:
                      AssetImage('assets/banner/banner02/choice04_station.png'),
                  fit: BoxFit.cover,
                  height: 85,
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  if (basinID == 3) {
                    launch("http://49.229.21.201/");
                  } else {
                    launch("http://49.229.21.203/");
                  }
                },
                child: Image(
                  image:
                      AssetImage('assets/banner/banner02/choice05_predict.png'),
                  fit: BoxFit.cover,
                  height: 85,
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  if (basinID == 1) {
                    launch("https://bit.ly/3huKEBj");
                  } else if (basinID == 2) {
                    launch("https://bit.ly/3ApFWxk");
                  } else {
                    launch("https://bit.ly/3AovhTG");
                  }
                },
                child: Image(
                  image:
                      AssetImage('assets/banner/banner02/choice06_project.png'),
                  fit: BoxFit.cover,
                  height: 85,
                ),
              ),
            ],
          )),
    );
  }
}
