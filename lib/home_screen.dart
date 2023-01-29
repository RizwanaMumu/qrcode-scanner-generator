import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcodescanner_generator/qrcode_generator_screen.dart';
import 'package:qrcodescanner_generator/qrcode_scanner_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF7524F),
        title: Text("Qr Code Scanner & Generator"),
        leading: Image.asset("assets/images/qr-code.png", height: 40.0, width: 40.0,),
      ),

      body: Container(
        width: size.width,
        height: size.height,
        color: Color(0xffEEEEEE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                child: Text("Scan QR Code", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> QrCodeScanScreen()));

                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF7524F),
                  shadowColor: Color(0xffF7524F),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                child: Text("Generate QR Code", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> QrCodeGeneratorScreen()));

                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffF7524F),
                    shadowColor: Color(0xffF7524F),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    )
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
