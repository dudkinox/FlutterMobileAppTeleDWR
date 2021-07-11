import 'package:dwr0001/Application/StationPage.dart';
import 'package:dwr0001/Models/station_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: must_be_immutable
class TabOne extends StatelessWidget {
  TabOne(this.stnId);
  var stnId;
  String _title = 'ข้อมูลตรวจวัด';
  // _title = "สถานี : " + station.STN_Name
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/banner/banner02/background04.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
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
                      CURR_Water_D_Level_MSL_ = station.CURR_Water_D_Level_MSL;
                      CURR_FLOW_ = station.CURR_FLOW;
                    }
                    _title = "สถานี : " + stnId + " " + station.STN_Name;
                    var _dateshow =
                        "วันที่บันทึกข้อมูล \n" + station.LAST_UPDATE;
                    return (Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10.0),
                              color: Colors.lightBlue[700],
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Text(
                                    _title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(2),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Righteous',
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              )),
                          SizedBox(height: size.height * 0.01),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'assets/TabOne/cloud.png'),
                                        width: size.width * 0.2,
                                      ),
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
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(2),
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Righteous',
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Text(
                                        "ปริมาณน้ำฝนสะสม",
                                        style: TextStyle(
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(2),
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Righteous',
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    Container(
                                      width: deviceWidth * 0.35,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.white,
                                              Colors.blue[500]
                                            ]),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            blurRadius: 3,
                                            offset: Offset(4,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                              child: Column(
                                            children: [
                                              new Image(
                                                image: AssetImage(
                                                    'assets/TabOne/hailstorm.png'),
                                                width: size.width * 0.1,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                ),
                                                padding: EdgeInsets.all(10.0),
                                                alignment: Alignment.topRight,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      station
                                                          .CURR_Acc_Rain_15_M,
                                                      style: TextStyle(
                                                          shadows: [
                                                            Shadow(
                                                              blurRadius: 4.0,
                                                              color: Colors
                                                                  .black87,
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                            ),
                                                          ],
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(4),
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Righteous',
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    Text(
                                                      "mm.",
                                                      style: TextStyle(
                                                          shadows: [
                                                            Shadow(
                                                              blurRadius: 0,
                                                              color: Colors
                                                                  .black87,
                                                              offset: Offset(
                                                                  1.0, 1.0),
                                                            ),
                                                          ],
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(2),
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Righteous',
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "15 นาที",
                                                        style: TextStyle(
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 0,
                                                                color: Colors
                                                                    .black87,
                                                                offset: Offset(
                                                                    1.0, 1.0),
                                                              ),
                                                            ],
                                                            fontSize:
                                                                ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        2),
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Righteous',
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: deviceWidth * 0.25,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.white,
                                                    Colors.blue[500]
                                                  ]),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  blurRadius: 3,
                                                  offset: Offset(4,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                new Image(
                                                  image: AssetImage(
                                                      'assets/TabOne/hailstorm.png'),
                                                  width: size.width * 0.1,
                                                ),
                                                Container(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white
                                                          .withOpacity(0.3),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          station
                                                              .CURR_Acc_Rain_30_M,
                                                          style: TextStyle(
                                                              shadows: [
                                                                Shadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Colors
                                                                      .black87,
                                                                  offset:
                                                                      Offset(
                                                                          2.0,
                                                                          2.0),
                                                                ),
                                                              ],
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          3),
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Righteous',
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                        Text(
                                                          " mm.",
                                                          style: TextStyle(
                                                              shadows: [
                                                                Shadow(
                                                                  blurRadius: 0,
                                                                  color: Colors
                                                                      .black87,
                                                                  offset:
                                                                      Offset(
                                                                          1.0,
                                                                          1.0),
                                                                ),
                                                              ],
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          2),
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Righteous',
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "30 นาที",
                                                            style: TextStyle(
                                                                shadows: [
                                                                  Shadow(
                                                                    blurRadius:
                                                                        0,
                                                                    color: Colors
                                                                        .black87,
                                                                    offset:
                                                                        Offset(
                                                                            1.0,
                                                                            1.0),
                                                                  ),
                                                                ],
                                                                fontSize: ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        2),
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Righteous',
                                                                decoration:
                                                                    TextDecoration
                                                                        .none),
                                                          ),
                                                        )
                                                      ],
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.05),
                                          Container(
                                            width: deviceWidth * 0.25,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.white,
                                                    Colors.blue[500]
                                                  ]),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  blurRadius: 3,
                                                  offset: Offset(4,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                new Image(
                                                  image: AssetImage(
                                                      'assets/TabOne/hailstorm.png'),
                                                  width: size.width * 0.1,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white
                                                        .withOpacity(0.3),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        station
                                                            .CURR_Acc_Rain_60_M,
                                                        style: TextStyle(
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 4.0,
                                                                color: Colors
                                                                    .black87,
                                                                offset: Offset(
                                                                    2.0, 2.0),
                                                              ),
                                                            ],
                                                            fontSize:
                                                                ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        3),
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Righteous',
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                      Text(
                                                        " mm.",
                                                        style: TextStyle(
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 0,
                                                                color: Colors
                                                                    .black87,
                                                                offset: Offset(
                                                                    1.0, 1.0),
                                                              ),
                                                            ],
                                                            fontSize:
                                                                ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        2),
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Righteous',
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "60 นาที",
                                                          style: TextStyle(
                                                              shadows: [
                                                                Shadow(
                                                                  blurRadius: 0,
                                                                  color: Colors
                                                                      .black87,
                                                                  offset:
                                                                      Offset(
                                                                          1.0,
                                                                          1.0),
                                                                ),
                                                              ],
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          2),
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Righteous',
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.05),
                                          Container(
                                            width: deviceWidth * 0.25,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.white,
                                                    Colors.blue[500]
                                                  ]),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  blurRadius: 3,
                                                  offset: Offset(4,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                new Image(
                                                  image: AssetImage(
                                                      'assets/TabOne/hailstorm.png'),
                                                  width: size.width * 0.1,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white
                                                        .withOpacity(0.3),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        station
                                                            .CURR_Acc_Rain_12_H,
                                                        style: TextStyle(
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 4.0,
                                                                color: Colors
                                                                    .black87,
                                                                offset: Offset(
                                                                    2.0, 2.0),
                                                              ),
                                                            ],
                                                            fontSize:
                                                                ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        3),
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Righteous',
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                      Text(
                                                        " mm.",
                                                        style: TextStyle(
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 0,
                                                                color: Colors
                                                                    .black87,
                                                                offset: Offset(
                                                                    1.0, 1.0),
                                                              ),
                                                            ],
                                                            fontSize:
                                                                ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        2),
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Righteous',
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "12 ชั่วโมง",
                                                          style: TextStyle(
                                                              shadows: [
                                                                Shadow(
                                                                  blurRadius: 0,
                                                                  color: Colors
                                                                      .black87,
                                                                  offset:
                                                                      Offset(
                                                                          1.0,
                                                                          1.0),
                                                                ),
                                                              ],
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          2),
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Righteous',
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                                ]),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "ระดับน้ำ",
                                          style: TextStyle(
                                              fontSize:
                                                  ResponsiveFlutter.of(context)
                                                      .fontSize(2),
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Righteous',
                                              decoration: TextDecoration.none),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white,
                                                Colors.blue[500]
                                              ]),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              blurRadius: 3,
                                              offset: Offset(4,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            new Image(
                                              image: AssetImage(
                                                  'assets/TabOne/tide.png'),
                                              width: size.width * 0.2,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white
                                                          .withOpacity(0.3),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          station.WL == ""
                                                              ? "-"
                                                              : station
                                                                  .CURR_Water_D_Level_MSL,
                                                          style: TextStyle(
                                                              shadows: [
                                                                Shadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Colors
                                                                      .black87,
                                                                  offset:
                                                                      Offset(
                                                                          2.0,
                                                                          2.0),
                                                                ),
                                                              ],
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          2.5),
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Righteous',
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                        Text(
                                                          "ม.รทก.",
                                                          style: TextStyle(
                                                              shadows: [
                                                                Shadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Colors
                                                                      .black87,
                                                                  offset:
                                                                      Offset(
                                                                          2.0,
                                                                          2.0),
                                                                ),
                                                              ],
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          2),
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Righteous',
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      ],
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: size.width * 0.05),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "ปริมาณน้ำ",
                                          style: TextStyle(
                                              fontSize:
                                                  ResponsiveFlutter.of(context)
                                                      .fontSize(2),
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Righteous',
                                              decoration: TextDecoration.none),
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.white,
                                                  Colors.blue[500]
                                                ]),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                blurRadius: 3,
                                                offset: Offset(4,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            children: [
                                              new Image(
                                                image: AssetImage(
                                                    'assets/TabOne/tide.png'),
                                                width: size.width * 0.2,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            station.CURR_FLOW,
                                                            style: TextStyle(
                                                                shadows: [
                                                                  Shadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Colors
                                                                        .black87,
                                                                    offset:
                                                                        Offset(
                                                                            2.0,
                                                                            2.0),
                                                                  ),
                                                                ],
                                                                fontSize: ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        2.5),
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Righteous',
                                                                decoration:
                                                                    TextDecoration
                                                                        .none),
                                                          ),
                                                          Text(
                                                            "ม.รทก.",
                                                            style: TextStyle(
                                                                shadows: [
                                                                  Shadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Colors
                                                                        .black87,
                                                                    offset:
                                                                        Offset(
                                                                            2.0,
                                                                            2.0),
                                                                  ),
                                                                ],
                                                                fontSize: ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        2),
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Righteous',
                                                                decoration:
                                                                    TextDecoration
                                                                        .none),
                                                          ),
                                                        ],
                                                      ))
                                                ],
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
