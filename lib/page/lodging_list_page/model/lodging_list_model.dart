import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:rbnbcpyflutter/bo/lodging.dart';

class LodgingListModel {
  void fetchLodgings(StreamController<List<Lodging>> controller, int idCity) {
    List<Lodging> listLodgings = [];
    Future<Response> resLodging = get(Uri.parse("https://flutter-learning.mooo.com/logements?place.id=$idCity"));
    resLodging.then((value) {
      if (value.statusCode == 200) {
        String jsonBody = value.body;
        for (Map<String, dynamic> msg in jsonDecode(jsonBody)) {
          listLodgings.add(Lodging.fromJson(msg));
        }
        controller.sink.add(listLodgings);
      }
    }, onError: (_, err) => log("Erreur lors du download des msgs:" + err.toString()));
  }
}
