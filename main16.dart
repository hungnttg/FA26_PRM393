/*
* Grid layout: Cách bố trí phần tử dạng lưới (hàng, cột)
* Gallery, Product List
* GridView: là 1 widget dùng để hiển thi danh sách dạng lưới
* Kiến trúc:
* GridView
* |
* SilverGrid
* |
* GridDelegate
* => Chú ý: GridDelegate quyết định số cột, kích thước, khoảng cách
* Các cách tạo gridview:
* GridView.count
* GridView.extent: chỉ định chiều rộng tối đa của mỗi item
* GridView.builder: dùng khi danh danh sách lớn, hỗ trợ lazy loading để tiết kiệm bộ nhớ
* Môt số thuộc tính:
* số cột (crossAxisCount)
* Khoảng cách ngang (crossAxisSpacing)
* tỉ lẹ item (childAspectRatio)
* Khi nào dùng gridview: gallery, shopping app, dashboard
*
*
* */
import 'package:flutter/material.dart';
void main(){
  runApp(MyAppSlot16());
}
class MyAppSlot16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductGridPage(),
    );
  }
}
class ProductGridPage extends StatelessWidget {
  final List<String> products=[
    "Laptop",
    "Phone",
    "Tablet",
    "Camera",
    "Watch",
    "TV",
    "Speaker",
    "Keyboard"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Grid"),),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
          ),
          itemCount: products.length,
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  products[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          }),
    );

  }

}
/*
*GridView.builder
* |
* itemBuilder()
* |
* ContainerItem
* |
* Render grid layout
* Fluuter chji render nhung item hien thi tren man hinh (lazy rendering)
* Vi du: co danh sach 1000 san phamr
* => flutter render 20-30 item
* va nhung item khac duoc render khi nguoi cuon gridview
* => tieu ton it RAM va tang toc UI
* */