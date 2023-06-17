class AdminVacModel {
  final int? id;
  final int dosenum;
  final String date;
  final String time;
  final String venue;

  AdminVacModel({
    this.id,
    required this.dosenum,
    required this.date,
    required this.time,
    required this.venue,
  });

  factory AdminVacModel.fromJson(Map<String, dynamic> json) {
    return AdminVacModel(
      id: json["id"],
      dosenum: json["dosenum"],
      date: json["date"],
      time: json["time"],
      venue: json["venue"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "dosenum": dosenum,
        "date": date,
        "time": time,
        "venue": venue
      };
}
