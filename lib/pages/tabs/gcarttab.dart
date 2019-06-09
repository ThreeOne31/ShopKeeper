import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../gwidgets/glistitem3.dart';
import 'package:shepard/services/productSales.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class GroceryCartTabView extends StatefulWidget {
  final String title;
  GroceryCartTabView({Key key, this.title}) : super(key: key);

  @override
  GroceryCartTabViewState createState() => GroceryCartTabViewState();
}


class GroceryCartTabViewState extends State<GroceryCartTabView> {

  String _scanBarcode = 'Null';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes =
      await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
    Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                ProductView(),
                // GroceryListItemThree(
                //   image: "assets/pineapple.png",
                //   subtitle: "4 in a pack",
                //   title: "Pineapple",
                // ),
                
                GroceryListItemThree(
                  image: "assets/cabbage.png",
                  subtitle: "1 kg",
                  title: "cabbage",
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0,),
          _buildTotals()
        ],
      );
    }

  Widget _buildTotals() {
    return ClipOval(
      clipper: OvalTopBorderClipper(),
      child: Container(
            height: 210,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 5.0,color: Colors.grey.shade700,spreadRadius: 80.0),
              ],
              color: Colors.white,
            ),
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
            child: Column(
              children: <Widget>[ 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total"),
                    Text("R 1600"),
                  ],
                ),
                SizedBox(height: 10.0,),
                RaisedButton(
                  color: Colors.green,
                  onPressed: (){
                    initPlatformState();
                    
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Add more to basket", style: TextStyle(color: Colors.white)),
                      Text("05", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                RaisedButton(
                  color: Colors.green,
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Continue to Checkout", style: TextStyle(color: Colors.white)),
                      Text("R 1600", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          ),
    );
  }
}
