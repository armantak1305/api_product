import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class TodoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TodoStatePage();
  }

}
class TodoStatePage extends State<TodoPage>{
  Map<String,dynamic> mTodo={};
  @override
  void initState() {
    super.initState();
    getTodos();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body:mTodo.isNotEmpty?ListView.builder(itemBuilder: (context, index) {
        return CheckboxListTile(
          value: mTodo["todos"][index]["completed"],
          onChanged: (value){
            mTodo["todos"][index]["completed"]=value;
            setState(() {

            });
          },
          title: Text(mTodo["todos"][index]["todo"],style: TextStyle(decoration:mTodo["todos"][index]["completed"]? TextDecoration.lineThrough:TextDecoration.none),),
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
        itemCount: 30,
      ) :Center(child: CircularProgressIndicator(),),
    );
  }
  void getTodos()async{
    String url="https://dummyjson.com/todos";
    http.Response response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      mTodo= jsonDecode(response.body);
      print(mTodo);
      setState(() {});
    }
  }
}