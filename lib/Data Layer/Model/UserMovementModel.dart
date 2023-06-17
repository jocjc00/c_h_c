class UserMovementModel {

  final int? id;
  final String name;
  final String dependent; 
  final String phoneNumber; 
  final String emailAddress;
  final String location;
  final String date;
  final String time;
  final String vaccStatus;
  final String riskStatus;

  UserMovementModel(
      { this.id,
        required this.name,
        required this.dependent,
        required this.phoneNumber,
        required this.emailAddress,
        required this.location,
        required this.date,
        required this.time,
        required this.vaccStatus,
        required this.riskStatus,
      });

  factory UserMovementModel.fromJson(Map<String, dynamic> json) {
    return UserMovementModel(
      id: json["id"],
      name: json["name"],
      dependent: json["dependent"],
      phoneNumber: json["phoneNumber"],
      emailAddress: json["emailAddress"],
      location: json["location"],
      date: json["date"],
      time: json["time"],
      vaccStatus: json["vaccStatus"],
      riskStatus: json["riskStatus"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "dependent": dependent, "phoneNumber": phoneNumber, "emailAddress": emailAddress, "location": location, "date": date, "time": time, "vaccStatus": vaccStatus, "riskStatus": riskStatus};
}
