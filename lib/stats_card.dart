import 'package:flutter/material.dart';

import 'package:corona_south_africa_v1/global.dart';

class StatisticCard extends StatelessWidget {
  final String text;
  final int stats;
  final Color color;
  final IconData icon;

  StatisticCard({
    @required this.color,
    @required this.icon,
    @required this.text,
    @required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Card(
        elevation: 10.0,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
               Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    icon,
                    size: 100.0,
                    color: color,
                  )),  
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      stats.toString().replaceAllMapped(reg, mathFunc),
                      style: Theme.of(context).textTheme.display2,
                    ),
                    Text(
                      text,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ],
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
