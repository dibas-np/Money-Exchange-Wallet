import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../widgets/navigation.dart';
import './welcome.dart';
import '../utils/constant.dart';
import '../widgets/profile_list.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    // Advanced using of alerts
    _onAlertWithStylePressed(context) {
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
            color: Colors.red,
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
        title: "LOG OUT",
        desc: "Are you sure you want to log out?",
        buttons: [
          DialogButton(
            child: Text(
              "YES",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomePage(),
              ),
            ),
            gradient: LinearGradient(colors: [
              Color(0xFF60E660),
              Color(0xFFA7F1A7),
            ]),
          ),
          DialogButton(
            child: Text(
              "NO",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () => Navigator.pop(context),
            gradient: LinearGradient(colors: [
              Color(0xFFFF708D),
              Color(0xFFFFADBE),
            ]),
          )
        ],
      ).show();
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
                  backgroundImage: AssetImage('assets/mypic.jpg'),
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
            'Dibas Sigdel',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'd.sigdel2@wlv.ac.uk',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );
    return Scaffold(
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
        child: Column(
          children: <Widget>[
            SizedBox(height: kSpacingUnit.w * 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: kSpacingUnit.w * 3),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
                  },
                  child: Icon(
                    LineAwesomeIcons.arrow_left,
                    size: ScreenUtil().setSp(kSpacingUnit.w * 3),
                  ),
                ),
                profileInfo,
                SizedBox(width: kSpacingUnit.w * 3),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ProfileListItem(
                    icon: LineAwesomeIcons.user_shield,
                    text: 'Privacy',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
                        ),
                      );
                    },
                    child: ProfileListItem(
                      icon: LineAwesomeIcons.history,
                      text: 'Transaction History',
                    ),
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.question_circle,
                    text: 'Help & Support',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.cog,
                    text: 'Settings',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.user_plus,
                    text: 'Invite & Get Rewards',
                  ),
                  GestureDetector(
                    onTap: () {
                      _onAlertWithStylePressed(context);
                    },
                    child: ProfileListItem(
                      icon: LineAwesomeIcons.alternate_sign_out,
                      text: 'Logout',
                      hasNavigation: false,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
