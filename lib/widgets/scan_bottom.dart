// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      // ignore: prefer_const_constructors
      child: Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () async {
        print('Boto polsat');
        //String barcodeScanRes = "https://aulavirtual.paucasesnovescifp.cat/";

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8DEF', 'Cancel·lar', false, ScanMode.QR);
        print(barcodeScanRes);
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nouScan(barcodeScanRes);
      },
    );
  }
}
