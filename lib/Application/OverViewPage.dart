import 'dart:convert';
import 'package:dwr0001/Application/Station/TabOneStation.dart';
import 'package:http/http.dart' as http;
import 'package:dwr0001/Models/station_model.dart';
import 'package:flutter/material.dart';
import 'Station/Select.dart';
import 'Station/TabTwoStation.dart';

// ignore: must_be_immutable
class OverViewPage extends StatelessWidget {
  OverViewPage(this.basinID);
  var basinID;
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: MyDisplayClass(basinID),
      ),
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
    print(basinID);
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.star_border),
              text: "ภาพรวมสถานี",
            ),
            Tab(
              icon: Icon(Icons.add_alert),
              text: "การแจ้งเตือน",
            ),
          ],
        ),
        title: Text(
          'TELEDWR-รายการสถานี',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Kanit',
              fontSize: 18.0,
              fontWeight: FontWeight.w700),
        ),
        elevation: 10.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StationOld(basinID)))
          },
        ),
      ),
      body: WillPopScope(
          child: TabBarView(
              children: [TabOneStation(basinID), TabTwoStation(basinID)])),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<StationModel> getStation() async {
  final String url =
      "https://tele-maeklong.dwr.go.th/webservice/webservice_mk_json_id?stn_id=TC140805";
  //final String url = "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json";
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

// ignore: missing_return
List<StationModel> parseStation(String responseBody, String tab) {
  var parsed = [];
  switch (tab) {
    case "1":
      parsed = json.decode(responseBody);
      return parsed
          .map<StationModel>((json) => StationModel.fromJson(json))
          .toList();
      break;
    case "2":
      parsed = json.decode(responseBody);
      //https://stackoverflow.com/questions/42143031/filter-json-by-key-value/42143070
      //(status["CURR_STATUS"] == "1" || status["CURR_STATUS"] == "2"));
      var result = parsed.where((status) =>
          (status["CURR_STATUS"] == "1" || status["CURR_STATUS"] == "2"));
      return result
          .map<StationModel>((json) => StationModel.fromJson(json))
          .toList();
      break;
    default:
      print("ไม่ตรงเงื่อนไข");
      break;
  }
}

Future<List<StationModel>> getStationListTab(var basinId, var tab) async {
  //final response = await http.get('http://192.168.1.2:8000/products.json');
  final String url = basinId == 1
      ? "https://tele-maeklong.dwr.go.th/webservice/webservice_mk_json"
      : basinId == 2
          ? "https://tele-salawin.dwr.go.th/webservice/webservice_sl_json"
          : basinId == 3
              ? "https://tele-kokkhong.dwr.go.th/webservice/webservice_kk_json"
              : "https://tele-maeklong.dwr.go.th/webservice/webservice_mk_json";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return parseStation(response.body, tab);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
