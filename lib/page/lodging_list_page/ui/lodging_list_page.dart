import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rbnbcpyflutter/bo/lodging.dart';
import 'package:rbnbcpyflutter/extension/extension.dart';
import 'package:rbnbcpyflutter/page/lodging_list_page/model/lodging_list_model.dart';
import 'package:rbnbcpyflutter/routes.dart';

class LodgingListPage extends StatefulWidget {
  LodgingListPage({Key? key, required this.cityId}) : super(key: key);

  final int cityId;

  @override
  State<LodgingListPage> createState() => _LodgingListPageState();
}

class _LodgingListPageState extends State<LodgingListPage> {
  LodgingListModel model = LodgingListModel();
  bool isFavourite = false;

  final controller = StreamController<List<Lodging>>();

  @override
  Widget build(BuildContext context) {
    model.fetchLodgings(controller, widget.cityId);
    return Scaffold(
      body: StreamBuilder<List<Lodging>>(
          stream: controller.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) => const Divider(/*thickness: 1.5,*/),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async =>
                        await Navigator.of(context).pushNamed(ROUTE_LODGING_DETAIL, arguments: snapshot.data![index]),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: showLodgingCard(snapshot.data![index], context),
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

  Widget showLodgingCard(Lodging lodging, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Hero(
                    tag: "image",
                    child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            lodging.url.getPictureUrl(),
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              isFavourite ? Icons.favorite : Icons.favorite_border,
                              size: 30,
                            ),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              setState(() {
                                isFavourite = !isFavourite;
                              });
                            },
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Text(
              lodging.title,
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: const [
              Icon(Icons.star),
              SizedBox(width: 10),
              Text("4,5"),
            ]),
            Text("${lodging.price}€/nuit")
          ],
        ),
      ),
    );
  }
}
