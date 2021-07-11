import 'package:dwr0001/Models/data_Model.dart';
import 'package:dwr0001/screen/welcome/welcome.dart';
import 'package:flutter/material.dart';

import '../StationPage.dart';

// ignore: must_be_immutable
class TabThree extends StatelessWidget {
  TabThree(this.stnId);
  var stnId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DataModelGet>>(
      future: getStationData24H(stnId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DataModelGet> data = snapshot.data;
          return AreaAndLineChart.withSampleData(data);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return CircularProgressIndicator();
      },
    );
  }
}

// return SingleChildScrollView(
          //     child: Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Container(
          //     color: Colors.white70,
          //     height: MediaQuery.of(context).size.height / 2,
          //     width: MediaQuery.of(context).size.width * 0.9,
          //     child: BezierChart(
          //       bezierChartScale: BezierChartScale.CUSTOM,
          //       xAxisCustomValues: const [
          //         0,
          //         2,
          //         4,
          //         6,
          //         8,
          //         10,
          //         12,
          //         14,
          //         16,
          //         18,
          //         20,
          //         22,
          //         24
          //       ],
          //       series: [
          //         BezierLine(
          //           lineColor: Colors.lightBlueAccent,
          //           lineStrokeWidth: 1.0,
          //           label: "ปริมาณฝน (มม.)",
          //           data: [
          //             DataPoint<double>(
          //                 value: double.parse(data[0].Rain_15_M), xAxis: 0),
          //             DataPoint<double>(
          //                 value: double.parse(data[8].Rain_15_M), xAxis: 2),
          //             DataPoint<double>(
          //                 value: double.parse(data[16].Rain_15_M), xAxis: 4),
          //             DataPoint<double>(
          //                 value: double.parse(data[24].Rain_15_M), xAxis: 6),
          //             DataPoint<double>(
          //                 value: double.parse(data[32].Rain_15_M), xAxis: 8),
          //             DataPoint<double>(
          //                 value: double.parse(data[40].Rain_15_M), xAxis: 10),
          //             DataPoint<double>(
          //                 value: double.parse(data[48].Rain_15_M), xAxis: 12),
          //             DataPoint<double>(
          //                 value: double.parse(data[56].Rain_15_M), xAxis: 14),
          //             DataPoint<double>(
          //                 value: double.parse(data[64].Rain_15_M), xAxis: 16),
          //             DataPoint<double>(
          //                 value: double.parse(data[72].Rain_15_M), xAxis: 18),
          //             DataPoint<double>(
          //                 value: double.parse(data[80].Rain_15_M), xAxis: 20),
          //             DataPoint<double>(
          //                 value: double.parse(data[88].Rain_15_M), xAxis: 22),
          //             DataPoint<double>(
          //                 value: double.parse(data[94].Rain_15_M), xAxis: 24),
          //           ],
          //         ),
          //         BezierLine(
          //           lineColor: Colors.green,
          //           lineStrokeWidth: 1.0,
          //           label: "ปริมาณน้ำ (ม.รทก.)",
          //           data: [
          //             DataPoint<double>(
          //                 value: double.parse(data[0].Water_D), xAxis: 0),
          //             DataPoint<double>(
          //                 value: double.parse(data[8].Water_D), xAxis: 2),
          //             DataPoint<double>(
          //                 value: double.parse(data[16].Water_D), xAxis: 4),
          //             DataPoint<double>(
          //                 value: double.parse(data[24].Water_D), xAxis: 6),
          //             DataPoint<double>(
          //                 value: double.parse(data[32].Water_D), xAxis: 8),
          //             DataPoint<double>(
          //                 value: double.parse(data[40].Water_D), xAxis: 10),
          //             DataPoint<double>(
          //                 value: double.parse(data[48].Water_D), xAxis: 12),
          //             DataPoint<double>(
          //                 value: double.parse(data[56].Water_D), xAxis: 14),
          //             DataPoint<double>(
          //                 value: double.parse(data[64].Water_D), xAxis: 16),
          //             DataPoint<double>(
          //                 value: double.parse(data[72].Water_D), xAxis: 18),
          //             DataPoint<double>(
          //                 value: double.parse(data[80].Water_D), xAxis: 20),
          //             DataPoint<double>(
          //                 value: double.parse(data[88].Water_D), xAxis: 22),
          //             DataPoint<double>(
          //                 value: double.parse(data[94].Water_D), xAxis: 24),
          //           ],
          //         ),
          //       ],
          //       config: BezierChartConfig(
          //         verticalIndicatorStrokeWidth: 1.0,
          //         verticalIndicatorColor: Colors.black26,
          //         showVerticalIndicator: true,
          //         backgroundColor: Colors.black45,
          //         snap: false,
          //       ),
          //     ),
          //   ),
          // ));