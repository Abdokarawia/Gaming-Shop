import '../Providers/Product_Provider.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> Products = [
    Product(
      title: 'Logitech',
      subtitle: 'G502 Wireless Gaming',
      price: 120,
      id: 'm1',
      decoration: "G502 LIGHTSPEED was designed to be the ultimate G502 gaming mouse ever made. It keeps the exact same ID and feature set of the original, but is completely re-engineered to incorporate our most recent innovations. The internal structure features the same thin wall design and advanced ",
      img: 'https://i.imgur.com/L811Ci0.png',
      Category_id: 'Mice',
    ),
    Product(
        title: 'Redragon',
        subtitle: 'Mamba Tournament Edition',
        price: 100,
        id: 'm2',
        img: 'https://i.imgur.com/KmLTQ6d.png',
        decoration:
            "The world’s most precise gaming mouse sensor with 16,000 DPI ,Prices exclude taxes and shipping charges. Additional customs and tariff fees may apply ,Nine independently programmable buttons with tilt-click scroll wheel,Chroma lighting with true 16.8 million customizable color options",
        Category_id: 'Mice'),
    Product(
        title: 'PS4 Accessories',
        subtitle: 'DUALSHOCK®4 Wireless',
        price: 50,
        id: 'm3',
        img: 'https://i.imgur.com/ccJgTmk.png',
        decoration: "The DUALSHOCK®4 Wireless Controller for PlayStation®4 defines this generation of play, combining revolutionary features and comfort with intuitive, precision controls.Evolved analog sticks and trigger buttons allow for unparalleled accuracy with every move,",
        Category_id: 'Controller'),
    Product(
        title: 'XBOX Accessories ',
        subtitle: 'Phantom Magenta ',
        price: 100,
        id: 'm4',
        img: 'https://i.imgur.com/ve9ntRV.png',
        decoration: "Equip yourself with the Xbox Wireless Controller – Phantom Magenta Special Edition, featuring a translucent design that fades to dark pink, and textured grip for enhanced comfort. Enjoy custom button mapping and plug in any compatible headset with the 3.5mm stereo headset jack.",
        Category_id: 'Controller'),
    Product(
        title: 'Logitech',
        subtitle: 'G533 Prodigy',
        price: 90,
        id: 'm5',
        decoration: "Harness the power of Artificial Intelligence to deliver truly immersive sound experiences uniquely crafted for your ears. With Immerse, you hear the precise location of enemy footsteps and reload sounds, you have the advantage of hearing your enemies before they hear you.",
        img: 'https://i.imgur.com/b1MV9TB.png',
        Category_id: 'Headset'),
    Product(
        title: 'Sony',
        subtitle: 'ps5-wireless headset',
        price: 120,
        id: 'm6',
        decoration: "Enjoy a seamless, wireless experience with a headset fine-tuned for 3D Audio on PS5 consoles1. The PULSE 3D wireless headset features a refined design with dual noise-cancelling microphones, USB Type-C® charging, and an array of easy-access controls, ",
        img: 'https://i.imgur.com/uvV2kMt.png',
        Category_id: 'Headset'),
    Product(
        title: 'Sony',
        subtitle: 'Playstation-4 pro',
        price: 400,
        id: 'm7',
        decoration: "Discover all of the amazing connectivity and personalization features that make PlayStation®4 the destination for the best gaming and entertainment experiences , Set up your user account to connect to PlayStation Network and access the PlayStation 4 system’s robust online features.",
        img: 'https://i.imgur.com/xz6uf5e.png',
        Category_id: 'Console'),
    Product(
        title: 'Microsoft',
        subtitle: 'Xbox one',
        price: 300,
        decoration: "Experience richer, more luminous colors in games like Forza Horizon 4, Crackdown 3, and Battlefield V. With a higher contrast ratio between lights and darks, High Dynamic Range technology brings out the true visual depth of your games. 1",
        id: 'm8',
        img: 'https://i.imgur.com/wWgG9Hy.png',
        Category_id: 'Console'),
  ];

  void notify() {
    notifyListeners();
  }

  Product findByID(String id) {
    return Products.firstWhere((prod) {
      return prod.id == id;
    });
  }
  var pr;

  void addProduct () {
    return Products.add(pr);
  }
}