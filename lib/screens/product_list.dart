import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ProductListState();
  }

}
class _ProductListState extends State{
  var dbHelper = DbHelper();
  late List<Product> products;
  int productCount = 0;
  @override
  void initState() {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) => this.products = data);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün listesi"),
      ),
      body: buildProductList(),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
      itemCount: productCount,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.blueAccent,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.black12,child: Text("P")),
            title: Text(this.products[position].productName),
            subtitle: Text(this.products[position].description),
            onTap: (){},
          ),
        );
      });
  }

}