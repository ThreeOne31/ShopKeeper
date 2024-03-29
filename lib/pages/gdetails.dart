import 'package:flutter/material.dart';
import 'gwidgets/glistitem2.dart';
import 'gwidgets/gtypography.dart';

class GroceryDetailsPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.green,
          title: Text("Details"),
        ),
        body: _buildPageContent(context),
      );
    }

  Widget _buildPageContent(context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildItemCard(context),
              Container(
                padding: EdgeInsets.all(30.0),
                child: GrocerySubtitle(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras scelerisque nibh ut eros suscipit, vel cursus dolor imperdiet. Proin volutpat ligula eget purus maximus tristique. Pellentesque ullamcorper libero vitae metus feugiat fringilla. Ut luctus neque sed tortor placerat, faucibus mollis risus ullamcorper. Cras at nunc et odio ultrices tempor et.")),
              Container(padding: EdgeInsets.only(left: 20.0, bottom: 10.0),child: GroceryTitle(text: "Related Items")),
              GroceryListItemTwo(title: "Broccoli", image: "assets/brocoli.png", subtitle: "1 kg"),
              GroceryListItemTwo(title: "Cabbage", image: "assets/cabbage.png", subtitle: "1 kg"),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.green,
                child: FlatButton(
                  color: Colors.green,
                  onPressed: (){},
                  child: Text("Add to Cart"),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildItemCard(context) {
    return Stack(
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.favorite_border),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/cabbage.png', height: 200,),
                ),
                SizedBox(height: 10.0,),
                GroceryTitle(text:"Local Cabbage"),
                SizedBox(height: 5.0,),
                GrocerySubtitle(text: "1 kg")
              ],
            ),
          ),
        ),
      ],
    );
  }
}