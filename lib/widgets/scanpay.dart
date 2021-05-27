import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../utils/constant.dart';
import '../utils/light_color.dart';
import '../utils/title_text.dart';
import './navigation.dart';
import '../utils/login_style.dart';

class ScanPayPage extends StatefulWidget {
  @override
  _ScanPayPageState createState() => _ScanPayPageState();
}

class _ScanPayPageState extends State<ScanPayPage> {
   // Advanced using of alerts
  _onAlertWithStylePressed(context) {
    // Reusable alert style
    var alertStyle = AlertStyle(
        animationType: AnimationType.fromLeft,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        // descStyle: TextStyle(fontWeight: FontWeight.bold),
        animationDuration: Duration(milliseconds: 300),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: Colors.green,
        ),
        constraints: BoxConstraints.expand(width: 300),
        //First to chars "55" represents transparency of color
        overlayColor: Color(0x55D8F9FE),
        alertElevation: 10,
        alertAlignment: Alignment.center);

    // Alert dialog using custom alert style
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.none,
      title: "Success!",
      desc: "Money sent successfully!",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
          gradient: LinearGradient(
            colors: [
              Color(0xFF60E660),
              Color(0xFFA7F1A7),
            ],
          ),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  // Advanced using of alerts
  _onAlertWithStylePressedDouble(context) {
    // Reusable alert style
    var alertStyle = AlertStyle(
        animationType: AnimationType.fromRight,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(
          fontFamily: 'OpenSans',
        ),
        animationDuration: Duration(milliseconds: 300),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: Colors.green,
          fontFamily: 'OpenSans',
        ),
        constraints: BoxConstraints.expand(width: 300),
        //First to chars "55" represents transparency of color
        overlayColor: Color(0x55D8F9FE),
        alertElevation: 10,
        alertAlignment: Alignment.center);

    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.none,
      title: "TRANSFER",
      desc: "Are you sure you want to send money?",
      buttons: [
        DialogButton(
          child: Text(
            "YES",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => _onAlertWithStylePressed(context),
          gradient: LinearGradient(
            colors: [
              Color(0xFF60E660),
              Color(0xFFA7F1A7),
            ],
          ),
        ),
        DialogButton(
          child: Text(
            "NO",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF708D),
              Color(0xFFFFADBE),
            ],
          ),
        )
      ],
    ).show();
  }

  Widget _sendButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: LightColor.navyBlue2,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          _onAlertWithStylePressedDouble(context);
        },
        child: Wrap(
          children: <Widget>[
            Transform.rotate(
              angle: 70,
              child: Icon(
                Icons.swap_calls,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            TitleText(
              text: "Send",
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    Widget _buildYouSendTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'You Send',
            style: kYouSendLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kLogInBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              enabled: false,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Colors.white,
                ),
                hintText: '1,000',
                hintStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildReceiverGetsTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Receiver Gets',
            style: kYouSendLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kLogInBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              enabled: false,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.money,
                  color: Colors.white,
                ),
                hintText: '116,000 NPR',
                hintStyle: TextStyle(
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildConversionText() {
      return Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'Conversion Rate 1 USD = 116 NPR',
            style: TextStyle(
              color: Colors.grey.shade900,
              fontFamily: 'OpenSans',
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('assets/profiletest.jpeg'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: Colors.white,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'Sending Money to',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'Bella Swan',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                fontFamily: 'OpenSans'),
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'bella.swan@gmail.com',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send Money',
          style: TextStyle(
            color: Colors.grey.shade900,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            LineAwesomeIcons.arrow_left,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
            // Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF51E5F6),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9EF1FA),
              Color(0xFF8BEEF9),
              Color(0xFF77EBF8),
              Color(0xFF51E5F6),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  profileInfo,
                  SizedBox(width: kSpacingUnit.w * 3),
                ],
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 230.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    _buildYouSendTF(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildReceiverGetsTF(),
                    SizedBox(
                      height: 15.0,
                    ),
                    _buildConversionText(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _sendButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
