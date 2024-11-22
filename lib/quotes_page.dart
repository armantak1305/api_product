import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as httpClient;

import 'models/quotes_model.dart';

class QuotesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return QuotesPageState();
  }

}

class QuotesPageState extends State<QuotesPage>{
  QuotesDataModel? mData;
  Map<String,dynamic> userImg={};
  @override
  @override
  void initState() {
    super.initState();
    getQuotes();
    getUserImg();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
      ),
      body:mData!=null?mData!.quotes.isNotEmpty?ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(userImg["users"][index]["image"]),
          ),
          title: Text(mData!.quotes[index].quote!),
          subtitle: Text(mData!.quotes[index].author!),
        );
      },
        itemCount: mData!.quotes.length,
      ):  Center(child: CircularProgressIndicator(),):Container(),
    );
  }

  void getQuotes()async{
    String url="https://dummyjson.com/quotes";
    httpClient.Response resp= await httpClient.get(Uri.parse(url));
    if(resp.statusCode==200){
      var rawData = jsonDecode(resp.body);
      mData = QuotesDataModel.fromjson(rawData);
      // print(mData);
      setState(() {

      });
    }

  }
  void getUserImg()async{
    String url="https://dummyjson.com/user";
    httpClient.Response response= await httpClient.get(Uri.parse(url));
    if(response.statusCode==200){
      userImg = jsonDecode(response.body);
      //print(userImg);
      setState(() {

      });
    }
  }


}