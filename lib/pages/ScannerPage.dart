import 'dart:io';
import 'package:bitcoin_viewer/pages/SearchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scanner extends StatefulWidget {

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }

    controller.resumeCamera();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderLength: 40,
            borderRadius: 10,
            borderColor: Colors.indigo,
            borderWidth: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.8
          ),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 5,
          child: FlatButton(
            onPressed: () {
               Navigator.pop(context);
            },
            splashColor: Colors.transparent,
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;

        Navigator.maybePop(context, result.code);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}


