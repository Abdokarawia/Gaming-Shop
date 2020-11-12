import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Products_Provider.dart';
import '../Widgets/userProduct_Widget.dart';
import '../Screens/EditProduct_Screen.dart';

class userProductsScreen extends StatelessWidget {
  static const routename = 'gotouserProductsScreen';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).Products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF7FAFE),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          'Edit Products',
          style: Theme.of(context).textTheme.body1,
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.add,
                size: 24,
                color: Colors.blue,
              ),
              onPressed: () {
                return Navigator.of(context)
                    .pushNamed(editProductScreen.routename);
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, index) {
            return Column(
              children: <Widget>[
                userProductWidget(
                  Img: products[index].img,
                  Subtitle: products[index].subtitle,
                  Title: products[index].title,
                ),
                Divider()
              ],
            );
          }),
    );
  }
}
