import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String title, subtitle, Category_id, id, img,decoration;
  final double price;

  Product(
      {@required this.title,
      @required this.subtitle,
        @required this.decoration,
      @required this.img,
      @required this.Category_id,
      @required this.id,
      @required this.price});
}
