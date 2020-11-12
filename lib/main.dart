import 'package:flutter/material.dart';
import 'package:gaming_app/Screens/Cart_Screen.dart';
import 'package:gaming_app/Screens/Products_Screen.dart';
import 'package:provider/provider.dart';
import 'Providers/Cart_Provider.dart';
import 'Providers/Products_Provider.dart';
import 'Screens/HomePage.dart';
import './Providers/Categories_Provider.dart';
import './Screens/Products_Screen.dart';
import './Screens/Product_Details_Screen.dart';
import './Screens/Cart_Screen.dart';
import 'Screens/Payment_Screen.dart';
import './Screens/UserProducts_Screen.dart';
import './Providers/Games_Provider.dart';
import './Screens/EditProduct_Screen.dart';
import './Screens/Game_Details_Screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => categories(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => games(),
        )
      ],
      child: MaterialApp(
        title: 'Gaming Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "PTSansNarrow",
          textTheme: TextTheme(
            body1: TextStyle(
              fontSize: 24,
              fontFamily: "PTSansNarrow",
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            subtitle: TextStyle(
              fontSize: 18,
              fontFamily: "PTSansNarrow",
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.85),
            ),
            display4: TextStyle(
              fontSize: 23,
              fontFamily: "PTSansNarrow",
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            body2: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
              color: Colors.white.withOpacity(0.8)
            ),
            display1: TextStyle(
              fontSize: 22,
              fontFamily: "PTSansNarrow",
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            display2: TextStyle(
              fontSize: 23,
              fontFamily: "PTSansNarrow",
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            display3: TextStyle(
              fontSize: 30,
              fontFamily: "PTSansNarrow",
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
            caption: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.4,
                color: Colors.grey.withOpacity(0.8)
            ),
            title: TextStyle(
              fontSize: 18,
              fontFamily: "Acme",
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline: TextStyle(
              fontSize: 16,
              fontFamily: "PTSansNarrow",
              fontWeight: FontWeight.w500,
              color: Colors.black,),
            subhead: TextStyle(
              fontSize: 16,
              fontFamily: "Acme",
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        routes:{
          product_details.routename:(ctx){
            return product_details();
          },
          Products.Routename:(ctx){
            return Products();
          },
          CartScreen.routename:(ctx){
            return CartScreen();
          },
          PaymentScreen.routename:(ctx)
          {
            return PaymentScreen();
          },
          userProductsScreen.routename: (ctx) {
            return userProductsScreen();
          },
          editProductScreen.routename: (ctx) {
            return editProductScreen();
          },
          GameDetails.routename:(ctx){
            return GameDetails();
          }
        },
      ),
    );
  }
}
