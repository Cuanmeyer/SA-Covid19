class SAModel {
  int cases;
  int deaths;
  int recovered;
  int todayDeaths;

  SAModel({this.cases, this.deaths, this.recovered, this.todayDeaths});

  SAModel.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    todayDeaths = json['todayDeaths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['todayDeaths'] = this.todayDeaths;
    return data;
  }
}