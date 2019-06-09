
//system imports
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

//user defined imports
import '../model/product_model.dart';
import 'package:shepard/pages/gwidgets/glistitem3.dart';


class ProductView extends StatefulWidget {
  final String title;
  ProductView({Key key, this.title}) : super(key: key);

  @override
  ProductViewState createState() => ProductViewState();
}


class ProductViewState extends State<ProductView> {
  Future<String> _loadProductAsset() async {
    return await rootBundle.loadString('assets/data/product.json');
  }

  String _productId = 'Fail to get product';
 

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future <void> loadProducts() async {
    String jsonProducts = await _loadProductAsset();
    final jsonResponse = json.decode(jsonProducts);
    ProductsList productsList = ProductsList.fromJson(jsonResponse);
  

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _productId = productsList.products[1].id;
    });
  }

  @override 
  Widget build(BuildContext context) {
    // TODO: implement build
    return GroceryListItemThree(
      image: "assets/pineapple.png",
      subtitle: "4 in a pack",
      title: _productId,

    );
  }

}