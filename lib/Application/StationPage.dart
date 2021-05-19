import 'dart:convert';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:dwr0001/Models/station_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/painting.dart' as painting;

import '../Models/data_Model.dart';

class StationPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String stn_id;
  // ignore: non_constant_identifier_names
  StationPage({Key key, @required this.stn_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: MyDisplayClass(stn_id),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyDisplayClass extends StatelessWidget {
  MyDisplayClass(this.stnId);
  var stnId;
  StationModel stationData;
  String _title = 'ข้อมูลตรวจวัด';

  String get family => null;
  // final List<DataModelGet> data_ = FutureBuilder List<DataModelGet>>(
  //    future: getStationData(basinID),
  //     builder: (context, snapshot) {
  //      if (snapshot.hasData) {
  //        return (snapshot.data)
  //      }else{
  //        return new DataModelGet({"Label":""})
  //      }
  //    }

  //);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh_outlined),
          onPressed: () async {
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
        title: Text(
          'TELEDWR-ข้อมูลตรวจวัด',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Kanit',
              fontSize: 18.0,
              fontWeight: FontWeight.w700),
        ),
        elevation: 10.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
        },
        child: TabBarView(
          children: [
            Container(
              child: Column(
                children: [
                  CustomPaint(painter: CurvePainter()),
                  FutureBuilder<StationModel>(
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

                        if (station.RF == "") {
                          CURR_Acc_Rain_15_M_ = "-";
                          CURR_Acc_Rain_30_M_ = "-";
                          CURR_Acc_Rain_60_M_ = "-";
                          CURR_Acc_Rain_1_d_ = "-";
                          CURR_Acc_Rain_12_H_ = "-";
                        } else {
                          CURR_Acc_Rain_15_M_ = station.CURR_Acc_Rain_15_M;
                          CURR_Acc_Rain_30_M_ = station.CURR_Acc_Rain_30_M;
                          CURR_Acc_Rain_60_M_ = station.CURR_Acc_Rain_60_M;
                          CURR_Acc_Rain_1_d_ = station.CURR_Acc_Rain_1_D;
                          CURR_Acc_Rain_12_H_ = station.CURR_Acc_Rain_12_H;
                        }

                        if (station.WL == "") {
                          CURR_Water_D_Level_MSL_ = "-";
                          CURR_FLOW_ = "-";
                        } else {
                          CURR_Water_D_Level_MSL_ =
                              station.CURR_Water_D_Level_MSL;
                          CURR_FLOW_ = station.CURR_FLOW;
                        }

                        ////print('Response JsonDecode: $station');
                        //return Text(station.length.toString());
                        _title = "สถานี : " + station.STN_Name;

                        return (SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(14.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Card(
                                    color: Colors.lightBlueAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text(
                                        'ชื่อสถานี :' + station.STN_Name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Kanit',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
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
                                        style: TextStyle(
                                            fontFamily: 'Kanit',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.white10,
                                    child: Padding(
                                      padding: EdgeInsets.all(7.0),
                                      child: Text(
                                        'วันที่/เวลาในการบันทึกข้อมูล : ' +
                                            station.LAST_UPDATE,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Kanit',
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.1,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 20,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              Text(
                                                'ปริมาณฝน',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.black87,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Text(
                                                'สะสม 15 นาที',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.black87,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Container(
                                          width: 120,
                                          height: 40,
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black45,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            CURR_Acc_Rain_15_M_,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontFamily: 'Kanit',
                                                fontSize: 30),
                                          )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 60,
                                        child: Text(
                                          'มม.',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 5,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.1,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 20,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              Text(
                                                'ปริมาณฝน',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.black87,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Text(
                                                'สะสม 30 นาที',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.black87,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Container(
                                          width: 120,
                                          height: 40,
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black45,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            CURR_Acc_Rain_30_M_,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontFamily: 'Kanit',
                                                fontSize: 30),
                                          )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 60,
                                        child: Text(
                                          'มม.',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 5,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.1,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 20,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              Text(
                                                'ปริมาณฝน',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.black87,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Text(
                                                'สะสม 60 นาที',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.black87,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Container(
                                          width: 120,
                                          height: 40,
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black45,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            CURR_Acc_Rain_60_M_,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontFamily: 'Kanit',
                                                fontSize: 30),
                                          )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 60,
                                        child: Text(
                                          'มม.',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 5,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.1,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 20,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              Text(
                                                'ปริมาณฝน',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.black87,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Text(
                                                'สะสม 12 ชั่วโมง',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.black87,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Container(
                                          width: 120,
                                          height: 40,
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black45,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            CURR_Acc_Rain_12_H_,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontFamily: 'Kanit',
                                                fontSize: 30),
                                          )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 60,
                                        child: Text(
                                          'มม.',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 5,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.1,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 20,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Text(
                                          'ระดับน้ำ',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          width: 120,
                                          height: 40,
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black45,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            CURR_Water_D_Level_MSL_,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontFamily: 'Kanit',
                                                fontSize: 30),
                                          )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 60,
                                        child: Text(
                                          'ม.รทก.',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 5,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
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
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Text(
                                          'ปริมาณน้ำ',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          width: 120,
                                          height: 40,
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black45,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            CURR_FLOW_,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontFamily: 'Kanit',
                                                fontSize: 30),
                                          )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 60,
                                        child: Text(
                                          'ลบม./\nวินาที',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          child: SizedBox(
                                        height: 40.0,
                                        width: 5,
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ])));
                      } else if (snapshot.hasError) {
                        //print('snapshot.error: ${snapshot.error.toString()}');
                        return Text(snapshot.error.toString());
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
            Container(
                child: FutureBuilder<List<DataModelGet>>(
                    future: getStationData24H(stnId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<DataModelGet> data = snapshot.data;
                        print(data);
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                              headingRowColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.08);
                                return null; // Use the default value.
                              }),
                              columnSpacing: 0.0,
                              columns: [
                                DataColumn(
                                    label: Text("วันที่/เวลา",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'Kanit',
                                            fontWeight: FontWeight.bold)),
                                    numeric: false,
                                    onSort: (i, b) {}),
                                DataColumn(
                                    label: Text("ปริมาณฝน\r\n(มม.)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'Kanit',
                                          fontWeight: FontWeight.bold,
                                        )),
                                    numeric: false,
                                    onSort: (i, b) {}),
                                DataColumn(
                                    label: Text("ระดับน้ำ\r\n(ม.รทก.)",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'Kanit',
                                            fontWeight: FontWeight.bold)),
                                    numeric: false,
                                    onSort: (i, b) {}),
                                DataColumn(
                                    label: Text("ปริมาณน้ำ\r\n(ลบ.ม./วิ)",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'Kanit',
                                            fontWeight: FontWeight.bold)),
                                    numeric: false,
                                    onSort: (i, b) {})
                              ],
                              rows: data
                                  .map((data_) => DataRow(cells: [
                                        DataCell(
                                          Container(
                                              width: 100,
                                              child: Text(
                                                data_.Label.toString(),
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontFamily: 'Kanit',
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                        ),
                                        DataCell(
                                          Container(
                                              width: 50,
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              child: Text(
                                                  data_.Rain_15_M.toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontFamily: 'Kanit',
                                                      fontWeight:
                                                          FontWeight.normal),
                                                  textAlign: TextAlign.right)),
                                        ),
                                        DataCell(
                                          Container(
                                              width: 50,
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              child: Text(
                                                  data_.Water_D.toString(),
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: 'Kanit',
                                                      fontWeight:
                                                          FontWeight.normal))),
                                        ),
                                        DataCell(
                                          Container(
                                              width: 50,
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              child: Text(
                                                data_.Water_F.toString(),
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontFamily: 'Kanit',
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                        ),
                                      ]))
                                  .toList()),
                        );
                      } else {
                        return Container();
                      }
                    })

                //

                ),
            Container(
                child: FutureBuilder<List<DataModelGet>>(
              future: getStationData24H(stnId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<DataModelGet> data = snapshot.data;
                  print(data);
                  return SingleChildScrollView(
                      child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      color: Colors.white70,
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: BezierChart(
                        bezierChartScale: BezierChartScale.CUSTOM,
                        xAxisCustomValues: const [
                          0,
                          2,
                          4,
                          6,
                          8,
                          10,
                          12,
                          14,
                          16,
                          18,
                          20,
                          22,
                          24
                        ],
                        series: [
                          BezierLine(
                            lineColor: Colors.lightBlueAccent,
                            lineStrokeWidth: 1.0,
                            label: "ปริมาณฝน (มม.)",
                            data: [
                              DataPoint<double>(
                                  value: double.parse(data[0].Rain_15_M),
                                  xAxis: 0),
                              DataPoint<double>(
                                  value: double.parse(data[8].Rain_15_M),
                                  xAxis: 2),
                              DataPoint<double>(
                                  value: double.parse(data[16].Rain_15_M),
                                  xAxis: 4),
                              DataPoint<double>(
                                  value: double.parse(data[24].Rain_15_M),
                                  xAxis: 6),
                              DataPoint<double>(
                                  value: double.parse(data[32].Rain_15_M),
                                  xAxis: 8),
                              DataPoint<double>(
                                  value: double.parse(data[40].Rain_15_M),
                                  xAxis: 10),
                              DataPoint<double>(
                                  value: double.parse(data[48].Rain_15_M),
                                  xAxis: 12),
                              DataPoint<double>(
                                  value: double.parse(data[56].Rain_15_M),
                                  xAxis: 14),
                              DataPoint<double>(
                                  value: double.parse(data[64].Rain_15_M),
                                  xAxis: 16),
                              DataPoint<double>(
                                  value: double.parse(data[72].Rain_15_M),
                                  xAxis: 18),
                              DataPoint<double>(
                                  value: double.parse(data[80].Rain_15_M),
                                  xAxis: 20),
                              DataPoint<double>(
                                  value: double.parse(data[88].Rain_15_M),
                                  xAxis: 22),
                              DataPoint<double>(
                                  value: double.parse(data[94].Rain_15_M),
                                  xAxis: 24),
                            ],
                          ),
                          BezierLine(
                            lineColor: Colors.green,
                            lineStrokeWidth: 1.0,
                            label: "ปริมาณน้ำ (ม.รทก.)",
                            data: [
                              DataPoint<double>(
                                  value: double.parse(data[0].Water_D),
                                  xAxis: 0),
                              DataPoint<double>(
                                  value: double.parse(data[8].Water_D),
                                  xAxis: 2),
                              DataPoint<double>(
                                  value: double.parse(data[16].Water_D),
                                  xAxis: 4),
                              DataPoint<double>(
                                  value: double.parse(data[24].Water_D),
                                  xAxis: 6),
                              DataPoint<double>(
                                  value: double.parse(data[32].Water_D),
                                  xAxis: 8),
                              DataPoint<double>(
                                  value: double.parse(data[40].Water_D),
                                  xAxis: 10),
                              DataPoint<double>(
                                  value: double.parse(data[48].Water_D),
                                  xAxis: 12),
                              DataPoint<double>(
                                  value: double.parse(data[56].Water_D),
                                  xAxis: 14),
                              DataPoint<double>(
                                  value: double.parse(data[64].Water_D),
                                  xAxis: 16),
                              DataPoint<double>(
                                  value: double.parse(data[72].Water_D),
                                  xAxis: 18),
                              DataPoint<double>(
                                  value: double.parse(data[80].Water_D),
                                  xAxis: 20),
                              DataPoint<double>(
                                  value: double.parse(data[88].Water_D),
                                  xAxis: 22),
                              DataPoint<double>(
                                  value: double.parse(data[94].Water_D),
                                  xAxis: 24),
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
                  ));
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return CircularProgressIndicator();
              },
            )),
            RefreshIndicator(
              onRefresh: () async {
                imageCache.clear();
                //String url = "your url";
                //await CachedNetworkImage.evictFromCache(url);
                await Future.delayed(Duration(seconds: 1));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: <Widget>[
                  Text(
                    "ข้อมูลภาพ CCTV: " + stnId,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Kanit', fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FadeInImage.assetNetwork(
                        placeholder: 'image/loading1.gif',
                        image: ('http://tele-maeklong.dwr.go.th/image/' +
                            stnId +
                            '/CCTV_image/Overview_1.jpg'),
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'image/loading1.gif',
                          image: ('http://tele-maeklong.dwr.go.th/image/' +
                              stnId +
                              '/CCTV_image/Staff_1.jpg'),
                        ),),
                    ),
                  )
                ]),
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
  final String url =
      "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_Data_json?stn_id=" +
          stn_id;
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

List<DataModelGet> parseData_(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed
      .map<DataModelGet>((json) => DataModelGet.fromJson(json))
      .toList();
}

Future<List<DataModelGet>> getStationData24H(String stn_id) async {
  //final String url ="http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json?stn_id=" + stn_id;
  final String url =
      "http://tele-kokkhong.dwr.go.th/webservice/getdata?station_ID=" + stn_id;
  //https://localhost:44303/webservice/webservice_mk_json_id?stn_id=TC140805
  //final String url = "https://jsonplaceholder.typicode.com/todos/1";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    return parseData_(response.body);
  } else {
    throw Exception();
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // TODO: Set properties to paint

    var path = Path();

    // TODO: Draw your path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
