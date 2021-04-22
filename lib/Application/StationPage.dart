import 'dart:convert';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:dwr0001/Models/station_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/painting.dart' as painting;


class StationPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String stn_id;
  // ignore: non_constant_identifier_names
  StationPage({Key key, @required this.stn_id}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DefaultTabController(
        length: 4,
        child:
      MyDisplayClass(stn_id),
      ),
    );

  }
}

class MyDisplayClass extends StatelessWidget {
  MyDisplayClass(this.stnId);
  var stnId;
  StationModel stationData;
  String _title = 'ข้อมูลตรวจวัด';

  String get family => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh_outlined) ,
      onPressed: () async{
            await loadData();
      }),

      appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.pending_actions_sharp)),
              Tab(icon: Icon(Icons.table_rows_outlined)),
              Tab(icon: Icon(Icons.bar_chart_outlined)),
              Tab(icon: Icon(Icons.camera)),
            ],
          ),
        title: Text(_title),
        elevation: 10.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.blue,
                Colors.lightBlueAccent
              ],
            ),
          ),
        ),
      ),
      body: WillPopScope(onWillPop: () {
        painting.imageCache.clear();
        Navigator.of(context).pop(true);

      },
        child:       TabBarView(
    children: [
      Container(
        child: FutureBuilder<StationModel>(
          future: getStation(stnId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final StationModel station = snapshot.data;
              var CURR_Acc_Rain_15_M_ = "";
              var CURR_Acc_Rain_30_M_ = "";
              var CURR_Acc_Rain_60_M_ = "";
              var CURR_Acc_Rain_1_d_ = "";
              var CURR_Acc_Rain_12_H_ = "";
              var CURR_Water_D_Level_MSL_ = "";
              var CURR_FLOW_ = "";

              if (station.RF == "")
                {
                   CURR_Acc_Rain_15_M_ = "-";
                   CURR_Acc_Rain_30_M_ = "-";
                   CURR_Acc_Rain_60_M_ = "-";
                   CURR_Acc_Rain_1_d_ = "-";
                   CURR_Acc_Rain_12_H_ = "-";

                }else
                  {
                    CURR_Acc_Rain_15_M_ = station.CURR_Acc_Rain_15_M;
                    CURR_Acc_Rain_30_M_ = station.CURR_Acc_Rain_30_M;
                    CURR_Acc_Rain_60_M_ = station.CURR_Acc_Rain_60_M;
                    CURR_Acc_Rain_1_d_ = station.CURR_Acc_Rain_1_D;
                    CURR_Acc_Rain_12_H_ = station.CURR_Acc_Rain_12_H;
                  }

              if (station.WL == "")
              {
                CURR_Water_D_Level_MSL_ = "-";
                CURR_FLOW_ = "-";


              }else
              {
                CURR_Water_D_Level_MSL_ = station.CURR_Water_D_Level_MSL;
                CURR_FLOW_ = station.CURR_FLOW;
              }


              ////print('Response JsonDecode: $station');
              //return Text(station.length.toString());
              _title = "สถานี : " + station.STN_Name;

              return (
              Container(
                color: Color(0x30fafaaa),
                  padding: EdgeInsets.all(14.0),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        color: Colors.lightBlueAccent,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('ชื่อสถานี :' + station.STN_Name,textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),

                        ),
                      ),
                      Card(
                        color: Colors.lightBlueAccent,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'หมายเลขสถานี :' + station.STN_ID,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white10,
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'วันที่/เวลาในการบันทึกข้อมูล : ' + station.LAST_UPDATE,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 20,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),

                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[

                            Text(
                              'ปริมาณฝน',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,

                              ),
                            ),
                                Text(
                                  'สะสม 15 นาที',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12.0,

                                  ),
                                ),
                            ]
                          ),
                          ),

                          Container(
                              width: 120,
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 1,
                                ),
                              ),

                              child: Text(CURR_Acc_Rain_15_M_,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 30),
                              )

                          ),
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 60,
                                child: Text(
                                  'มม.',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 5,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 20,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[

                                  Text(
                                    'ปริมาณฝน',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16.0,

                                    ),
                                  ),
                                  Text(
                                    'สะสม 30 นาที',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12.0,

                                    ),
                                  ),
                                ]
                            ),
                          ),


                          Container(
                              width: 120,
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 1,
                                ),
                              ),

                              child: Text(CURR_Acc_Rain_30_M_,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 30),
                              )

                          ),
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 60,
                                child: Text(
                                  'มม.',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 5,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 20,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[

                                  Text(
                                    'ปริมาณฝน',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16.0,

                                    ),
                                  ),
                                  Text(
                                    'สะสม 60 นาที',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12.0,

                                    ),
                                  ),
                                ]
                            ),
                          ),

                          Container(
                              width: 120,
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 1,
                                ),
                              ),

                              child: Text(CURR_Acc_Rain_60_M_,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 30),
                              )

                          ),
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 60,
                                child: Text(
                                  'มม.',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 5,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 20,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[

                                  Text(
                                    'ปริมาณฝน',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16.0,

                                    ),
                                  ),
                                  Text(
                                    'สะสม 12 ชั่วโมง',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12.0,

                                    ),
                                  ),
                                ]
                            ),
                          ),

                          Container(
                              width: 120,
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 1,
                                ),
                              ),

                              child: Text(CURR_Acc_Rain_12_H_,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 30),
                              )

                          ),

                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 60,
                                child: Text(
                                  'มม.',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 5,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 20,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            child: Text(
                              'ระดับน้ำ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,

                              ),
                            ),
                          ),
                          Container(
                              width: 120,
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 1,
                                ),
                              ),

                              child: Text(CURR_Water_D_Level_MSL_,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 30),
                              )

                          ),

                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 60,
                                child: Text(
                                  'ม.รทก.',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                          ),
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 5,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),

                      SizedBox(
                        height: 3.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 20,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            child: Text(
                              'ปริมาณน้ำ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,

                              ),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 40,
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black45,
                                width: 1,
                              ),
                            ),

                                child: Text(CURR_FLOW_,
                                  textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 30),
                                )

                          ),


                          Container(

                              child: SizedBox(
                                height: 40.0,
                                width: 60,
                                child: Text(
                                  'ลบม./\nวินาที',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                          ),
                          Container(
                              child: SizedBox(
                                height: 40.0,
                                width: 5,
                                child: Text('',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ]
                  )
              )
              );
            } else if (snapshot.hasError) {
              //print('snapshot.error: ${snapshot.error.toString()}');
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      Container(
          child: FutureBuilder<dynamic>(
              future: loadData(),
              builder: (context,snapshot){
                return Container(
                  child: DataTable(
                columns: [
                DataColumn(label: Text("วันที่/เวลา"),
                numeric: false,
                onSort: (i,b) {}),
                  DataColumn(label: Text("ปริมาณฝน"),
                      numeric: false,

                      onSort: (i,b) {}),
                  DataColumn(label: Text("ระดับน้ำ"),
                      numeric: false,
                      onSort: (i,b) {}),
                  DataColumn(label: Text("วปริมาณน้ำ"),
                      numeric: false,
                      onSort: (i,b) {})
                ],

                rows: <DataRow>[

                ]
                ),

                );
              }

          )

        //



      ),
      Container(
        child: FutureBuilder<StationModel>(
          future: getStationData(stnId),
          builder: (context, snapshot) {
            if (snapshot.hasData){
               stationData = snapshot.data;

            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("กราฟแสดงปริมาณฝน (มม.)"),
                Container(
                  color: Colors.white70,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: BezierChart(
                    bezierChartScale: BezierChartScale.CUSTOM,
                    xAxisCustomValues: const [0, 2, 4, 6, 8, 10, 12, 14,16, 18, 20, 22, 24],
                    series: const [
                      BezierLine(
                        data: const [
                          DataPoint<double>(value: 0.0, xAxis: 0),
                          DataPoint<double>(value: 0.0, xAxis: 2),
                          DataPoint<double>(value: 0.0, xAxis: 4),
                          DataPoint<double>(value: 0.0, xAxis: 6),
                          DataPoint<double>(value: 0.0, xAxis: 8),
                          DataPoint<double>(value: 0.0, xAxis: 10),
                          DataPoint<double>(value: 0.0, xAxis: 12),
                          DataPoint<double>(value: 0.0, xAxis: 14),
                          DataPoint<double>(value: 0.0, xAxis: 16),
                          DataPoint<double>(value: 0.0, xAxis: 18),
                          DataPoint<double>(value: 0.0, xAxis: 20),
                          DataPoint<double>(value: 0.0, xAxis: 22),
                          DataPoint<double>(value: 0.0, xAxis: 24),
                        ],
                      ),
                    ],
                    config: BezierChartConfig(
                      verticalIndicatorStrokeWidth: 1.0,
                      verticalIndicatorColor: Colors.black26,
                      showVerticalIndicator: true,
                      backgroundColor: Colors.black45,
                      snap: false,
                    ),
                  ),
                ),
              ],


            );
            }
            else if (snapshot.hasError)
            {return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          },
        )

      ),



      RefreshIndicator(onRefresh: () async {
        imageCache.clear();
        //String url = "your url";
        //await CachedNetworkImage.evictFromCache(url);
        await Future.delayed(Duration(seconds: 1));

      } ,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
        children: <Widget> [
          Text("ข้อมูลภาพ CCTV: " + stnId,
          textAlign: TextAlign.center,),
          Padding(padding: const EdgeInsets.all(8.0),
              child:  FadeInImage.assetNetwork(
                placeholder: 'image/loading1.gif',
                image: ('http://tele-maeklong.dwr.go.th/image/' + stnId + '/CCTV_image/Overview_1.jpg'),
          ),
          ),
          Padding(padding: const EdgeInsets.all(8.0),
            child:  FadeInImage.assetNetwork(
              placeholder: 'image/loading1.gif',
                image: ('http://tele-maeklong.dwr.go.th/image/' + stnId + '/CCTV_image/Staff_1.jpg'),
          ),
          )

        ]
      ),
      ),
    ),
    ],
      ),
    ),
    );
  }
}

Future<Null> _handleRefresh() {
  return null;
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
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final station = jsonDecode(response.body);
    print('Response JsonDecode: $station');
    return StationModel.fromJson(station);
  } else {
    throw Exception();
  }
}

List<StationModel> parseStation(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed
      .map<StationModel>((json) => StationModel.fromJson(json))
      .toList();
}

Future<List<StationModel>> getStationList() async {
  //final response = await http.get('http://192.168.1.2:8000/products.json');
  final String url =
      "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return parseStation(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
loadData() async {

  print("LoadData");
}
List<StationModel> parseData(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed
      .map<StationModel>((json) => StationModel.fromJson(json))
      .toList();
}


Future<StationModel> getStationData(String stn_id) async {
  //final String url ="http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json?stn_id=" + stn_id;
  final String url ="http://tele-maeklong.dwr.go.th/webservice/webservice_mk_Data_json?stn_id=" + stn_id;
  //https://localhost:44303/webservice/webservice_mk_json_id?stn_id=TC140805
  //final String url = "https://jsonplaceholder.typicode.com/todos/1";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final station = jsonDecode(response.body);
    print('Response JsonDecode: $station');
    return StationModel.fromJson(station);
  } else {
    throw Exception();
  }
}




