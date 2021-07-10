import 'package:dwr0001/Application/Menu.dart';
// import 'package:dwr0001/Application/OverViewPage.dart';
import 'package:dwr0001/app/signup/sign_in_button.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TELEDWR-หน้าหลัก'),
        elevation: 10.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ระบบติดตามสถานการณ์น้ำทางไกลอัตโนมัติ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
              // Text(
              //   'ลุ่มน้ำแม่กลอง',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
              // ),
              SizedBox(
                height: 5.0,
              ),
              // FadeInImage.assetNetwork(
              //   // placeholder: 'images/loading2.gif',
              //   image: ('http://tele-maeklong.dwr.go.th/image/Logodwr_r.png'),
              // ),
              SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 50.0,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Kanit',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // builder: (context) => OverViewPage()));
                            builder: (context) => MenuPage(
                                  data: '',
                                )));
                  },
                ),
              ),
            ]),
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      //color: Colors.black,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'TELEDWR',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
          ),
          Text(
            'ระบบติดตามสถานการณ์น้ำทางไกลอัตโนมัติ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          Text(
            '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5.0,
          ),
          FadeInImage.assetNetwork(
            placeholder: 'image/loading1.gif',
            image: ('http://tele-maeklong.dwr.go.th/image/Logodwr_r.png'),
          ),
          Image.network(
            'http://tele-maeklong.dwr.go.th/image/Logodwr_r.png',
            width: 150.0,
            height: 211,
          ),
          SizedBox(
            height: 7.0,
          ),
          SignInButton(
            height: 45.0,
            text: 'เข้าสู่ระบบ',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(
            height: 7.0,
          ),
        ],
      ),
    );
  }
}
