import 'package:flutter/material.dart';
import 'package:gaming_app/Providers/Categories_Provider.dart';
import '../Providers/Games_Provider.dart';
import 'package:gaming_app/Screens/Products_Screen.dart';
import 'package:gaming_app/Widgets/Category_Widget.dart';
import 'package:gaming_app/Widgets/Game_Widget.dart';
import 'package:gaming_app/Widgets/Product_Widget.dart';
import '../Screens/Products_Screen.dart';
import 'package:provider/provider.dart';
import '../Providers/Products_Provider.dart';
import '../Providers/Cart_Provider.dart';
import '../Widgets/badge.dart';
import 'Cart_Screen.dart';
import '../Screens/UserProducts_Screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Mediaqueryheight = MediaQuery.of(context).size.height;
    final Mediaquerywidth = MediaQuery.of(context).size.width;
    final Categories = Provider.of<categories>(context).Categories;
    final index = Provider.of<categories>(context).selectindex;
    final products = Provider.of<ProductsProvider>(context).Products;
    final Games = Provider.of<games>(context).Games;
    final selectedCtProducts = products.where((prod) {
      return prod.Category_id == Categories[index].id;
    }).toList();
    Widget Personal(IconData iconData, String text, Function function) {
      return ListTile(
        onTap: function,
        leading: Icon(
          iconData,
          size: 26,
          color: Colors.blue,
        ),
        title: Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Consumer<Cart>(builder: (_, cart, ch) {
            return Badge(
                child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 28,
                    ),
                    onPressed: () {}),
                value: cart.itemCount.toString());
          }),
        ],
        iconTheme: IconThemeData(color: Colors.black, size: 28),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 220,
              color: Colors.blue,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 25),
                    child: Text(
                      "My Account",
                      style: Theme.of(context).textTheme.display1,
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Personal(Icons.person, "Personal Details ", null),
            SizedBox(
              height: 5,
            ),
            Personal(Icons.shopping_basket, "Recent orders ", () {
              Navigator.of(context).pushNamed(CartScreen.routename);
            }),
            SizedBox(
              height: 5,
            ),
            Personal(Icons.star, "Favorite", null),
            SizedBox(
              height: 5,
            ),
            Personal(Icons.map, "Address ", null),
            SizedBox(
              height: 5,
            ),
            Personal(Icons.settings, "Settings ", () {
              Navigator.of(context).pushNamed(userProductsScreen.routename);
            }),
            SizedBox(
              height: 5,
            ),
            Personal(Icons.exit_to_app, "Logout ", null),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Text(
                  "Welcome  to ",
                  style: Theme.of(context).textTheme.display2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Text(
                  "Gaming Gear Shop",
                  style: Theme.of(context).textTheme.title,
                )
              ],
            ),
          ),
          SizedBox(height: Mediaqueryheight * 0.01),
          Container(
            height: Mediaqueryheight * 0.17,
            child: ListView.builder(
                itemCount: Categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ChangeNotifierProvider.value(
                    value: Categories[index],
                    child: CategoryWidget(index: index),
                  );
                }),
          ),
          SizedBox(height: Mediaqueryheight * 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Products",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Products.Routename);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "See all",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: Mediaqueryheight * 0.26,
            width: Mediaquerywidth,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedCtProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChangeNotifierProvider.value(
                      value: selectedCtProducts[index],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ProductWidget(),
                      ));
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Games",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Products.Routename);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "See all",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: Mediaqueryheight * 0.29,
            width: Mediaquerywidth,
            child: ListView.builder(
              itemCount:Games.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              return ChangeNotifierProvider.value(
                  value: Games[index],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 5),
                    child: Game_Widget(
                    ),
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
