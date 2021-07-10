import 'package:dwr0001/Models/data_Model.dart';
import 'package:flutter/material.dart';

import '../StationPage.dart';

// ignore: must_be_immutable
class TabTwo extends StatelessWidget {
  TabTwo(this.stnId);
  var stnId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DataModelGet>>(
        future: getStationData24H(stnId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DataModelGet> data = snapshot.data;
            print(data);
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith<Color>(
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
                                        fontWeight: FontWeight.normal),
                                  )),
                            ),
                            DataCell(
                              Container(
                                  width: 50,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(data_.Rain_15_M.toString(),
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'Kanit',
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.right)),
                            ),
                            DataCell(
                              Container(
                                  width: 50,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(data_.Water_D.toString(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontWeight: FontWeight.normal))),
                            ),
                            DataCell(
                              Container(
                                  width: 50,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    data_.Water_F.toString(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.normal),
                                  )),
                            ),
                          ]))
                      .toList()),
            );
          } else {
            return Container();
          }
        });
  }
}
