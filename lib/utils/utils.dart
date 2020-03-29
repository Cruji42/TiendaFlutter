import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mongo/model/product.dart';

final String API_URL = "http://192.168.1.73:3000";

//Future<List> getItems() async {
////  String url = 'http://192.168.1.68:3000/usuarios';
//  final response = await http.get(API_URL + "/getProducts");
//
//  if (response.statusCode == 200) {
//    final items = json.decode(response.body).cast<Map<String, dynamic>>();
//    return items.map((data) => Product.fromJson(data)).toList();
//  } else {
//    throw Exception('Error de conexión');
//  }
//}

//  Future<List<Product>> getItems() async {
//
//    var data = await http.get("http://192.168.1.73:3000/getProducts");
//
//    var jsonData = json.decode(data.body);
//
//    List<Product> products = [];
//
//    for(var u in jsonData){
//
//      Product product = Product(id: u["_id"], nombre:u["nombre"], marca:u["marca"], precio:u["precio"], cantidad:u["cantidad"], imagen:u["imagen"]);
//
//      products.add(product);
//
//    }
//
//    print(products.length);
//    print(jsonData);
//
//    return products;
//
//  }