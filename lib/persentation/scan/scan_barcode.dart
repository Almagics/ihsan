import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';



// Barcode Scanning Screen
class BarcodeScannerScreen extends StatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String? scannedBarcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Scan item", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, 'inventory'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
           // allowDuplicates: false,
            onDetect: (BarcodeCapture capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                setState(() {
                  scannedBarcode = barcode.rawValue ?? "Unknown";
                });
              }
            },
          ),
          if (scannedBarcode != null)
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Text(
                  "Barcode: $scannedBarcode",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.red, size: 40),
                  onPressed: () {
                    // Cancel scanning
                    setState(() {
                      scannedBarcode = null;
                    });

                    Navigator.pushReplacementNamed(context, 'inventory');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.check, color: Colors.green, size: 40),
                  onPressed: scannedBarcode != null
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BarcodeResultScreen(
                          barcode: scannedBarcode!,
                        ),
                      ),
                    );
                  }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Barcode Result Screen
class BarcodeResultScreen extends StatelessWidget {
  final String barcode;

  BarcodeResultScreen({required this.barcode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barcode Result"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          "Scanned Barcode:\n$barcode",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
