import 'package:flutter/material.dart';
import 'package:rbnbcpyflutter/bo/lodging.dart';
import 'package:rbnbcpyflutter/page/city_list_page/ui/city_list_page.dart';
import 'package:rbnbcpyflutter/page/detail_lodging_page.dart';
import 'package:rbnbcpyflutter/page/list_available_date_page.dart';
import 'package:rbnbcpyflutter/page/lodging_list_page/ui/lodging_list_page.dart';
import 'package:rbnbcpyflutter/page/search_page.dart';
import 'package:rbnbcpyflutter/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xffFF5A5F),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == ROUTE_LODGING_LIST) {
          return MaterialPageRoute(builder: (context) => LodgingListPage(cityId: settings.arguments as int));
        }
        if (settings.name == ROUTE_LODGING_DETAIL) {
          return MaterialPageRoute(builder: (context) => DetailLodgingPage(lodging: settings.arguments as Lodging));
        }
      },
      initialRoute: ROUTE_SEARCH,
      routes: <String, WidgetBuilder>{
        ROUTE_SEARCH: (context) => SearchPage(),
        ROUTE_CITY_LIST: (context) => CityListPage(),
        ROUTE_DATE_LIST: (context) => const ListAvailableDatePage(),
      },
    );
  }
}
