import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

// ignore: must_be_immutable
class TabFour extends StatelessWidget {
  TabFour(this.stnId, this.basinId, this.CCTV);
  var stnId;
  var basinId;
  var CCTV;
  var basinName;
  @override
  Widget build(BuildContext context) {
    basinName = basinId == 1
        ? "maeklong"
        : basinId == 2
            ? "salawin"
            : basinId == 3
                ? "kokkhong"
                : "kokkhong";
    // if (basinId == 1) {
    //   basinName = 'maeklong';
    // }
    // if (basinId == 2) {
    //   basinName = 'salawin';
    // }

    // if (basinId == 3) {
    //   basinName = 'kokkhong';
    // }

    if (CCTV == "") {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: <Widget>[
            Text(
              "สถานีนี้ไม่มีข้อมูล CCTV",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.normal),
            )
          ]));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: <Widget>[
        Text(
          "ข้อมูลภาพ CCTV: " + stnId,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.normal),
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
                child: FullScreenWidget(
                    child: ClipRRect(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading1.gif',
                    image: ('https://tele-' +
                        basinName +
                        '.dwr.go.th/image/' +
                        stnId +
                        '/CCTV_image/Overview_1.jpg'),
                  ),
                ))),
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
              child: FullScreenWidget(
                child: ClipRRect(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading1.gif',
                    image: ('https://tele-' +
                        basinName +
                        '.dwr.go.th/image/' +
                        stnId +
                        '/CCTV_image/Staff_1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
