class UserQuarantineModel {
  final int? id;
  final String name;
  final int age;
  final String location;
  final String date;
  final String result;
  final String address;

  UserQuarantineModel({
    this.id,
    required this.name,
    required this.age,
    required this.location,
    required this.date,
    required this.result,
    required this.address,
  });

  factory UserQuarantineModel.fromJson(Map<String, dynamic> json) {
    return UserQuarantineModel(
      id: json["id"],
      name: json["name"],
      age: json["age"],
      location: json["location"],
      date: json["date"],
      result: json["result"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "address": location,
        "date": date,
        "result": result,
        "address": address,
      };
}
