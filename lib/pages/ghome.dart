import 'package:flutter/material.dart';
import 'tabs/gcarttab.dart';
import 'tabs/ghometab.dart';
import 'tabs/gprofiletab.dart';
import 'tabs/gwishlisttab.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [];
  List<Widget> _appBars = [];

  @override
    void initState() {
      _children.add(GroceryHomeTabView());
      _children.add(GroceryCartTabView());
      _children.add(GroceryWishlistTabView());
      _children.add(GroceryProfileTabView());

      _appBars.add(_buildAppBar());
      _appBars.add(_buildAppBarOne("Basket"));
      _appBars.add(_buildAppBarOne("Your Wishlist"));
      _appBars.add(_buildAppBarOne("You"));
      super.initState();
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _appBars[_currentIndex],
        body: _children[_currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
      );
    }

  Widget _buildAppBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Container(
              child: Card(
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      hintText: "Search products",
                      border: InputBorder.none,
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search))
                    ),
                  ),
                ),
              ),
            ),
            leading: Image.asset('assets/delivery.png'),
          ),
        ),
      );
  }
  Widget _buildAppBarOne(String title) {
    return AppBar(
      bottom: PreferredSize(child: Container(color: Colors.grey.shade200, height: 1.0,), preferredSize: Size.fromHeight(1.0)),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(title, style: TextStyle(color: Colors.black)),
    );
  }


  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _onTabTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home")),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text("Basket")),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text("Wishlist")),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text("You")),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
    );
  }

  _onTabTapped(int index) {
    setState(() {
          _currentIndex = index;
        });
  }

}




