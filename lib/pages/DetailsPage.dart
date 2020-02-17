import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/helpers/URLLauncher.dart';
import 'package:flutter_app_test/models/Record.dart';

class DetailsPage extends StatelessWidget{
  final Record record;
  DetailsPage({this.record});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar( title: new Text(record.name)),
      body: new ListView(
        children: <Widget>[
          Hero(tag: "avatar_"+record.name, child: new Image.network(record.photo)),
          GestureDetector(
            onTap: (){
              URLLauncher().launchURL(record.url);},
            child: Container(padding: EdgeInsets.all(32.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                        padding:EdgeInsets.only(bottom: 8),
                        child: new Text("Name: "+record.name, style: TextStyle(fontWeight: FontWeight.bold))
                        ),
                        new Text("Address: "+record.address, style: TextStyle(color: Colors.grey),)
                      ],
              )), new Icon(Icons.phone,color: Colors.red),
                  new Text('${record.contact}')
                ],
            ),),

          )
        ],
      )
    );
  }

}