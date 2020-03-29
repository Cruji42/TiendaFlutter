import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'sign.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  bool _isLoading = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
//            Aqui puedo poner por secciones los componentes
            TextSection(),
            InputSection(),
            ButtonSection()
          ],
        ),
      ),
    );
  }

  LogIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'correo': email,
      'contrasena': pass
    };
    var jsonResponse = null;
    var response = await http.post("http://192.168.1.73:3000/Login", body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", 'tokengeneradodesdeAPI');
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container InputSection(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.black,),
              hintText: 'Correo:',
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.black,
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.black),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Container ButtonSection(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: emailController.text == "" || passwordController.text == "" ? null: (){
              setState(() {
                _isLoading = true;
              });
              LogIn(emailController.text, passwordController.text);
            },
            elevation: 0.0,
            color: Colors.green,
            child: Text("Login", style: TextStyle(color: Colors.white70)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          RaisedButton(
            onPressed: Navigate,
            elevation: 0.0,
            color: Colors.green,
            child: Text("Sign In", style: TextStyle(color: Colors.white70)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ],
      ),
    );
  }

  Container TextSection(){
    return Container(
        child: Column(
          children: <Widget>[
        Image.asset('assets/images/logo.png', scale: 5),
            Text('Tienda', style: TextStyle(color: Colors.green, fontSize: 24))
          ],
        ),
    );
  }

  Navigate(){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SignPage()), (Route<dynamic> route) => false);
  }

}