import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//1.main
void main(){
  runApp(MyAppSlot11());
}
//2.config
class MyAppSlot11 extends StatelessWidget{
  const MyAppSlot11({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot11',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MyListSlot11(),
    );
  }
}
//3.man hinh chinh
class MyListSlot11 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyListSlot11State();
  }
}
//4. quan ly trang thai man hinh chinh
class _MyListSlot11State extends State<MyListSlot11>{
  //code
  late List<Photo> photos;//danh sach san pham
  List<CartItem> cartUtems = [];//danh sach san pham trong gio hang
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    docDuLieuTuAPI(); //goi ham
  }
  //dinh nghia ham docDuLieuTuAPI
  Future<void> docDuLieuTuAPI() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos')
    );
    if(response.statusCode == 200){
      final List<dynamic> jsonData = json.decode(response.body);
      photos=jsonData.map((item)=>Photo.convertJsonToObject(item)).toList();
      setState(() {

      });
    } else {
      throw Exception('Khong doc duoc du lieu');
    }
  }
  //ham them san pham vao gio hang
  void addToCart(Photo photo){
    setState(() {
      cartUtems.add(CartItem(title: photo.title, imageUrl: photo.thumbnailUrl));
    });
  }
  //layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slot 11'),
      actions: [
        IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              //hien thi man hinh gio hang khi user nhap vao icon gio hang
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>ShoppingCartScreen(cartUtems: cartUtems),));
            },
            ),
      ],
      ),
      body: photos.isEmpty
      ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(photos[index].thumbnailUrl),
              onTap: (){
                //khi 1 item duoc nhap vao => them san pham vao gio hang
                addToCart(photos[index]);
              },
            );
          }),
    );
  }
}
//dinh nghia man hinh ShoppingCartScreen: xu ly gio hang
class ShoppingCartScreen extends StatelessWidget {
  final List<CartItem> cartUtems;
  ShoppingCartScreen({required this.cartUtems});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shoping Cart'),),
      body: ListView.builder(
          itemCount: cartUtems.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(cartUtems[index].title),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(cartUtems[index].imageUrl),
              ),
            );
          }),
    );
  }
}

//5.model
class Photo {
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo({required this.title,required this.url,required this.thumbnailUrl});
  factory Photo.convertJsonToObject(Map<String,dynamic> json){
    return Photo(
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}
//lop quan ly gio hang
class CartItem {
  final String title;
  final String imageUrl;
  CartItem({required this.title,required this.imageUrl});
}
