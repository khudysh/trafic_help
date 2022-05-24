import 'package:flutter/material.dart';
import 'package:help/freqdist_model.dart';
import 'package:help/rates_model.dart';
import 'package:test/test.dart';
import 'package:help/rates_controller.dart' as rates;
import 'package:help/freqdist_controller.dart' as freqdist;

void main() {
  test('Data rates from DB should be valid', () async {
    final controller = rates.HttpService();

    List<RatesData> tableunits = await controller.getRates("2022-05-19 00:00:00Z");
    List<Map> testlist = [];
    for (var item in tableunits) {
      testlist.add(item.toJson());
    }

    expect(testlist, [{'date':'2022-05-19', 'id':'1', 'rate':'5', 'time_interval':'09:00-12:00'},
                        {'date':'2022-05-19', 'id':'2', 'rate':'4', 'time_interval':'12:00-15:00'},
                        {'date':'2022-05-19', 'id':'3', 'rate':'6', 'time_interval':'15:00-18:00'},
                        {'date':'2022-05-19', 'id':'4', 'rate':'8', 'time_interval':'18:00-21:00'}]);

  });


   test('Data freq_dist from DB should be valid', () async {
    final controller = freqdist.HttpService();

    List<FreqDistData> tableunits = await controller.getFreqDist("2022-05-19 00:00:00Z");
    List<Map> testlist = [];
    for (var item in tableunits) {
      testlist.add(item.toJson());
    }

    expect(testlist, [{'count':'30', 'freq_dist':'46', 'id':'1', 'vehicle_type':'car'},
                        {'count':'14', 'freq_dist':'22', 'id':'2', 'vehicle_type':'truck'},
                        {'count':'16', 'freq_dist':'16', 'id':'3', 'vehicle_type':'bus'},
                        {'count':'5', 'freq_dist':'8', 'id':'4', 'vehicle_type':'bike'}]);

});
}