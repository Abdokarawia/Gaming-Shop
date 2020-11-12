import 'package:flutter/material.dart';
class Game with ChangeNotifier {
  final String title, subtitle, id, img,decoration;
  final double price;

  Game({this.title, this.subtitle, this.id, this.img, this.decoration,
      this.price});
}