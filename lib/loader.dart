import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlowingProgressIndicator(
        child: SizedBox(
            height: 50.0,
            child: Image(
              image: AssetImage(
                'assets/loader.png',
              ),
            )),
      ),
    );
  }
}
