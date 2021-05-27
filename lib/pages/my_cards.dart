import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/navigation.dart';
class MyCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Collection',
            style: TextStyle(
              color: Colors.grey.shade900,
            )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        backgroundColor: Color(0xFF51E5F6),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
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
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        _buildCreditCard(
                            color: Colors.black,
                            cardExpiration: "08/2022",
                            cardHolder: "DIBAS SIGDEL",
                            cardNumber: "3546 7532 XXXX 9742"),
                        SizedBox(
                          height: 40,
                        ),
                        _buildCreditCard(
                            color: Color(0xFF046380),
                            cardExpiration: "05/2024",
                            cardHolder: "DIBAS SIGDEL",
                            cardNumber: "9874 4785 XXXX 6548"),
                        SizedBox(
                          height: 30,
                        ),
                        _buildAddCardButton(
                          icon: Icon(Icons.add),
                          color: Color(0xFF081603),
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Build the credit card widget
  Card _buildCreditCard(
      {@required Color color,
      @required String cardNumber,
      @required String cardHolder,
      @required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                '$cardNumber',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build the title section
  // Column _buildTitleSection({@required title}) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Padding(
  //         padding: const EdgeInsets.only(top: 16.0),
  //         child: Text(
  //           '$title',
  //           style: TextStyle(
  //               fontSize: 30.0,
  //               fontFamily: 'OpenSans',
  //               fontWeight: FontWeight.bold),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Build the top row containing logos
  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/mastercard.png",
          height: 90,
          width: 90,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({@required String label, @required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.yellow.shade700,
              fontSize: 9,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

// Build the FloatingActionButton
  Container _buildAddCardButton({
    @required Icon icon,
    @required Color color,
    BuildContext context,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.center,
      child: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          final addCardBar = SnackBar(
            content: Text(
              "You will be able to add more cards soon!",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            duration: const Duration(milliseconds: 1500),
            backgroundColor: Color(0xFFD8F9FD),
          );
          ScaffoldMessenger.of(context).showSnackBar(addCardBar);
        },
        backgroundColor: color,
        mini: false,
        child: icon,
      ),
    );
  }
}
