import 'package:flutter/material.dart';
import 'package:rbnbcpyflutter/bo/lodging.dart';

class DetailLodgingPage extends StatelessWidget {
  const DetailLodgingPage({Key? key, required this.lodging}) : super(key: key);

  final Lodging lodging;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${lodging.price}€/nuit"),
                ElevatedButton(onPressed: () {}, child: const Text("réservez"))
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "image",
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  "https://flutter-learning.mooo.com" + lodging.url,
                  fit: BoxFit.fill,
                ),
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
            Text("${lodging.lat}, ${lodging.lng}"),
          ],
        ));
  }
}
