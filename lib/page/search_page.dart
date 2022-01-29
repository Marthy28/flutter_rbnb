import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchInputTextController = TextEditingController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    searchInputTextController.text = "Où voulez-vous aller ? ";
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Account"),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              onTap: () async {
                await Navigator.of(context).pushNamed(ROUTE_CITY_LIST);
              },
              controller: searchInputTextController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
