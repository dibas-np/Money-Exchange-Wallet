import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../widgets/scanpay.dart';
import '../widgets/navigation.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController controller;

  void resumeCamera() {
    controller?.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    bool scanned = false;
    controller.scannedDataStream.listen(
      (scanData) {
        if (!scanned) {
          scanned = true;
          secondPageRoute();
        }
      },
    );
  }

  secondPageRoute() async {
    await Future.delayed(
      Duration(seconds: 1),
      () {
        controller?.pauseCamera();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ScanPayPage();
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    // controller?.resumeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan To Pay',
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(
                    borderRadius: 10,
                    borderColor: Colors.red,
                    borderLength: 30,
                    cutOutSize: 300),
                onQRViewCreated: _onQRViewCreated),
          ),
        ],
      ),
    );
  }
}
