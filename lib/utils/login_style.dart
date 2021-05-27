import 'package:flutter/material.dart';

final kLogInHintTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontFamily: 'OpenSans',
);

final kLogInLabelStyle = TextStyle(
  color: Colors.grey.shade900,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
  fontSize: 20,
);

final kLogInBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFB1F4FB),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kYouSendLabelStyle = TextStyle(
  color: Colors.grey.shade900,
  // fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
  fontSize: 18,
);
