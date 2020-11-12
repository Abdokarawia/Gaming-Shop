import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gaming_app/Providers/Cart_Provider.dart';
import 'package:gaming_app/Providers/Product_Provider.dart';
import 'package:provider/provider.dart';
import '../Providers/Products_Provider.dart';

class product_details extends StatelessWidget {
  static const routename = "goToProductDetailsScreen";
  @override
  Widget build(BuildContext context) {
    final Mediaqueryheight = MediaQuery.of(context).size.height;
    final Mediaquerywidth = MediaQuery.of(context).size.width;
    final Mediaquerytop = MediaQuery.of(context).padding.top;
    final cart = Provider.of<Cart>(context);
    final appbar = AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white, size: 36),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 9),
          child: IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: 36,
                color: Colors.white,
              ),
              onPressed: () {}),
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 10, top: 7),
        child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 36,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
    );
    final Mediaquery =
        (Mediaqueryheight - appbar.preferredSize.height - Mediaquerytop);
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedproduct = Provider.of<ProductsProvider>(context).findByID(id);
    Widget icon(Color color) {
      return Container(
        height: Mediaquery*0.03,
        child: FittedBox(
          child: Icon(
            Icons.star,
            size: 22,
            color: color,
          ),
        ),
      );
    }

    return Scaffold(

        backgroundColor: Colors.blue,
        appBar: appbar,
        body: Builder(
          builder: (ctx)  { return Column(
            children: <Widget>[
              Container(
                height: Mediaquery * 0.5,
                width: Mediaquerywidth*1,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: Mediaquery * 0.22,
                        width: Mediaquerywidth*1,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      left: 2,
                      right: 2,
                      child: Container(
                        height: Mediaquery * 0.48,
                        child: Image.network(
                          selectedproduct.img,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height:Mediaquery * 0.5,
                color: Colors.white,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height:Mediaquery * 0.045,
                        child: FittedBox(
                          child: Text(selectedproduct.subtitle,style: Theme.of(context).textTheme.display4,
                          ),
                        ),
                      ),
                      Container(
                        height:Mediaquery * 0.03,
                        child: FittedBox(
                          child: Text(selectedproduct.title,style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Mediaquery * 0.005,
                      ),
                      Row(
                        children: <Widget>[
                          icon(Colors.amber),
                          SizedBox(
                            width: Mediaquerywidth*0.01,
                          ),
                          icon(Colors.amber),
                          SizedBox(
                            width: Mediaquerywidth*0.01,
                          ),
                          icon(Colors.amber),
                          SizedBox(
                            width: Mediaquerywidth*0.01,
                          ),
                          icon(Colors.amber),
                          SizedBox(
                            width: Mediaquerywidth*0.01,
                          ),
                          icon(Colors.grey.withOpacity(0.8)),
                          SizedBox(
                            width: Mediaquerywidth*0.01,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Mediaquery * 0.01,
                      ),
                      Container(
                        height: Mediaquery * 0.2,
                        child: Text(selectedproduct.decoration ,style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                      SizedBox(
                        height: Mediaquery*0.07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: Mediaquery*0.055,
                            child: FittedBox(
                              child: Text("\$"+selectedproduct.price.toString(),style: Theme.of(context).textTheme.display3,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              cart.addItem(selectedproduct.id, selectedproduct.price,
                                  selectedproduct.subtitle, selectedproduct.img);
                              Scaffold.of(ctx).hideCurrentSnackBar();
                              Scaffold.of(ctx).showSnackBar(SnackBar(backgroundColor: Colors.blue,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  'Added to Cart!!',
                                  style: Theme.of(context).textTheme.display1,
                                ),
                                action: SnackBarAction(label: 'Undo',textColor: Colors.amber, onPressed: () {cart.removeSingleItem(selectedproduct.id);}),));
                            },
                            child: Container(
                              height: Mediaquery*0.08,
                              width: Mediaquerywidth*0.55,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:  Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: Mediaquery*0.04,
                                  child: FittedBox(
                                    child: Text("ADD TO CART",style: Theme.of(context).textTheme.display1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );}
        ));
  }
}
