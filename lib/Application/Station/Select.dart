import 'package:dwr0001/Application/OverViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dwr0001/Application/pdf/PdfViewer.dart';

import '../MenuOld.dart';

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
    print("สถานี" + basinID.toString());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/banner/banner02/background03.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.15),
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
              SizedBox(height: size.height * 0.03),
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
              SizedBox(height: size.height * 0.03),
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
              SizedBox(height: size.height * 0.03),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PdfViewer(basinID)),
                  );
                },
                child: Image(
                  image:
                      AssetImage('assets/banner/banner02/choice06_project.png'),
                  fit: BoxFit.cover,
                  height: 85,
                ),
              ),
              SizedBox(height: size.height * 0.13),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuPageOld(
                                data: '',
                              )));
                },
                child: Image(
                  image:
                      AssetImage('assets/banner/back_button/button_back.png'),
                  fit: BoxFit.cover,
                  height: 50,
                ),
              ),
            ],
          )),
    );
  }
}
