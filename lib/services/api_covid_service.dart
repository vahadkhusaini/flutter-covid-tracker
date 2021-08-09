
import 'package:covid_apps/model/data_global.dart';
import 'package:covid_apps/model/list_global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<ListGlobal>> fetchListData() async {
  final response = await http
      .get(Uri.parse('https://coronavirus-19-api.herokuapp.com/countries'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List responsejson = jsonDecode(response.body);
    return responsejson.map((data) => new ListGlobal.fromJson(data)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

Future<DataGlobal> fetchData() async {
  final response =
      await http.get(Uri.parse('https://covid19.mathdro.id/api/countries/IDN'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return DataGlobal.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}