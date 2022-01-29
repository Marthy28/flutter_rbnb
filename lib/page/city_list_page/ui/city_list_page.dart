import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rbnbcpyflutter/bo/city.dart';
import 'package:rbnbcpyflutter/extension/extension.dart';
import 'package:rbnbcpyflutter/page/city_list_page/model/city_list_model.dart';
import 'package:rbnbcpyflutter/routes.dart';

class CityListPage extends StatelessWidget {
  CityListPage({Key? key}) : super(key: key);

  CityListModel model = CityListModel();
  final controller = StreamController<List<City>>();

  @override
  Widget build(BuildContext context) {
    model.fetchMessages(controller);
    return Scaffold(
      body: StreamBuilder<List<City>>(
          stream: controller.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async =>
                        await Navigator.of(context).pushNamed(ROUTE_LODGING_LIST, arguments: snapshot.data![index].id),
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                snapshot.data![index].url.getPictureUrl(),
                                fit: BoxFit.fill,
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(snapshot.data![index].name),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
