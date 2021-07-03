import 'package:flutter/material.dart';
class ForecastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ข้อมูลการพยากรณ์"),
          elevation: 10.0,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.arrow_forward_ios)),
              Tab(icon: Icon(Icons.arrow_drop_down_circle)),
              Tab(icon: Icon(Icons.arrow_back_ios)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(),
            Container(),
            Container()
          ],
        ),
      ),
    );


  }
}