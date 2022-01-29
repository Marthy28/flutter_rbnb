class City {
  String name;
  String url;
int id;
  City(this.name, this.url, this.id);

  City.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        url = json["pic"]["url"],
  id = json["id"];
}
