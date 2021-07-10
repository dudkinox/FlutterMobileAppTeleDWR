import 'package:dwr0001/Application/StationPage.dart';
import 'package:dwr0001/Models/station_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabOne extends StatelessWidget {
  TabOne(this.stnId);
  var stnId;
  String _title = 'ข้อมูลตรวจวัด';
  // _title = "สถานี : " + station.STN_Name
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
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              CustomPaint(painter: CurvePainter()),
              FutureBuilder<StationModel>(
                  future: getStation(stnId),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    final StationModel station = snapshot.data;
                    if (snapshot.hasData) {
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
                      print('Response JsonDecode: $station');
                      _title = "สถานี : " + stnId + "\n" + station.STN_Name;
                      var _dateshow =
                          "วันที่บันทึกข้อมูล \n" + station.LAST_UPDATE;
                      return (Container(
                        child: Column(
                          children: [
                            Text(
                              _title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      blurRadius: 4.0,
                                      color: Colors.black87,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                  fontSize: 23,
                                  color: Colors.blue[400],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Righteous',
                                  decoration: TextDecoration.none),
                            ),
                            Container(
                              padding: EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _dateshow,
                                    style: TextStyle(
                                        shadows: [
                                          Shadow(
                                            blurRadius: 0,
                                            color: Colors.black87,
                                            offset: Offset(1.0, 1.0),
                                          ),
                                        ],
                                        fontSize: 15,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Righteous',
                                        decoration: TextDecoration.none),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.2,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/TabOne/cloud.png'),
                                    width: size.width * 0.2,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: size.width * 0.05),
                                Column(
                                  children: [
                                    new Image(
                                      image: AssetImage(
                                          'assets/TabOne/cloud_rain.png'),
                                      width: size.width * 0.1,
                                    ),
                                    Text(
                                      station.CURR_Acc_Rain_15_M + " มม.",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 4.0,
                                              color: Colors.black87,
                                              offset: Offset(2.0, 2.0),
                                            ),
                                          ],
                                          fontSize: 24,
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous',
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "ปริมาณน้ำฝน",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 0,
                                              color: Colors.black87,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 18,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous',
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "สะสม 15 นาที",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 0,
                                              color: Colors.black87,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 15,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous',
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                                SizedBox(width: size.width * 0.05),
                                Column(
                                  children: [
                                    new Image(
                                      image: AssetImage(
                                          'assets/TabOne/cloud_rain.png'),
                                      width: size.width * 0.1,
                                    ),
                                    Text(
                                      station.CURR_Acc_Rain_30_M + " มม.",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 4.0,
                                              color: Colors.black87,
                                              offset: Offset(2.0, 2.0),
                                            ),
                                          ],
                                          fontSize: 24,
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous',
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "ปริมาณน้ำฝน",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 0,
                                              color: Colors.black87,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 18,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous',
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "สะสม 30 นาที",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 0,
                                              color: Colors.black87,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 15,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous',
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                                SizedBox(width: size.width * 0.05),
                                Column(
                                  children: [
                                    new Image(
                                      image: AssetImage(
                                          'assets/TabOne/cloud_rain.png'),
                                      width: size.width * 0.1,
                                    ),
                                    Text(
                                      station.CURR_Acc_Rain_60_M + " มม.",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 4.0,
                                              color: Colors.black87,
                                              offset: Offset(2.0, 2.0),
                                            ),
                                          ],
                                          fontSize: 24,
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous',
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "ปริมาณน้ำฝน",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 0,
                                              color: Colors.black87,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 18,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous',
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "สะสม 60 นาที",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 0,
                                              color: Colors.black87,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 15,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Righteous',
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: size.width * 0.05),
                                      Column(
                                        children: [
                                          new Image(
                                            image: AssetImage(
                                                'assets/TabOne/cloud_rain.png'),
                                            width: size.width * 0.1,
                                          ),
                                          Text(
                                            station.CURR_Acc_Rain_12_H + " มม.",
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 4.0,
                                                    color: Colors.black87,
                                                    offset: Offset(2.0, 2.0),
                                                  ),
                                                ],
                                                fontSize: 24,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Righteous',
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "ปริมาณน้ำฝน",
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 0,
                                                    color: Colors.black87,
                                                    offset: Offset(1.0, 1.0),
                                                  ),
                                                ],
                                                fontSize: 18,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Righteous',
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "สะสม 12 ชั่วโมง",
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 0,
                                                    color: Colors.black87,
                                                    offset: Offset(1.0, 1.0),
                                                  ),
                                                ],
                                                fontSize: 15,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Righteous',
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: size.width * 0.05),
                                      Column(
                                        children: [
                                          new Image(
                                            image: AssetImage(
                                                'assets/TabOne/water_level.png'),
                                            width: size.width * 0.1,
                                          ),
                                          Text(
                                            station.WL == ""
                                                ? "-"
                                                : station
                                                    .CURR_Water_D_Level_MSL,
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 4.0,
                                                    color: Colors.black87,
                                                    offset: Offset(2.0, 2.0),
                                                  ),
                                                ],
                                                fontSize: 18,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Righteous',
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "ม.รทก.",
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 4.0,
                                                    color: Colors.black87,
                                                    offset: Offset(2.0, 2.0),
                                                  ),
                                                ],
                                                fontSize: 18,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Righteous',
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "ระดับน้ำ",
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 0,
                                                    color: Colors.black87,
                                                    offset: Offset(1.0, 1.0),
                                                  ),
                                                ],
                                                fontSize: 18,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Righteous',
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: size.width * 0.05),
                                      Column(
                                        children: [
                                          new Image(
                                            image: AssetImage(
                                                'assets/TabOne/water_level.png'),
                                            width: size.width * 0.1,
                                          ),
                                          Text(
                                            station.CURR_FLOW,
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 4.0,
                                                    color: Colors.black87,
                                                    offset: Offset(2.0, 2.0),
                                                  ),
                                                ],
                                                fontSize: 18,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Righteous',
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "ลบม. / วินาที",
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 4.0,
                                                    color: Colors.black87,
                                                    offset: Offset(2.0, 2.0),
                                                  ),
                                                ],
                                                fontSize: 18,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Righteous',
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "ปริมาณน้ำ",
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 0,
                                                    color: Colors.black87,
                                                    offset: Offset(1.0, 1.0),
                                                  ),
                                                ],
                                                fontSize: 18,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Righteous',
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
