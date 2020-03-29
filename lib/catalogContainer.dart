import 'package:flutter/material.dart';
import 'utils/utils.dart';
import 'productContainer.dart';
import './model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ItemList extends StatefulWidget {
  ItemList({Key, key}) : super(key: key);

  @override
  _ItemListState createState() => new _ItemListState();
}

class _ItemListState extends State<ItemList> {
//  Future<List> _futureItems;
  @override
  void initState() {
    super.initState();
//    _futureItems = getItems();
  }
  Future<List<Product>> getProducts() async {
//    Product p1 = new Product('asd', 'asd', 'asdasd', 12.99, 10, 'asdasda');

    var data = await http.get("http://192.168.1.73:3000/getProducts");

    var jsonData = json.decode(data.body);

    List<Product> products = [];

    for(var u in jsonData){

      Product product = Product(u["_id"], u["nombre"], u["marca"], u["precio"], u["cantidad"], u["imagen"]);

      products.add(product);
    }

    return products;

  }

  @override
  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: Container(
//        child: FutureBuilder(
//          future: getProducts(),
//          builder: (BuildContext context, AsyncSnapshot snapshot){
//            print(snapshot);
//            if(snapshot.data == null){
//              return Container(
//                  child: Center(
//                      child: Text('no datos')
//                  )
//              );
//            } else {
//              return ListView.builder(
//                itemCount: snapshot.data.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return ListTile(
//                    leading: CircleAvatar(
//                      backgroundImage: NetworkImage(snapshot.data[index].imagen),
//                    ),
//                    title: Text(snapshot.data[index].nombre),
//                    subtitle: Text(snapshot.data[index].precio.toString()),
//                    onTap: (){
//
////                      Navigator.push(context,
////                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
////                      );
//                    },
//                  );
//                },
//              );
//            }
//          },
//        ),
//      ),
//    );
//    return Container(
//      child: FutureBuilder(
//        future: getProducts(),
//        builder: (BuildContext context, AsyncSnapshot snapshot){
//          if(snapshot.data == null){
//            return Container(
//                child: Center(
//                    child: Text('No hay información')
//                )
//            );
//          } else {
//            return ListView.builder(
//              itemCount: snapshot.data.length,
//              itemBuilder: (BuildContext context, int index) {
//                return ListTile(
//                  leading: CircleAvatar(
//                    backgroundImage: NetworkImage(snapshot.data[index].imagen),
//                  ),
//                  title: Text(snapshot.data[index].nombre),
//                  subtitle: Text(snapshot.data[index].precio),
//                  onTap: (){
//
////                      Navigator.push(context,
////                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
////                      );
//                  },
//                );
//              },
//            );
//          }
//        },
//      ),
//    );
      /*child: Column(
         children: <Widget>[
          ProductContainer(
            id: 'lkasdla',
          nombre: 'Laptop',
          marca: 'HP',
          precio: 200.50,
          cantidad: 10,
          imagen: 'alguna'
      )
         ],
          )*/
      return Container(
        child:  FutureBuilder(
            future: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List content = snapshot.data;
                print(content);
                return content.isEmpty ? Center(child: Text("No hay productos disponibles")) : ListView.builder(
                    itemCount: content.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductContainer(
                          id: content[index].id,
                          nombre: content[index].nombre,
                          marca: content[index].marca,
                          precio: content[index].precio,
                          cantidad: content[index].cantidad,
                          imagen: content[index].imagen);
                    }
                );
              }
            }
        )
    );
  }
}