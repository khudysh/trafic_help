import 'dart:convert';
import 'package:help/rates_model.dart';
import 'package:http/http.dart';


class HttpService {
  final String ratesURL = "http://94.103.188.48/polet/rates.php";



  Future<List<RatesData>> getRates(String date) async {
    Response res = await post(Uri.parse(ratesURL), body: {'date': date});

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<RatesData> rates = body['data'].map<RatesData>(
        (dynamic item) {
          return RatesData.fromJSON(item);
        },
      ).toList();
      return rates;
    } else {
      throw "Unable to retrieve rates.";
    }
  }
}
