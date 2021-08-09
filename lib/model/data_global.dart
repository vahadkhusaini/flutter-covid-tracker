class DataGlobal {
  final int? confirmed;
  final int? recovered;
  final int? deaths;
  final String? lastUpdate;
  final int? activeCase;

  DataGlobal({
    required this.confirmed, 
    required this.recovered, 
    required this.deaths, 
    required this.lastUpdate,
    required this.activeCase
  });

  factory DataGlobal.fromJson(Map<String, dynamic> json) {
    return DataGlobal(
        confirmed: json['confirmed']['value'],
        recovered: json['recovered']['value'],
        deaths: json['deaths']['value'],
        activeCase: json['confirmed']['value'] - json['recovered']['value'] - json['deaths']['value'],
        lastUpdate: json['lastUpdate'].toString()
    );
  }
}