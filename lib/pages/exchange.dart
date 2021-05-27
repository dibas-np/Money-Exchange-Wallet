import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../utils/light_color.dart';
import '../utils/title_text.dart';
import '../widgets/navigation.dart';
import '../utils/login_style.dart';

class ExchangePage extends StatefulWidget {
  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final myController = TextEditingController();
  int receiver;
  String amount;
  receiverChange() {
    try {
      receiver = int.parse(myController.text) * 116;
      amount = receiver.toString() + " NPR";
    } on FormatException {
      receiver = 0;
      amount = " NPR";
    }
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(receiverChange);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    // myController1.dispose();
    super.dispose();
  }

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
      desc: "Money exchanged successfully!",
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
      title: "EXCHANGE",
      desc: "Are you sure you want to exchange?",
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

  Widget _exchangeButton() {
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
          // check if amount is empty
          if (myController.text != '') {
            _onAlertWithStylePressedDouble(context);
          } else {
            final _sendMoneyErrorBar = SnackBar(
              content: Text(
                "Enter the amount you want to exchange!",
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 17,
                  fontFamily: 'OpenSans',
                ),
                textAlign: TextAlign.center,
              ),
              duration: const Duration(milliseconds: 2000),
              backgroundColor: Colors.red.shade400,
            );
            ScaffoldMessenger.of(context).showSnackBar(_sendMoneyErrorBar);
          }
        },
        child: Wrap(
          children: <Widget>[
            Transform.rotate(
              angle: 0,
              child: Icon(
                Icons.swap_calls,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            TitleText(
              text: "Exchange",
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

    Widget _buildOriginalCurrencyTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Original Currency (USD)',
            style: kYouSendLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kLogInBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: myController,
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
                hintText: 'Enter the amount to exchange',
                hintStyle: kLogInHintTextStyle,
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildExchangeCurrencyTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Exchange Currency (NPR)',
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
                hintText: amount,
                hintStyle: TextStyle(
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildMoreCurrencyText() {
      return Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'More currencies will be available soon.',
              style: TextStyle(
                color: Colors.grey.shade900,
                fontFamily: 'OpenSans',
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exchange',
          style: TextStyle(
            color: Colors.grey.shade900,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
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
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Image(
                      image: AssetImage('assets/NPR-USD.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Money Exchange',
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
            Container(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 280.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    _buildOriginalCurrencyTF(),
                    SizedBox(
                      height: 35.0,
                    ),
                    _buildExchangeCurrencyTF(),
                    SizedBox(
                      height: 15.0,
                    ),
                    _buildMoreCurrencyText(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _exchangeButton(),
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
