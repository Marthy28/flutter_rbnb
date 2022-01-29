class Lodging {
  String title;
  String url;
  int price;
  double lat;
  double lng;

  Lodging(this.title, this.url, this.price, this.lat, this.lng);

  Lodging.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        price = json["price"],
  lat = json["lat"],
  lng = json["lng"],
        url = json["illustrations"]["url"];
}
