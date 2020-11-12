import '../Screens/Payment_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Products_Provider.dart';
import '../Widgets/Product_Widget.dart';
import '../Providers/Cart_Provider.dart';
import '../Widgets/Cart_Widget.dart';

class CartScreen extends StatelessWidget {
  static const routename = 'goToCartScreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final Mediaqueryheight = MediaQuery.of(context).size.height;
    final Mediaquerywidth = MediaQuery.of(context).size.width;
    final Mediaquerytop = MediaQuery.of(context).padding.top;

    final appbar = AppBar(
      backgroundColor: Color(0xffF7FAFE),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.blue,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        'My Cart',
        style: Theme.of(context).textTheme.body1,
      ),
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 24,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
    final Mediaquery =
        (Mediaqueryheight - appbar.preferredSize.height - Mediaquerytop);
    return Scaffold(
      backgroundColor: Color(0xffF7FAFE),
      appBar: appbar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Mediaquery * 0.7,
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 0),
                    child: ChangeNotifierProvider.value(
                        value: cart.items.values.toList() [index], child: Cart_Widget(index)),
                  );
                }),
          ),
          Container(
              height: Mediaquery * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
              ),
              child: LayoutBuilder(builder: (ctx, constraints) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: constraints.maxHeight * 0.12,
                            child: FittedBox(
                              child: Text(
                                "Cost" + ':',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.11,
                            child: FittedBox(
                              child: Text(
                                cart.cost.toString() + '\$',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: constraints.maxHeight * 0.12,
                            child: FittedBox(
                              child: Text(
                                "Discount" + ':',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: "PTSansNarrow"),
                              ),
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.11,
                            child: FittedBox(
                              child: Text(
                                "12.5%",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: constraints.maxHeight * 0.16,
                            child: FittedBox(
                              child: Text(
                                "Total:",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: "Acme"),
                              ),
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.15,
                            child: FittedBox(
                              child: Text(
                                cart.total.toString() + "\$",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Acme"),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(PaymentScreen.routename);
                        },
                        child: Container(
                            height: constraints.maxHeight * 0.22,
                            width: constraints.maxWidth * 0.88,
                            decoration: BoxDecoration(
                                color: Colors.blue[600],
                                borderRadius: BorderRadius.circular(15)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: constraints.maxHeight * 0.14,
                                  child: FittedBox(
                                      child: Text(
                                    "Checkout ",
                                    style: Theme.of(context).textTheme.display1,
                                  ))),
                            )),
                      )
                    ],
                  ),
                );
              }))
        ],
      ),
    );
  }
}
