// ignore_for_file: non_constant_identifier_names

class FreqDistData {
  String id, vehicle_type, count, freq_dist;

  FreqDistData({
    this.id = 'null_id',
    this.vehicle_type = 'null_vehicle_type',
    this.count = 'null_count',
    this.freq_dist = 'null_freq_dist',
  });
  //constructor

  factory FreqDistData.fromJSON(Map<String, dynamic> json) {
    return FreqDistData(
      id: json["id"],
      vehicle_type: json["vehicle_type"],
      count: json["count"],
      freq_dist: json["freq_dist"],
    );
  }

    Map<String, dynamic> toJson() => {
        'id': id,
        'vehicle_type': vehicle_type,
        'count': count,
        'freq_dist': freq_dist,
      };
}
