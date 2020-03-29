
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_module.dart';
import 'cartContainer.dart';
import './model/product.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    var cart = provider.itemsCart;
    var total = getTotal(cart);
    return Scaffold(
        appBar: AppBar(
          title: Text("Mi carrito", style: TextStyle(color: Colors.black87, fontFamily: "Raleway"),),
          backgroundColor: Color(0xFFFFFF),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),),
        body: Column(
          children: <Widget>[
            Expanded(
              child: cart.isEmpty ? Center(child: Text("Carrito vacio.",
                  style: TextStyle(fontFamily: "Raleway", fontSize: 18))) :
              ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    return ProductCart(product: cart[index]);
                  }),
            ),
            SizedBox(
              height: 80,
              child: Text("Total: \$$total",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Helvetica")),
            )
          ],
        ));
  }

  double getTotal(List<Product> list) {
    var total = 00.00;
    for (var i = 0; i < list.length; i++) {
      total += list[i].precio;
    }
    return total;
  }
}