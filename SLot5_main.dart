

//Class quan ly Photo
/*
* Luồng hoạt động
main() -> MyApp -> MyListView -> initState ->
* fetchDataFromServer -> HTTP Get -> JSONPlaceholder API
-> JSON -> Photo.fromJSON -> List<Photo> ->
Listview.builder
-> hiển thị danh sách
* */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(){
  runApp(const MyApp());
}
//widget goc cua ung dung
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot5',
      theme:ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyListView(),
    );
  }
}
//man hinh danh sach
class MyListView extends StatefulWidget{
  const MyListView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyListViewState();
  }
}
//quan ly trang thai man hinh chinh
class _MyListViewState extends State<MyListView>{
  List<Photo> photos = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataFromServer();
  }
  //doc du lieu tu API
Future<void> fetchDataFromServer() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );
    //neu co du lieu
    if(response.statusCode == 200){
      final List<dynamic> jsonData = json.decode(response.body);
      //chuyen thanh list
      photos = jsonData.map((item)=>Photo.fromJson(item)).toList();
      //reset lai trang thai
      setState(() {

      });
    }
    else {
      throw Exception('Failed to load data from the server');
    }
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listview SLot5'),),
      body: photos.isEmpty
      ? const Center(
        child: CircularProgressIndicator(),//dang doc du lieu
      ): ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(photos[index].title),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(photos[index].thumbnailUrl),
              ),
              onTap: (){
                print('Item clicked: ${photos[index].title}');
              },
            );
          }),
    );
  }
}
class Photo {
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo({
    required this.title,
    required this.url,
    required this.thumbnailUrl
  });
  //fromJSON: chuyen JSON thanh doi tuong Photo
  factory Photo.fromJson(Map<String,dynamic> json){
    return Photo(
        title: json['title'], 
        url: json['url'], 
        thumbnailUrl: json['thumbnailUrl']);
  }
}