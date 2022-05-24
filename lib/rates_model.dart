// ignore_for_file: non_constant_identifier_names

class RatesData {
  String id, time_interval, rate, date;

  RatesData({
    this.id = 'null_id',
    this.time_interval = 'null_time_interval',
    this.rate = 'null_rate',
    this.date = 'null_date',
  });
  //constructor

  factory RatesData.fromJSON(Map<String, dynamic> json) {
    return RatesData(
      id: json["id"],
      time_interval: json["time_interval"],
      rate: json["rate"],
      date: json["date"],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'time_interval': time_interval,
        'rate': rate,
        'date': date,
      };
}
