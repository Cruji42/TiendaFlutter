/*
class Product {
  final String id;
  final String nombre;
  final double precio;
  final int cantidad;
  final String marca;
  final String imagen;

  Product ({this.id, this.nombre, this.marca, this.precio, this.cantidad, this.imagen});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['_id'] as String,
        nombre: json['nombre'] as String,
        marca: json['marca'] as String,
        precio: json['precio'] as double,
        cantidad: json['cantidad'] as int,
        imagen: json['imagen'] as String
    );
  }
}*/

class Product {
  final String id;
  final String nombre;
  final String marca;
  final double precio;
  final int cantidad;
  final String imagen;

  Product(this.id, this.nombre, this.marca, this.precio, this.cantidad, this.imagen);

  factory Product.fromJson(Map<String, dynamic> json) {
    return json['message'];
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["_id"] = id;
    map["nombre"] = nombre;
    map["marca"] = marca;
    map["precio"] = precio as double;
    map["cantidad"] = cantidad as int;
    map["imagen"] = imagen;

    return map;
  }
}
