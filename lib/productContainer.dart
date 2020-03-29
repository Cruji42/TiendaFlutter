import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_module.dart';
import './model/product.dart';

class ProductContainer extends StatefulWidget {
  String id;
  String nombre;
  String marca;
  double precio;
  int cantidad;
  String imagen;

  ProductContainer({this.id, this.nombre, this.marca, this.precio, this.cantidad, this.imagen});

  @override
  _ProductContainerState createState() => new _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  var provider;
  var cart;
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CartProvider>(context);
    cart = provider.itemsCart;
    /*
    if (cart.contains(widget.id)) {
      setState(() {
        isAdded = true;
      });
    }*/
    return new Container(
      height: 380.0,
      width: double.infinity,
      decoration: BoxDecoration(
//          color: convertColor(Colors.gr).withOpacity(0.2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Image.network(
            widget.imagen,
            width: 200,
            height: 100,
          ),
          Text(
            widget.nombre,
            style: TextStyle(
                fontSize: 20,
                ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("\$" + widget.precio.toString(),
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            )),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
//                      color: convertColor(widget.color).withOpacity(0.8),
                      onPressed: () {
                        Product product = new Product(
//                            id: widget.id,
//                            nombre: widget.nombre,
//                            marca: widget.marca,
//                            precio: widget.precio,
//                            cantidad: widget.cantidad,
//                            imagen: widget.imagen
                            widget.id,
                            widget.nombre,
                            widget.marca,
                            widget.precio,
                            widget.cantidad,
                            widget.imagen

                        );
                        if (isAdded) {
                          provider.removeObjectFromCart(widget.id);
                          setState(() {
                            isAdded = false;
                          });
                        } else {
                          provider.addObjectToCart(product);
                          setState(() {
                            isAdded = true;
                          });
                        }
                      },
                      icon: (isAdded) ? Icon(Icons.remove_shopping_cart) : Icon(Icons.add_shopping_cart),
                      label: (isAdded) ? Text("Remover del carrito") : Text("Agregar al carrito"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(25.0),
    );
  }
}
//Color convertColor(String hexColor) {
//  hexColor = hexColor.replaceAll("#", "");
//  if(hexColor.length == 6) {
//    hexColor = "FF" + hexColor;
//  }
//
//  if (hexColor.length == 8) {
//    return Color(int.parse("0x$hexColor"));
//  }

