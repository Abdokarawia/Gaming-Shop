import 'package:flutter/material.dart';

class Cart_Item with ChangeNotifier {
  final String id, title, img;
  double price;
  int quantity;

  Cart_Item({this.id, this.title, this.img, this.price, this.quantity= 1});

  void addquantity () {
    quantity=quantity+1;
    notifyListeners();
  }
  void minusquantity () {
    if (quantity<=1) {
      return;
    }
    quantity=quantity-1;
    notifyListeners();
  }
}

class Cart with ChangeNotifier {

  Map<String, Cart_Item> _items ={};
  Map<String, Cart_Item> get items{
    return {..._items};
  }
  int get itemCount {
    return _items.length;
  }

  // void addquantity (String productId ){
  //   if(_items.containsKey(productId)){
  //     _items.update(productId,(existingCartItem){
  //       return Cart_Item(
  //           id: existingCartItem.id,
  //           img: existingCartItem.img,
  //           price: existingCartItem.price,
  //           quantity: existingCartItem.quantity + 1,
  //           title: existingCartItem.title
  //       );});}
  //   notifyListeners();
  // }
  void addItem(String productId, double price, String subtitle, String img){
    if(_items.containsKey(productId)){
      _items.update(productId,(existingCartItem){
           return Cart_Item(
               id: existingCartItem.id,
               img: existingCartItem.img,
               price: existingCartItem.price,
               quantity: existingCartItem.quantity + 1,
               title: existingCartItem.title
           );});}
    else {
      _items.putIfAbsent(productId, (){
        return Cart_Item(
            id: DateTime.now().toString(),
            img: img,
            price: price,
            quantity: 1,
            title: subtitle
        );});}
    notifyListeners();
  }
  double get cost {
    double totalcartamount=0;
    _items.forEach((k,cartItem){
       totalcartamount+=cartItem.quantity*cartItem.price;
    });
    return totalcartamount;
  }

  double get total {
    return cost- cost*0.125;
  }

  void removeSingleItem (String ProductId) {
    if (!_items.containsKey(ProductId)) {return;}
    if (_items [ProductId].quantity >1) {
      _items.update(ProductId, (existingCartItem){
        return Cart_Item(
            id: existingCartItem.id,
            img: existingCartItem.img,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity -1,
            title: existingCartItem.title
        );});
    }
    else {_items.remove(ProductId);}
    notifyListeners();
  }

  void removeitem (String ProductId){
    _items.remove(ProductId);
    notifyListeners();
  }

}