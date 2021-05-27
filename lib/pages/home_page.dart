import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/title_text.dart';
import '../widgets/balance_card.dart';
import '../utils/light_color.dart';
import './withdraw.dart';
import './deposit.dart';
import './pay.dart';
import './exchange.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _appBar() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage("assets/mypic.jpg"),
        ),
        SizedBox(width: 15),
        TitleText(text: "Hello,"),
        Text(
          ' Dibas,',
          style: GoogleFonts.muli(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: LightColor.navyBlue2),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Icon(
          Icons.short_text,
          color: Theme.of(context).iconTheme.color,
        )
      ],
    );
  }

  Widget _operationsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _icon(
          Icons.redo,
          "Withdraw",
          WithdrawPage(),
        ),
        _icon(
          Icons.monetization_on,
          "Deposit",
          DepositPage(),
        ),
        _icon(
          Icons.payment,
          "Send",
          PayPage(),
        ),
        _icon(
          Icons.swap_calls,
          "Exchange",
          ExchangePage(),
        ),
      ],
    );
  }

  Widget _icon(IconData icon, String text, Widget page) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12, offset: Offset(3, 3), blurRadius: 5),
              ],
            ),
            child: Icon(icon),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.muli(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade900),
        ),
      ],
    );
  }

  Widget _transectionList() {
    return Column(
      children: <Widget>[
        _transection(
          Icons.local_pizza,
          "Pizza Delivery",
          "23 Feb 2021",
        ),
        _transection(
          Icons.lightbulb,
          "Electricity Bill",
          "25 Feb 2021",
        ),
        _transection(
          Icons.flight,
          "Flight Ticket",
          "03 Mar 2021",
        ),
      ],
    );
  }

  Widget _transection(IconData icon,String text, String time) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: LightColor.navyBlue1,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Icon(icon, color: Colors.white),
      ),
      contentPadding: EdgeInsets.symmetric(),
      title: TitleText(
        text: text,
        fontSize: 16,
      ),
      subtitle: Text(
        time,
        style: TextStyle(color: Colors.black87),
      ),
      trailing: Container(
        height: 30,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: LightColor.lightGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Text(
          '-20 \$',
          style: GoogleFonts.muli(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: LightColor.navyBlue2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 35),
                  _appBar(),
                  SizedBox(
                    height: 40,
                  ),
                  TitleText(text: "My wallet"),
                  SizedBox(
                    height: 20,
                  ),
                  BalanceCard(),
                  SizedBox(
                    height: 50,
                  ),
                  TitleText(
                    text: "Operations",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _operationsWidget(),
                  SizedBox(
                    height: 40,
                  ),
                  TitleText(
                    text: "Transactions",
                  ),
                  _transectionList(),
                ],
              )),
        ),
      ),
    );
  }
}
