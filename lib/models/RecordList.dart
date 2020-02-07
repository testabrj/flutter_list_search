import 'package:flutter_app_test/models/Record.dart';

class RecordList {

  List<Record> records = new List();

  RecordList({this.records});

  factory RecordList.fromJson(List<dynamic> parsedJson) {

    List<Record> recordList = new List<Record>();
    recordList = parsedJson.map((i)=>Record.fromJson(i)).toList();

    return new RecordList(
      records:recordList);

  }


}