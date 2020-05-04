import 'package:corona_south_africa_v1/services/covid_api.dart';
import 'package:flutter/material.dart';
import 'package:corona_south_africa_v1/models/south_africa_model.dart';
import 'package:corona_south_africa_v1/loader.dart';
import 'package:corona_south_africa_v1/stats_card.dart';

class SouthAfricaInfoPage extends StatefulWidget {
  @override
  _SouthAfricaInfoPage createState() => _SouthAfricaInfoPage();
}

class _SouthAfricaInfoPage extends State<SouthAfricaInfoPage> {
  SAModel _stats;
  double deathPercentage;
  double activePercentage;
  bool _isLoading = false;
  CovidApi api = CovidApi();
  double recoveryPercentage;

  @override
  void initState() {
    super.initState();
    _fetchSouthAfricaStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'South Africa COVID-19',
        ),
        leading: Icon(
          Icons.album,
          color: Theme.of(context).accentColor,
        ),
      ),
      body: SafeArea(
        child: _isLoading
            ? Loader()
            : _stats == null
                ? buildErrorMessage()
                : ListView(
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.album),
                        title: Text('Lockdown Level 4'),
                        subtitle: Text('As of 01 May 2020'),
                      ),
                      StatisticCard(
                        color: Colors.yellowAccent,
                        text: 'Total Cases',
                        icon: Icons.track_changes,
                        stats: _stats.cases,
                      ),
                      StatisticCard(
                        color: Colors.green,
                        text: 'Total Recovered',
                        icon: Icons.thumb_up,
                        stats: _stats.recovered,
                      ),
                      StatisticCard(
                        color: Colors.black,
                        text: 'Total Deaths',
                        icon: Icons.airline_seat_flat,
                        stats: _stats.deaths,
                      ),
                      StatisticCard(
                        color: Colors.red,
                        text: 'Deaths Today',
                        icon: Icons.security,
                        stats: _stats.todayDeaths,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[],
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  Center buildErrorMessage() {
    return Center(
      child: Text(
        'Unable to fetch data',
        style: Theme.of(context).textTheme.title.copyWith(color: Colors.grey),
      ),
    );
  }

  void _fetchSouthAfricaStats() async {
    setState(() => _isLoading = true);
    try {
      var stats = await api.getSouthAfrica();
      deathPercentage = (stats.deaths / stats.cases) * 100;
      recoveryPercentage = (stats.recovered / stats.cases) * 100;
      activePercentage = 100 - (deathPercentage + recoveryPercentage);

      print(deathPercentage);
      print(recoveryPercentage);
      print(activePercentage);
      setState(() => _stats = stats);
    } catch (ex) {
      setState(() => _stats = null);
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
