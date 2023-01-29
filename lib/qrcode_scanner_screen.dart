import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanScreen extends StatefulWidget {

  @override
  _QrCodeScanScreenState createState() => _QrCodeScanScreenState();
}

class _QrCodeScanScreenState extends State<QrCodeScanScreen> {
  late Size size;
  
  final GlobalKey _qrKey = GlobalKey(debugLabel: "QR");
  
  Barcode? result;
  QRViewController? _controller;
  
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF7524F),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/qr-code.png", height: 30.0, width: 30.0,),
            Text("Qr Code Scanner & Generator", style: TextStyle(fontWeight: FontWeight.bold),),

          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

      ),

      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Let's get package for qr code scan
            Expanded(child: _buildQRView(context))
          ],
        ),
      ),
    );
  }
  
  Widget _buildQRView( BuildContext context ){
    var scanArea = 250.0;
    
    return QRView(
        key: _qrKey, 
        onQRViewCreated: _onQrViewCreated,
      onPermissionSet: (ctrl,p)=> onermissionSet(context, ctrl, p),
    );
  }
  
  void _onQrViewCreated(QRViewController _qrController){
    setState(() {
      this._controller = _qrController;
    });
    _controller?.scannedDataStream.listen((event) { 
      setState(() {
        result=event;
        _controller?.pauseCamera();
      });
    });
  }
  
  void onermissionSet(BuildContext context, QRViewController _ctrler, bool p){
    if(!p){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No Permission!"))
      );
    }
  }
}
