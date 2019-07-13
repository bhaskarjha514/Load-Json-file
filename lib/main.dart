import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.teal,
  ),
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
  return Scaffold(appBar: AppBar(
    title: Text("LOAD JSON APP"),
   backgroundColor: Colors.deepOrange,  
  ),
  body: Container(
    child: Center(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('load_json/person.json'),
        builder: (context, snapshot){
          // decode json;
          var mydata = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (BuildContext context, int index){
              return new Card(child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Text("Name: "+mydata[index]['name']),
                  new Text("Age: "+mydata[index]['age']),
                  new Text("Profession: "+mydata[index]['profession']),
                  new Text("Gender: "+mydata[index]['gender']),
                  new Text("Hair_color: "+mydata[index]['hair_color']),
                ],
              ));
            },
               itemCount: mydata == null ? 0 : mydata.length,
          );
        },
      ),
    ),
  ),
      
    );
  }
}