// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MedicalCard extends StatefulWidget {
  const MedicalCard({ Key key }) : super(key: key);

  @override
  _MedicalCardState createState() => _MedicalCardState();
}

class _MedicalCardState extends State<MedicalCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
  data: 'Digital Medical card',
  version: QrVersions.auto,
  size: 320,
)
      ),
    );
  }
}

// class Scanner extends StatefulWidget {
//   const Scanner({ Key key }) : super(key: key);

//   @override
//   _ScannerState createState() => _ScannerState();
// }

// class _ScannerState extends State<Scanner> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController controller;
 
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       controller.pauseCamera();
//       if (await canLaunch(scanData.code)) {
//           await launch(scanData.code);
//       }
//       controller.resumeCamera();
//     });
//   }
//     return Scaffold(
//       body: QRView(
//         key: qrKey,
//         onQRViewCreated: _onQRViewCreated,
//       ),
//     );
//   }
// }
  //  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode result;
  // QRViewController controller;

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller.resumeCamera();
  //   }
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       children: <Widget>[
  //         Expanded(
  //           flex: 5,
  //           child: QRView(
  //             key: qrKey,
  //             onQRViewCreated: _onQRViewCreated,
  //           ),
  //         ),
  //         Expanded(
  //           flex: 1,
  //           child: Center(
  //             child: (result != null)
  //                 ? Text(
  //                     'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
  //                 : Text('Scan a code'),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }
  
