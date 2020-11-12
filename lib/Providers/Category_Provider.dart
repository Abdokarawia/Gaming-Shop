import 'package:flutter/material.dart';

class Category with ChangeNotifier {

  final String text, id;
  final Color color;
  final IconData icon;


  Category({this.text, this.color, this.icon, this.id});


}
