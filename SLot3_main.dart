//hien thi du lieu len listview
import 'package:flutter/material.dart';
//main
void main(){
  runApp(const MyApp());//chay ung dung flutter
}
//dinh nghia file cau hinhf
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //giong nhu 1 container goi den component khac
    return MaterialApp(
      title: 'Slot3',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: MyListView(),//goi den man hinh chinh
    );
  }
}
//dinh nghia man hinh chinh
class MyListView extends StatefulWidget{
  //can co 1 lop rieng de quan ly trang thai
  @override
  State<StatefulWidget> createState() {
    return _MyListViewState();//lop quan ly trang thai cho man hinh chinh
  }
}
//lop quan ly trang thai cho man hinh chinh
class _MyListViewState extends State<MyListView>{
  //du lieu de hien thi
  final List<String> items = [
    'Item 1','Item 2','Item 5','Item 4','Item 9','Item 10','Item 7'
  ];
  @override
  Widget build(BuildContext context) {
    //thiet ke giao dien cho ung dung
    return Scaffold(
      appBar: AppBar(title: Text('Demo SLot 3'),),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            //tra ve ListTile de quan ly du lieu cho listview
            return ListTile(
              title: Text(items[index]),//title
              onTap: (){//xu ly su kien
                print('Item clicked: ${items[index]}');
              },
            );
          }),
    );
  }
}