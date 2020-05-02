import 'package:http/http.dart';
import 'package:corona_south_africa_v1/services/network_call.dart';

final client = Client();

final netWorkCalls = NetworkCall();

final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
final Function mathFunc = (Match match) => '${match[1]},';

abstract class UrlConstants {
  static const String southAfrica =
      'https://coronavirus-19-api.herokuapp.com/countries/South%20Africa';
}
