import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//1.main
void main(){
  runApp(const MyAppSlot9());
}
//2.cau hinh
class MyAppSlot9 extends StatelessWidget{
  const MyAppSlot9({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyAppSlot9',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyListViewSlot9(),//goi den man hinh chinh
    );
  }
}
//3.main hinh chinh
class MyListViewSlot9 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyListViewSlot9State();
  }
}
//4.lop quan ly trang thai cho man hinh chinh
class _MyListViewSlot9State extends State<MyListViewSlot9>{
   List<Photo> photos=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataFromAPI();
  }
  Future<void> fetchDataFromAPI() async {
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if(res.statusCode==200){
      final List<dynamic> jData = json.decode(res.body);
      setState(() {
        photos=jData.map((item)=>Photo.fromJson(item)).toList();
      });

    }
    else {
      throw Exception('Faile to load data from the API');
    }
  }
  //thiet ke giao dien
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slot9 example'),),
      body: photos.isEmpty
      ? const Center(child: CircularProgressIndicator(),)
      : ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(photos[index].title),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(photos[index].thumbnailUrl),
              ),
              onTap: (){
                print('Ban vua click: ${photos[index].title}');
              },
            );
          }),
    );
  }
}
//5.lop quan ly API
class Photo {
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo({required this.title, required this.url, required this.thumbnailUrl});
  //phuong chuyen doi Json thanh Object
  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}