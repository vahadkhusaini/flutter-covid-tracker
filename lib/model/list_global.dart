class ListGlobal {
  late final String? country;
  late final int cases;
  late final int todayCases;
  late final int deaths;
  late final int todayDeaths;
  late final int recovered;
  late final int active;

  ListGlobal(
      {
        required this.country,
        required this.cases,
        required this.todayCases,
        required this.deaths,
        required this.todayDeaths,
        required this.recovered,
        required this.active,
        }
      );

  ListGlobal.fromJson(Map<String, dynamic> json) {
    country = json['country'] ?? "";
    cases = json['cases'] ?? 0;
    todayCases = json['todayCases'] ?? 0;
    deaths = json['deaths'] ?? 0;
    todayDeaths = json['todayDeaths'] ?? 0;
    recovered = json['recovered'] ?? 0;
    active = json['active'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    return data;
  }
}