import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './welcome.dart';

class LocationAccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'Allow this app to access the device\'s location?',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          child: Text(
            'Deny',
            style: TextStyle(fontFamily: 'OpenSans'),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomePage(),
              ),
            );
          },
          child: Text(
            'Allow',
            style: TextStyle(fontFamily: 'OpenSans'),
          ),
        ),
      ],
    );
  }
}
