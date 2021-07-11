import 'package:avatar_glow/avatar_glow.dart';
import 'package:dwr0001/Models/station_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

import '../OverViewPage.dart';
import '../StationPage.dart';

// ignore: must_be_immutable
class TabTwoStation extends StatelessWidget {
  TabTwoStation(basinID);
  var basinID;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StationModel>>(
      future: getStationListTab(basinID, "2"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<StationModel> station = snapshot.data;
          if (station.length <= 0) {
            return Text(
              "ไม่พบข้อมูลการแจ้งเตือน",
            );
          } else {
            return ListView.builder(
              itemCount: station.length,
              itemBuilder: (context, int i) => Column(
                children: [
                  new ListTile(
                    leading: Container(
                      child: AvatarGlow(
                        glowColor: Colors.blue,
                        endRadius: 35.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 200),
                        child: CircleAvatar(
                          radius: 18.0,
                          child: CircleAvatar(
                            radius: 0,
                            backgroundColor: Colors.greenAccent,
                          ),
                          backgroundColor: station[i].CURR_STATUS == "0"
                              ? Colors.green
                              : station[i].CURR_STATUS == "1"
                                  ? Colors.green
                                  : station[i].CURR_STATUS == "2"
                                      ? Colors.green
                                      : station[i].CURR_STATUS == "3"
                                          ? Colors.white
                                          : station[i].CURR_STATUS == "4"
                                              ? Colors.grey
                                              : station[i].CURR_STATUS == "5"
                                                  ? Colors.black
                                                  : Colors.green,
                        ),
                      ),
                    ),
                    title: new Text(
                      station[i].STN_ID,
                      style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Kanit',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                    ),
                    subtitle: new Text(
                      station[i].STN_Name,
                      style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Kanit',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w200),
                    ),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        Image.asset(
                          station[i].CURR_STATUS == "0"
                              ? 'assets/banner/bell/green.png'
                              : station[i].CURR_STATUS == "1"
                                  ? "assets/banner/bell/yellow.png"
                                  : station[i].CURR_STATUS == "2"
                                      ? "assets/banner/bell/red.png"
                                      : station[i].CURR_STATUS == "3"
                                          ? "assets/banner/bell/gray.png"
                                          : station[i].CURR_STATUS == "4"
                                              ? "assets/banner/bell/gray.png"
                                              : station[i].CURR_STATUS == "5"
                                                  ? "assets/banner/bell/gray.png"
                                                  : "",
                          height: 40,
                        ),
                        // icon-1
                        Icon(Icons.arrow_forward_ios), // icon-2
                      ],
                    ),
                    onTap: () async {
                      await FlutterSession().set('river', basinID.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StationPage(
                                    stn_id: station[i].STN_ID,
                                    basinID: basinID,
                                  )));
                    },
                    onLongPress: () async {},
                  ),
                  new ListBody(
                    children: <Widget>[],
                  )
                ],
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return CircularProgressIndicator();
      },
    );
  }
}
