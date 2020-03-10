
import 'package:flutter/material.dart';
import 'package:flutter_app_test/helpers/Constants.dart';
import 'package:flutter_app_test/models/Record.dart';
import 'package:flutter_app_test/models/RecordList.dart';
import 'package:flutter_app_test/pages/DetailsPage.dart';
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


  _UserListPageState(){
    _filter.addListener((){

        if(_filter.text.isEmpty){

          setState(() {
            _searchText = "";
            _resetRecords();
          });

        } else {
          setState(() {
            _searchText = _filter.text;
          });

        }

    });

  }


  void _resetRecords() {

    this._filteredRecords.records.clear();
    this._filteredRecords.records.addAll(_records.records);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('FlutterList'),
          decoration: BoxDecoration(
            color: appDarkGreyColor,
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
    ),
      backgroundColor: appDarkGreyColor ,
      body:_buildListView(context),
      resizeToAvoidBottomPadding: false,

    );
  }

  @override
  void initState() {
    super.initState();

    _records.records = new List();
    _filteredRecords.records = new List();
    _getRecords();
  }

  void _getRecords() async {
    RecordList recordList = await RecordService().loadRecords();
    setState(() {
        this._records.records.addAll(recordList.records);
        this._filteredRecords.records.addAll(recordList.records);
    });

  }


  onSearchPressed() {
      setState(() {
        if(this._searchIcon.icon == Icons.search) {
          this._searchIcon = new Icon(Icons.close);
          this._appBarTitle = new TextField(
            controller: _filter,
            style: new TextStyle(color: Colors.white),
            decoration: new InputDecoration(
                prefixIcon: new Icon(Icons.search, color: Colors.white),
                fillColor: Colors.white,
                hintText: 'Search by name',
                hintStyle: TextStyle(color: Colors.white)
            ),
          );
        } else {
          this._searchIcon = new Icon(Icons.search);
          this._appBarTitle = new Text(appTitle);
          this._filter.clear();

        }
      });
  }


  Widget _buildAppBar(BuildContext context) {

    return new AppBar(
        elevation: 0.1,
        backgroundColor: appDarkGreyColor,
        centerTitle: true,
        title: _appBarTitle,
        leading: new IconButton(
          icon: _searchIcon,
          onPressed: onSearchPressed,
        )
    );
  }

  Widget _buildListView(BuildContext context) {

    if (!(_searchText.isEmpty)) {
      _filteredRecords.records = new List();
      for (int i = 0; i < _records.records.length; i++) {
        if (_records.records[i].name.toLowerCase().contains(_searchText.toLowerCase())
            || _records.records[i].address.toLowerCase().contains(_searchText.toLowerCase())) {
          _filteredRecords.records.add(_records.records[i]);
        }
      }
    }

    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: this._filteredRecords.records.map((data) => _buildListItem(context, data)).toList(),
    );

  }

  Widget _buildListItem(BuildContext context, Record data) {

    return Card(
      key: ValueKey(data.name),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child:Container(
          decoration: BoxDecoration(color:Color.fromRGBO(64, 75, 96, .9)),

          child:ListTile(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> new DetailsPage(record: data)));
            },
            contentPadding:
            EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading:Container(
              decoration: BoxDecoration(border:new Border( right: new BorderSide(width: 1.0,color:Colors.white24))),
              padding: EdgeInsets.only(right: 12.0),
              child: new Hero(tag: "avatar_"+data.name, child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(data.photo),
              )),
            ),
            title: Text(
              data.name,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(child: RichText(text: TextSpan(
                    text: data.address,
                    style: TextStyle(color:Colors.white)
                )),)
              ],
            ),
            trailing:Icon(Icons.keyboard_arrow_right,color: Colors.white,size:30),
          )),


    );



  }



}