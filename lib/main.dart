import 'package:flutter/material.dart';
import 'cart.dart';
import 'productContainer.dart';
import 'catalogContainer.dart';
import 'cart_module.dart';
import 'package:provider/provider.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
        builder: (context) => CartProvider(),
        child: MaterialApp(
            theme: ThemeData(
                primaryColor: Colors.white
            ),
            home: LoginPage()
        )
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBody: true,
      appBar: AppBar(
          title: Text("Shop", style: TextStyle(color: Colors.black87),),
          backgroundColor: Color(0xFFFFFF),
          elevation: 0,
          centerTitle: true),
      body: ItemList(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Cart", style: TextStyle(color: Colors.black87),),
        icon: Icon(Icons.shopping_cart, color: Colors.black87),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoppingCart()),
          );
        },
      ),
    );
  }
}