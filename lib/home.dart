//import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'model/product.dart';
//import 'login.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//
//class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Home Page',
//      debugShowCheckedModeBanner: false,
//      theme: new ThemeData(
//          primarySwatch: Colors.blue,
//          appBarTheme: AppBarTheme(
//            color: Colors.red,
//          )
//      ),
//      home: new MyHomePage(title: 'Home'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  SharedPreferences sharedPreferences;
//
//  @override
//  void initState() {
//    super.initState();
//    checkLoginStatus();
//  }
//
//  checkLoginStatus() async {
//    sharedPreferences = await SharedPreferences.getInstance();
//    if(sharedPreferences.getString("token") == null) {
//      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
//    }
//  }
//
//  Future<List<Product>> _getProducts() async {
//
//    var data = await http.get("http://192.168.1.73:3000/getProducts");
//
//    var jsonData = json.decode(data.body);
//
//    List<Product> products = [];
//
//    for(var u in jsonData){
//
//      Product product = Product(u["_id"], u["nombre"], u["marca"], u["precio"], u["cantidad"], u["imagen"]);
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
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title),
//        actions: <Widget>[
//          FlatButton(
//            onPressed: () {
//              sharedPreferences.clear();
//              sharedPreferences.commit();
//              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
//            },
//            child: Text("Log Out", style: TextStyle(color: Colors.white)),
//          ),
//        ],
//      ),
//      body: Container(
//        child: FutureBuilder(
//          future: _getProducts(),
//          builder: (BuildContext context, AsyncSnapshot snapshot){
//            print(snapshot.data);
//            if(snapshot.data == null){
//              return Container(
//                  child: Center(
//                      child: Image.asset(
//                          "assets/images/logo.png")
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
//                    subtitle: Text(snapshot.data[index].precio),
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
//  }
//}
