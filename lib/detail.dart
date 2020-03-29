//import 'package:flutter/material.dart';
//import 'product.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'home.dart';
//
//class DetailPage extends StatelessWidget {
//
//  Product product;
//  DetailPage(this.product);
//
//  TextEditingController nombre = TextEditingController ();
//  TextEditingController marca = new TextEditingController ();
//  TextEditingController precio = new TextEditingController ();
//  final _formKey = GlobalKey<FormState>();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(product.nombre),
//        ),
//        body:Form(
//          key: _formKey,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Center(
//                  child:
//                  Image.network(product.imagen, height: 150)
//              ),
//              TextFormField(
//                controller: nombre,
//                decoration: const InputDecoration(
//                  hintText: 'Ingrese nombre de usuario',
//                  labelText: 'Nombre',
//                ),
//                validator: ( controller) {
//                  if (controller.isEmpty) {
//                    return 'Ingresa el nombre';
//                  }
//                  return null;
//                },
//              ),
//              TextFormField(
//                controller: marca,
//                decoration: const InputDecoration(
//                  hintText: 'Ingrese Apellidos',
//                  labelText: 'Apellidos',
//                ),
//                validator: ( controller) {
//                  if (controller.isEmpty) {
//                    return 'Ingresa los apellidos';
//                  }
//                  return null;
//                },
//              ),
//              TextFormField(
//                controller: precio,
//                decoration: const InputDecoration(
//                  hintText: 'Ingrese Correo',
//                  labelText: 'Correo',
//                ),
//                validator: ( controller) {
//                  if (controller.isEmpty) {
//                    return 'Ingresa el correo';
//                  } else if(!controller.contains('@')){
//                    return 'Ingresa una direccion valida';
//                  }else{
//                    return null;
//                  }
//                },
//              ),
//              Center(
//                child:
//                Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 16.0),
//                  child: RaisedButton(
//                    onPressed: () {
//                      if(_formKey.currentState.validate()){
//                        update(nombre.text, marca.text, precio.text);
//                        Navigator.push(context,
//                            new MaterialPageRoute(builder: (context) => HomePage())
//                        );
//                      }
//                    },
//                    child: Text('Editar'),
//                  ),
//                ),
//              ),Center(
//                child:
//                Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 16.0),
//                  child: RaisedButton(
//                    onPressed: () {
//                      delete(product.nombre);
//                      Navigator.push(context,
//                          new MaterialPageRoute(builder: (context) => HomePage())
//                      );
//                    },
//                    child: Text('Eliminar'),
//                  ),
//                ),
//              )
//            ],
//          ),
//        )
//    );
//  }
//  update(nombre,  marca,  precio) async {
//    Map data = {
//      'nombre': nombre,
//      'marca': marca,
//      'precio': precio,
//    };
//    print(data);
//    var jsonResponse = '';
//    var response = await http.post('http://192.168.1.73:3000/updateProduct', body: data);
//    if(response.statusCode == 200){
//      jsonResponse = json.decode(response.body);
//      if(jsonResponse != null){
//        print(response.body);
//      }
//    }else{
//      print(response.body);
//    }
//  }
//
//  delete(id) async {
//    var jsonResponse = '';
//    var response = await http.delete('http://192.168.1.73:3000/deleteProduct/'+ id);
//    if(response.statusCode == 200){
//      jsonResponse = json.decode(response.body);
//      if(jsonResponse != null){
//        print(response.body);
//      }
//    }else{
//      print(response.body);
//    }
//  }
//
//}