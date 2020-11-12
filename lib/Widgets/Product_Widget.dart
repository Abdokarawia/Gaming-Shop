import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Product_Provider.dart';
import '../Screens/Product_Details_Screen.dart';
import '../Providers/Cart_Provider.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Mediaqueryheight = MediaQuery.of(context).size.height;
    final Mediaquerywidth = MediaQuery.of(context).size.width;
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    final id = Provider.of<Product>(context).id;
    Widget icon(Color color, double height) {
      return Container(
        height: height,
        child: FittedBox(
          child: Icon(
            Icons.star,
            size: 22,
            color: color,
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(product_details.routename, arguments: product.id);
      },
      child: Container(
          height: Mediaqueryheight * 0.2659,
          width: Mediaquerywidth * 0.89,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: constraints.maxHeight * 0.13,
                              child: FittedBox(
                                child: Text(
                                  product.title,
                                  style: Theme.of(context).textTheme.display1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: constraints.maxHeight * 0.09,
                              child: FittedBox(
                                child: Text(
                                  product.subtitle,
                                  style: Theme.of(context).textTheme.body2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            icon(
                              Colors.amber,
                              constraints.maxHeight * 0.1,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            icon(Colors.amber, constraints.maxHeight * 0.1),
                            SizedBox(
                              width: 5,
                            ),
                            icon(Colors.amber, constraints.maxHeight * 0.1),
                            SizedBox(
                              width: 5,
                            ),
                            icon(Colors.amber, constraints.maxHeight * 0.1),
                            SizedBox(
                              width: 5,
                            ),
                            icon(Colors.grey.withOpacity(0.8),
                                constraints.maxHeight * 0.1),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: constraints.maxHeight * 0.12,
                              child: FittedBox(
                                child: Text(
                                  "\$" + product.price.toString(),
                                  style: Theme.of(context).textTheme.display1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: constraints.maxHeight * 0.7,
                      width: constraints.maxWidth * 0.45,
                      child: Image.network(
                        product.img,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: Mediaqueryheight * 0.065,
                      width: Mediaquerywidth * 0.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          color: Colors.amber),
                      child: IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 25,
                            color: Colors.white,
                          ),
                          onPressed : () {
                            cart.addItem(product.id, product.price,
                                product.subtitle, product.img);
                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.blue,
                                duration: Duration(seconds: 1),
                                content: Text(
                              'Added to Cart!!',
                              style: Theme.of(context).textTheme.display1,
                            ),
                            action: SnackBarAction(label: 'Undo',textColor: Colors.amber, onPressed: () {cart.removeSingleItem(product.id);}),));
                          }),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
