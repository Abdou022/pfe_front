import 'package:find_me/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class SearchFail extends StatefulWidget {
  const SearchFail({super.key, required this.barcode});
  final String barcode;

  @override
  State<SearchFail> createState() => _SearchState();
}

class _SearchState extends State<SearchFail> {
  String? scanResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF1E1),
      appBar: AppBar(
        backgroundColor: Color(0xFFFDF1E1),
        title: Text("Error",style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.black),),
        centerTitle: true,
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(CupertinoIcons.back,color: Colors.black,)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(child: SizedBox(),flex: 1,),
              Image.asset("assets/images/cancel.png",width: 250,),
              SizedBox(height: 10,),
              Text("Unable to read data",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 50,),
              SizedBox(
                  width: 300,
                  height: 50,
                  child: CupertinoButton(
                    color: const Color(0xFFDF9A4F),
                    onPressed: () {
                      scanBarCode();
                    },
                    child: const Text(
                      "Scan Again",
                      style: TextStyle(
                        color: Color(0xFF965D1A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: CupertinoButton(
                    color: const Color(0xFFDF9A4F),
                    onPressed: () {
                      //scanBarCode();
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: ((context) => MainScreenPage())));
                    },
                    child: const Text(
                      "Return To Home Page",
                      style: TextStyle(
                        color: Color(0xFF965D1A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Expanded(child: SizedBox(),flex: 3,),
            ],
          )
          /*Text(
            barcode == "-1" ? "Unable to read data": barcode
          ),*/
        ),
      ),
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
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SearchFail(barcode: scanResult),));
  }
}