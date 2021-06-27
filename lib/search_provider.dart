import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:search_test/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Search list;
  var count;
  get getSearchData => list;
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name = sharedPreferences.getString('fname');
    return Text(name);
  }

  Future callAPIForSearchData(String text) async {
    // _isLoading = true;
    http.Response response = await http.get(
      Uri.parse(
          'http://easydoseapi-001-site1.htempurl.com/api/user/GetSearchValue?search=$text'),
    );
    int statusCode = response.statusCode;
    print('test ' + statusCode.toString());
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      _isLoading = false;
    } else {
      var data = json.decode(response.body);
      list = Search.fromJson(data[0]);
      print(list.name);
      notifyListeners();
    }
  }
}
