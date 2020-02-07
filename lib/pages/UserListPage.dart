
import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/Record.dart';
import 'package:flutter_app_test/models/RecordList.dart';
import 'package:flutter_app_test/services/RecordService.dart';

class UserListPage extends StatefulWidget {

  @override
  _UserListPageState createState(){
    return _UserListPageState();
  }


}

class _UserListPageState extends State<UserListPage> {


  final TextEditingController _filter = new TextEditingController();

  RecordList _records = new RecordList();
  RecordList _filteredRecords = new RecordList();

  String _searchText = "";

  Icon _searchIcon = new Icon(Icons.search);

  Widget _appBarTitle = new Text(appTitle);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}