import 'dart:convert';
import 'package:help/freqdist_model.dart';
import 'package:http/http.dart';


class HttpService {
  final String freqDistURL = "http://94.103.188.48/polet/freqdist.php";



  Future<List<FreqDistData>> getFreqDist(String date) async {
    Response res = await post(Uri.parse(freqDistURL), body: {'date': date});

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<FreqDistData> freqDist = body['data'].map<FreqDistData>(
        (dynamic item) {
          return FreqDistData.fromJSON(item);
        },
      ).toList();
      return freqDist;
    } else {
      throw "Unable to retrieve freqDist.";
    }
  }
}
