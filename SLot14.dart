import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(){
  runApp(MaterialApp(home: MyAppSlot14()));
}
class MyAppSlot14 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppSlot14State();
  }
}
class _MyAppSlot14State extends State<MyAppSlot14>{
  List data = [];
  TextEditingController txt=TextEditingController();
  String url = "http://localhost:3009/products";
  @override
  void initState() {
    loadData();
  }
  Future loadData() async {
    try {
      final res = await http.get(Uri.parse(url));
      print("Status code: ${res.statusCode}");
      print("Response Body: ${res.body}");
      setState(() {
        data = jsonDecode(res.body);
      });
    }
    catch (e){
      print("Loi ket noi: $e");
    }
  }
  Future addData() async {
    await http.post(
      Uri.parse(url),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode({"name":txt.text}),
    );
    txt.clear();
    loadData();
  }
  Future deleteData(id) async {
    await http.delete(Uri.parse("$url/$id"));
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slot14"),),
      body: Column(
        children: [
          TextField(
            controller: txt,
            decoration: InputDecoration(hintText: "Ten san pham"),
          ),
          ElevatedButton(onPressed: addData, child: Text("THEM")),
          Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_,i){
                    return ListTile(
                      title: Text(data[i]["name"]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){
                          deleteData(data[i]["id"]);
                        }),
                    );
                  }),
          ),
        ],
      ),
    );
  }
}