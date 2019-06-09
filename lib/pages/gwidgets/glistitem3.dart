import 'package:flutter/material.dart';
import 'gtypography.dart';

class GroceryListItemThree extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final double price;

 const GroceryListItemThree({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.image,
    this.price,
  }) : super(key: key);

  @override
  GroceryListItemThreeState createState() => GroceryListItemThreeState(key: key, title: title, subtitle: subtitle, image: image, price: price);
}


class GroceryListItemThreeState extends State<GroceryListItemThree> {
   GroceryListItemThreeState({
    this.key,
    @required this.title,
    @required this.subtitle,
    @required this.image,
    this.price,
  });
  final Key key;
  final String title;
  final String subtitle;
  final String image;
  final double price;

  int _quantity = 0;

  void _addQuantity() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _quantity++;
    });
  }

  void _reduceQuantity() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _quantity--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          title: Container(
            height: 50.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GroceryTitle(text: title),
                GrocerySubtitle(text: subtitle)
              ],
            ),
          ),
          trailing: Wrap(
            children: <Widget>[ 
              IconButton(icon: Icon(Icons.add_circle, size: 30,), color: Colors.green,  onPressed: (){_addQuantity();},),
              Text('$_quantity', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),),
              IconButton(icon: Icon(Icons.remove_circle, size: 30,), color: Colors.red, onPressed: (){_reduceQuantity();},),
            ],
          ),
        ),
      );
  }
}