import 'package:convertidor_divisas/src/model/api_model.dart';
import 'package:http/http.dart' as http;

Future<double> coinConvert(coinPrimary, coinSecond, quantity) async {
  String host = 'https://api.cambio.today/v1/quotes';
  String key = '6246|^0KRiQGR2RH4O*~CRzDc7B*Y_Y8PKCs6';
  String url =
      '$host/$coinPrimary/$coinSecond/json?quantity=$quantity&key=$key';

  final resp = await http.get(url);
  final convertResponse = convertResponseFromJson(resp.body);
  final amount = convertResponse.result.amount;

  return amount;
}