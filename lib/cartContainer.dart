
import 'package:flutter/material.dart';
import './model/product.dart';

class ProductCart extends StatefulWidget {
  Product product;

  ProductCart({this.product});

  @override
  _ProductCartState createState() => new _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(20.0),
      leading: Image.network(widget.product.imagen),
      title: Text(widget.product.nombre,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: "Helvetica")),
      subtitle: Text(widget.product.marca.toString(), style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: "Raleway")),
      trailing: Text("\$${widget.product.precio.toString()}", style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: "Helvetica")),
    );
  }
}