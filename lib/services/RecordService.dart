
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app_test/models/RecordList.dart';

class RecordService {

  Future<String> _loadRecordsAsset() async {

    return await rootBundle.loadString('assets/data/records.json');

  }

  Future<RecordList> _loadRecords() async {

    String jsonString = await _loadRecordsAsset();
    final jsonResponse = jsonDecode(jsonString);
    RecordList records = new RecordList.fromJson(jsonResponse);
    return records;


  }

}