class UserModel {
  final int? id;
  final String name;
  final String phonenum;
  final String address;
  final String dependentID;

  UserModel({
    this.id,
    required this.name,
    required this.phonenum,
    required this.address,
    required this.dependentID,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      phonenum: json["phonenum"],
      address: json["address"],
      dependentID: json["dependentID"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phonenum": phonenum,
        "address": address,
        "dependentID": dependentID
      };
}
