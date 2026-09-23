//hien thi gridview co anh
import 'package:flutter/material.dart';
//ham main
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot6 gridview',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyGridViewSlot6(),
    );
  }
}
//man hinh chinh
class MyGridViewSlot6 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyGridViewSlot6State();
  }
}
//lop quan ly trang thai
class _MyGridViewSlot6State extends State<MyGridViewSlot6>{
  //mamh di lieu co anh
  final List<ListItem> items = [
    ListItem(
        title: 'Cat',
        subtitle: 'Cat cute',
        imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400',
    ),
    ListItem(
      title: 'Dog',
      subtitle: 'Lovely Dog',
      imageUrl: 'https://images.unsplash.com/photo-1517849845537-4d257902454a?w=400',
    ),
    ListItem(
      title: 'Mountain',
      subtitle: 'Beautiful mountain',
      imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=400',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gridview example'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          //2 cot
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8),
          itemCount: items.length,
          itemBuilder: (context,index){
            return Card(
              elevation: 3,
              child: InkWell(
                onTap: (){
                  print('Item clicked: ${items[index].title}');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //anh
                    Expanded(
                        child: Image.network(items[index].imageUrl,fit: BoxFit.cover,),
                    ),
                    //tieu de
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          items[index].title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),    
                    ),
                    //mo ta
                    Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Text(items[index].subtitle),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
//lop quan ly doi tuong ListItem
class ListItem{
  final String title;
  final String subtitle;
  final String imageUrl;
  ListItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl
  });
}