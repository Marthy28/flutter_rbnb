import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:rbnbcpyflutter/bo/city.dart';

class CityListModel {
  void fetchMessages(StreamController<List<City>> controller) {
    List<City> listCities = [];
    Future<Response> resCity = get(Uri.parse("https://flutter-learning.mooo.com/villes"));
    resCity.then((value) {
      if (value.statusCode == 200) {
        String jsonBody = value.body;
        for (Map<String, dynamic> msg in jsonDecode(jsonBody)) {
          listCities.add(City.fromJson(msg));
        }
        controller.sink.add(listCities);
      }
    }, onError: (_, err) => log("Erreur lors du download des msgs:" + err.toString()));
  }
}
