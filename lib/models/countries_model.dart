class CountriesDataModel {
  List<CountriesModel>? countries;

  CountriesDataModel({required this.countries});

  factory CountriesDataModel.fromJson(Map<String, dynamic> json) {
    List<CountriesModel> allCountries = [];

    for (Map<String, dynamic> eachCountries in json["countries"]) {
      var findCountries = CountriesModel.fromJson(eachCountries);
      allCountries.add(findCountries);
    }

    return CountriesDataModel(countries: allCountries);
  }
}

class CountriesModel {
  String? country;
  String? createdAt;
  String? flag;
  String? id;

  CountriesModel(
      {required this.country,
      required this.createdAt,
      required this.flag,
      required this.id});

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
        country: json["country"],
        createdAt: json["createdAt"],
        flag: json["flag"],
        id: json["id"]);
  }
}
