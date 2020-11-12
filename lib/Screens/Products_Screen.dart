import 'package:flutter/material.dart';
import 'package:gaming_app/Providers/Cart_Provider.dart';
import 'package:gaming_app/Screens/Product_Details_Screen.dart';
import 'package:gaming_app/Widgets/Product_Widget.dart';
import 'package:provider/provider.dart';
import '../Providers/Products_Provider.dart';
import '../Widgets/badge.dart';
class Products extends StatelessWidget {
  static const Routename="goToProductsWidget";
  @override
  Widget build(BuildContext context) {
    final appbar= AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        Consumer<Cart>(builder: (_, cart, ch) {
          return Badge(
              child: IconButton(
                  icon: Icon(Icons.shopping_cart,size: 28,), onPressed: () {}),
              value: cart.itemCount.toString());
        }),
      ],
      iconTheme: IconThemeData(color: Colors.black, size: 28),
      elevation: 0,
    );
    final Mediaqueryheight =MediaQuery.of(context).size.height;
    final Mediaquerywidth =MediaQuery.of(context).size.width;
    final Mediaquerytop= MediaQuery.of(context).padding.top;
    final Mediaquery=(Mediaqueryheight-appbar.preferredSize.height-Mediaquerytop);
    final products=Provider.of <ProductsProvider> (context).Products;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  appbar,
      body: Column(
        children: <Widget>[
          Container(
            height: Mediaquery*0.06,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Products",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "See less",
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
          ),
          Container(
            height: Mediaquery*0.94,
            width: Mediaquerywidth,
            child: ListView.builder(itemCount: products.length,itemBuilder: (BuildContext ctx,int index){
              return ChangeNotifierProvider.value(
                  value: products[index],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ProductWidget(),
                  ));
            }),
          )
        ],
      ),
    );
  }
}
