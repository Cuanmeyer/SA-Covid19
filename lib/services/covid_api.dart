import 'dart:convert';
import 'package:corona_south_africa_v1/models/south_africa_model.dart';
import 'package:corona_south_africa_v1/global.dart';


class CovidApi {
 
  Future<SAModel> getSouthAfrica() async {
     String response = await netWorkCalls.get(UrlConstants.southAfrica);
    return SAModel.fromJson(jsonDecode(response));
  }


  
}
