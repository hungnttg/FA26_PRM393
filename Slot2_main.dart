import 'package:flutter/material.dart';
//ham main
void main(){
  runApp(const MyApp());//main se goi den ung dung flutter
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});//ham khoi tao
  //build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyCalculator(), //goi den man hinh chinh
    );
  }
}
class MyCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyCalculatorState(); //lop quan ly trang thai cua man hinh chinh
  }
}
class _MyCalculatorState extends State<MyCalculator>{
  //khai bao 2 controller de quan ly viec nhap lieu
  TextEditingController n1Control = TextEditingController();
  TextEditingController n2Control =  TextEditingController();
  //bien luu let qua
String kq='';
//ham tinh tong
void tinhtong(){
  //lay gia tri nhap vao o 2 o nhap lieu
  double n1 = double.tryParse(n1Control.text)??0.0;
  double n2 = double.tryParse(n2Control.text)??0.0;
  //thuc hien tinh tong
  double tong=n1+n2;
  //cap nhat trang thai
  setState(() {
    kq='Tong la: $tong';
  });
  //-------------------
  //chuyen sang man hinh moi de hien thi ket qua
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultSceen(kq)),);
  //------------------
}
//giao dien cua man hinh 1
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slot 2 man hinh 1'),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: n1Control,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'So 1'),
            ),
            SizedBox(height: 10.0,),
            TextField(
              controller: n2Control,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'So 2'),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
                onPressed: tinhtong, child: Text('CLick me')),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
//dinh nghia man hinh 2
class ResultSceen extends StatelessWidget{
  final String result;
  ResultSceen(this.result);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ket qua'),),
      body: Center(
        child: Text(result,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}