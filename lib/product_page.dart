import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/product_model.dart';

class ProductsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductsPageState();
  }

}

class ProductsPageState extends State<ProductsPage>{
  ProductsModel? allProducts;
  @override
  void initState() {
    super.initState();
    getProducts();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Prducts"),
      ),
      body: allProducts!=null?allProducts!.products!.isNotEmpty?ListView.builder(
          itemCount: allProducts!.products!.length,
          itemBuilder: (_,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    ListTile(
                      leading: IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart)),
                      title: Text(allProducts!.products![index].title.toString()),
                      subtitle: Text("\$${allProducts!.products![index].price}"),
                      trailing: Image.network(allProducts!.products![index].images![0]),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: allProducts!.products![index].images!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_,childindex){

                            return Image.network(allProducts!.products![index].images![childindex],height: 150);
                          }),
                    )

                  ],
                ),
              ),
            );
          }):Center(child: Text("No Products yet!!"),):Center(child:CircularProgressIndicator(),),
    );
  }

  void getProducts()async{
    String url="https://dummyjson.com/products";
    http.Response response= await  http.get(Uri.parse(url));
    // http.Response resp = http.get(Uri.parse(url));
    if(response.statusCode==200){
      var rawData = jsonDecode(response.body);
      allProducts = ProductsModel.fromjson(rawData);
      setState(() {

      });
    }
    print(allProducts);

  }

}