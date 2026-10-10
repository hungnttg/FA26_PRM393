import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//1.main
void main(){
  runApp(const MyAppSlot10());
}
//2. cau hinhf
class MyAppSlot10 extends StatelessWidget{
  const MyAppSlot10({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot10',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MySLot10(),
    );
  }
}
//3.man hinh chinh
class MySLot10 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MySLot10State();
  }
}
//4. quan ly trang thai man hinh chinh
class _MySLot10State extends State<MySLot10>{
  List<Photo> photos=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    docDuLieu();
  }
  Future<void> docDuLieu() async {
    final res = await http.get(Uri.parse('http://10.22.10.72:3015/get'));
    if(res.statusCode==200){
      final List<dynamic> jsonData=json.decode(res.body);
      photos = jsonData.map((item)=>Photo.jsonToObject(item)).toList();
      setState(() {

      });
    }
    else {
      throw Exception('Doc du lieu that bai');
    }
  }
  //xay dung giao dien
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vi du'),),
      body: photos.isEmpty
      ? const Center(child: CircularProgressIndicator(),)
      : ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(photos[index].thumbnailUrl),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(photos[index].thumbnailUrl),
              ),
              onTap: (){
                //khi 1 item duoc vao => chuyen sang man hinh chi tiet
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>DetailScreen(
                          title: photos[index].title,
                          imageUrl: photos[index].url,
                        )));
              },
            );
          })
      ,
    );
  }
}
//5. model
class Photo {
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo({required this.title,required this.url, required this.thumbnailUrl});
  //phuong thuc chuyen doi json sang object
  factory Photo.jsonToObject(Map<String, dynamic> j){
    return Photo(title: j['title'], url: j['url'], thumbnailUrl: j['thumbnailUrl']);
  }
}
//6.detail
class DetailScreen extends StatelessWidget{
  final String title;
  final String imageUrl;
  DetailScreen({required this.title,required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Image.network(imageUrl),
          ],
        ),
      ),
    );
  }
}