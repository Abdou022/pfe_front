import 'package:find_me/Core/Search/search_fail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class BarCodeScan extends StatefulWidget {
  const BarCodeScan({Key? key}) : super(key: key);

  @override
  State<BarCodeScan> createState() => _BarCodeScanState();
}

class _BarCodeScanState extends State<BarCodeScan> {
  String? scanResult;
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFDF1E1),
      appBar: AppBar(
        title: Text("Barcode Scanner",style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.black,fontSize: 18),),
        centerTitle: true,
        backgroundColor: Color(0xFFFDF1E1),
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(CupertinoIcons.back,color: Colors.black,)),
      ),
      body: SafeArea(
        
        child: Center(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Image.asset("assets/images/barcode_page.jpg",height: 300,),
              SizedBox(height: 30,),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Search Products using\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' BarCode.',
                      style: TextStyle(
                        color: Color(0xFFEFBC73),
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              SizedBox(
                  width: 250,
                  height: 45,
                  child: CupertinoButton(
                    color: const Color(0xFFDF9A4F),
                    onPressed: () {
                      scanBarCode();
                      /*Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: ((context) => const BarCodeScan())));*/
                    },
                    child: const Text(
                      "Start Scan",
                      style: TextStyle(
                        color: Color(0xFF965D1A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        )),
    );
  }



  Future<void> scanBarCode() async {
    String scanResult;
    try {
      // Use the FlutterBarCodeScanner plugin to scan barcodes
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", //coul il khat mtaa
        "Cancel",
        true, // Display flash
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanResult = 'Failed to get platform version.';
    }
    //ensures that the setState call is only executed if the widget is still part of the widget maaneha il widget mtaa barcode not supp taamalaik update mich hiya supprime w taamalik update wa9itha erreur
    if (!mounted) return;
    setState(() => this.scanResult = scanResult);
    //nwalliw lenna na3mlou des if selon resultat mta3 scan
    if(scanResult=='-1'){
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SearchFail(barcode: scanResult),));
    }
  }
}