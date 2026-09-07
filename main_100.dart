//ung dung tinh tong
//b1-import thu vien
import 'package:flutter/material.dart';
//b2: viet ham main
void main(){
  runApp(const MyApp());//goi den ung dung flutter
}
//b3: viet file cau hinh
class MyApp extends StatelessWidget {
  const MyApp({super.key}); //ham khoi tao
  @override
  Widget build(BuildContext context) { //to chuc giao dien
    return MaterialApp(
      title: 'Flutter Demo1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyCalculator(),//goi den man hinh chinh
    );
  }
}
//dinh nghia man hinh chinh
class MyCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyCalculatorState(); //_MyCalculatorState quan ly trang thai cho MyCalculator
  }
}
//viet phan quan ly trang thai
class _MyCalculatorState extends State<MyCalculator>{
  //thuc hien viec xu ly tinh tong o day
  //khai bao cac control dieu khien
  TextEditingController num1Control = TextEditingController();
  TextEditingController num2Control = TextEditingController();
  //khai bao bien de luu ket qua
  String result='';
  //ham tinh tong va cap nhat trang thai
  void calculatorSum(){
    //lay ve gia tri tu 2 o nhap lieu
    double num1 = double.tryParse(num1Control.text)??0.0;
    double num2 = double.tryParse(num2Control.text)??0.0;
    //tinh tong
    double num = num1 + num2;
    //cap nhat trang thai
    setState(() {
      result='Tong: $num';
    });
  }
  //giao dien
  @override
  Widget build(BuildContext context) {
    return Scaffold( //tra ve 1 man hinh
      appBar: AppBar(title: Text('Ung dung tinh tong 1'),),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text1
            TextField(
              controller: num1Control,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'NHap so 1'),
            ),
            SizedBox(height: 10.0,),
            TextField(
              controller: num2Control,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'NHap so 2'),
            ),
            SizedBox(height: 20.0,),
            //button
            ElevatedButton(onPressed: calculatorSum, child: Text('Tinh tong')),
            SizedBox(height: 20.0,),
            //ket qua
            Text(result,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)
          ],
        ),
      ),

    );
  }
}