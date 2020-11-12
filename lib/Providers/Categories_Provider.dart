import 'package:flutter/material.dart';
import '../Providers/Category_Provider.dart';

class categories with ChangeNotifier {
  final List<Category> Categories =[
    Category(
        color: Color(0xff00B8FC),
        icon: Icons.mouse,
        text: 'Mice',
        id: 'Mice'),
    Category(
        color: Color(0xff00B8FC),
        icon: Icons.videogame_asset,
        text: 'Controller',
        id: 'Controller'),
    Category(
        color: Color(0xff00B8FC),
        icon: Icons.headset,
        text: 'Headset',
        id: 'Headset'),
    Category(
        color: Color(0xff00B8FC),
        icon: Icons.videogame_asset,
        text: 'Console',
        id: 'Console'),
  ];

  int selectindex=0;

  void selectColor(int index){
    selectindex = index;
    notifyListeners();
  }

  void Notify() {
    notifyListeners();
  }


}
