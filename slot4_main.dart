import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
//file cau hinh
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot4',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      ),
      home: MyListView(),
    );
  }
}
//man hinh chinh
class MyListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyListViewState();//lop quan ly trang thai cho man hinh chinh
  }
}
class _MyListViewState extends State<MyListView>{
  //hom sau thay boi API
  final List<ListItem> items = [
    ListItem(title: 'SO 1', subtitle: 'Chi tiet so 1', imageUrl: 'https://placehold.co/50'),
    ListItem(title: 'SO 3', subtitle: 'Chi tiet so 3', imageUrl: 'https://placehold.co/50'),
    ListItem(title: 'SO 10', subtitle: 'Chi tiet so 10', imageUrl: 'https://placehold.co/50'),
    ListItem(title: 'SO 2', subtitle: 'Chi tiet so 2', imageUrl: 'https://placehold.co/50'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slot 4 Listview'),),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].subtitle),
              leading: CircleAvatar(backgroundImage: NetworkImage(items[index].imageUrl),),
              onTap: (){
                print('Item clicked: ${items[index].title}');
              },
            );
          }),
    );
  }
}
//lop quan ly model (dai dien cho 1 muc trong listview)
class ListItem{
  final String title;
  final String subtitle;
  final String imageUrl;
  ListItem({required this.title,required this.subtitle,required this.imageUrl});
}