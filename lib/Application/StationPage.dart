import 'dart:convert';
import 'package:dwr0001/Application/OverViewPage.dart';
import 'package:dwr0001/Application/Tab/TabFour.dart';
import 'package:dwr0001/Application/Tab/TabOne.dart';
import 'package:dwr0001/Application/Tab/TabThree.dart';
import 'package:dwr0001/Application/Tab/TabTwo.dart';
import 'package:dwr0001/Models/station_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/painting.dart' as painting;
import '../Models/data_Model.dart';

class StationPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String stn_id;
  final int basinID;
  // ignore: non_constant_identifier_names
  // StationPage({Key key, @required this.stn_id, this.basinID}) : super(key: key);
  StationPage({this.stn_id, this.basinID});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: MyDisplayClass(stn_id, basinID),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyDisplayClass extends StatelessWidget {
  MyDisplayClass(this.stnId, this.basinID);
  var stnId;
  var basinID;
  StationModel stationData;
  String _title = 'ข้อมูลตรวจวัด';
  // ignore: non_constant_identifier_names

  String get family => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh_outlined),
          onPressed: () async {
            await loadData();
            imageCache.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              var stationPage = StationPage(
                stn_id: stnId,
                basinID: basinID,
              );
              return stationPage;
            }));
          }),
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.pending_actions_sharp),
              text: "สถานี",
            ),
            Tab(
              icon: Icon(Icons.table_rows_outlined),
              text: "ตาราง",
            ),
            Tab(
              icon: Icon(Icons.bar_chart_outlined),
              text: "กราฟ",
            ),
            Tab(
              icon: Icon(Icons.camera),
              text: "CCTV",
            ),
          ],
        ),
        title: Text(
          'TELEDWR-ข้อมูลตรวจวัด',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Kanit',
              fontSize: 18.0,
              fontWeight: FontWeight.w700),
        ),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OverViewPage(basinID)))
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 3,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.blue, Colors.lightBlueAccent],
            ),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          painting.imageCache.clear();
          Navigator.of(context).pop(true);
          return new Future.value(true);
        },
        child: TabBarView(
          children: [
            Container(
              child: TabOne(stnId),
            ),
            Container(
              child: TabTwo(stnId),
            ),
            Container(
              child: TabThree(stnId),
            ),
            RefreshIndicator(
              // ignore: missing_return
              onRefresh: () {
                imageCache.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  var stationPage = StationPage(
                    stn_id: stnId,
                    basinID: basinID,
                  );
                  return stationPage;
                }));
              },
              child: TabFour(stnId),
            ),
          ],
        ),
      ),
    );
  }
}

Future<StationModel> getStation(String stn_id) async {
  final String url =
      "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json_id?stn_id=" +
          stn_id;

  //final String url = "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json";
  //https://localhost:44303/webservice/webservice_mk_json_id?stn_id=TC140805
  //final String url = "https://jsonplaceholder.typicode.com/todos/1";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final station = jsonDecode(response.body);
    return StationModel.fromJson(station);
  } else {
    throw Exception('Failed load data with status code ${response.statusCode}');
  }
}

List<StationModel> parseStation(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed
      .map<StationModel>((json) => StationModel.fromJson(json))
      .toList();
}

Future<List<StationModel>> getStationList(basinID, String s) async {
  //final response = await http.get('http://192.168.1.2:8000/products.json');
  final String url =
      "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return parseStation(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

loadData() async {}

List<StationModel> parseData(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed
      .map<StationModel>((json) => StationModel.fromJson(json))
      .toList();
}

// ignore: non_constant_identifier_names
Future<StationModel> getStationData(String stn_id) async {
  //final String url ="http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json?stn_id=" + stn_id;
  final String url =
      "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_Data_json?stn_id=" +
          stn_id;
  //https://localhost:44303/webservice/webservice_mk_json_id?stn_id=TC140805
  //final String url = "https://jsonplaceholder.typicode.com/todos/1";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final station = jsonDecode(response.body);
    return StationModel.fromJson(station);
  } else {
    throw Exception();
  }
}

List<DataModelGet> parseData_(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed
      .map<DataModelGet>((json) => DataModelGet.fromJson(json))
      .toList();
}

// ignore: non_constant_identifier_names
Future<List<DataModelGet>> getStationData24H(String stn_id) async {
  //final String url ="http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json?stn_id=" + stn_id;
  final String url =
      "http://tele-kokkhong.dwr.go.th/webservice/getdata?station_ID=" + stn_id;
  //https://localhost:44303/webservice/webservice_mk_json_id?stn_id=TC140805
  //final String url = "https://jsonplaceholder.typicode.com/todos/1";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return parseData_(response.body);
  } else {
    throw Exception();
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // ignore: todo
    // TODO: Set properties to paint

    var path = Path();

    // ignore: todo
    // TODO: Draw your path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
