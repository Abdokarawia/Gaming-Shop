import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Cart_Provider.dart';
import '../Providers/Products_Provider.dart';
class Cart_Widget extends StatelessWidget {
  final int index;
  Cart_Widget(this.index);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).Products;
    final Mediaqueryheight =MediaQuery.of(context).size.height;
    final Mediaquerywidth =MediaQuery.of(context).size.width;
    final item = Provider.of<Cart>(context).items;
    final cart=Provider.of<Cart>(context);
    final cartitem=Provider.of <Cart_Item> (context);
    final values = item.values.toList();
    return Dismissible(
      background: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(Icons.delete, color: Colors.white, size: 40,),
        ),
        alignment: Alignment.centerRight,
      ),
      key: ValueKey(values [index].id),
      onDismissed: (direction){
        Provider.of <Cart>(context, listen: true).removeitem(item.keys.toList() [index]);
      },
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(context: context, builder: (ctx) {return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Are you sure !!'),
          content: Text('Do you want to remove this item ?'),
          actions: <Widget>[
            FlatButton(onPressed: () {
              Navigator.of(ctx).pop(true);
            }, child: Text('Yes')),
            FlatButton(onPressed: () {Navigator.of(ctx).pop(false);}, child: Text('No'))
          ],
        );});
      },
      child: Container(
          height: Mediaqueryheight*0.16,
          child: LayoutBuilder(
            builder: (ctx,constraints){
              return  Row(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight*0.9,
                    width: constraints.maxWidth*0.25,
                    child: Image.network(
                      values[index].img,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: constraints.maxHeight*0.4,
                      width: constraints.maxWidth*0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: constraints.maxHeight*0.17,
                            child: FittedBox(
                              child: Text(
                                values[index].title,
                                style: Theme.of(context).textTheme.title,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight*0.015,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                height: constraints.maxHeight*0.16,
                                child: FittedBox(
                                  child: Text(
                                    (values[index].price * values[index].quantity)
                                        .toString() +
                                        '\$',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "Acme"),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: constraints.maxHeight*0.25,
                        width: constraints.maxWidth*0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(icon:Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 20,
                        ),
                            onPressed: (){
                              cartitem.addquantity();
                          // cart.addquantity(item.keys.toList() [index]);
                            })
                      ),
                      SizedBox(
                        height: constraints.maxHeight*0.05,
                      ),
                      Container(
                        height: constraints.maxHeight*0.18 ,
                        child: FittedBox(
                          child: Text(
                            values[index].quantity.toString(),
                            style: Theme.of(context).textTheme.subhead,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight*0.05,
                      ),
                      Container(
                        height: constraints.maxHeight*0.25,
                        width: constraints.maxWidth*0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(icon: Icon(
                          Icons.remove,
                          color: Colors.blue,
                          size: 20,
                        ),onPressed: (){
                          cartitem.minusquantity();
                        },),
                      ),
                    ],
                  ),
                ],
              );
            },
          )
      ),
    );
  }
}

