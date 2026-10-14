import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
void main(){
  runApp(MaterialApp(home: LoginPage()));
}
class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}
class _LoginPageState extends State<LoginPage>{
  //controller dieu khien nhap lieu
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String msg="";
  bool loading = false;
  //viet ham login
  Future login() async {
    setState(() {
      loading=true;
    });
    try {
      final res = await http.post(
        Uri.parse('http://10.22.10.72:3033/login'),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode({"email":user.text,"password":pass.text}),
      );
      final data = jsonDecode(res.body);
      if(res.statusCode == 200){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", data["token"]);
        setState(() {
          msg="Login thanh cong";
        });
      }
      else{
        setState(() {
          msg=data["error"];
        });
      }
    }
    catch (e){
      msg = "Loi ket noi";
    }
    setState(() {
      loading=false;
    });
  }
  //giao dien
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login API"),),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: user,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: pass,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 20,),
              loading
                ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: login, child: Text("Login")),
              SizedBox(height: 20,),
              Text(msg),
            ],
          )),
    );
  }
}