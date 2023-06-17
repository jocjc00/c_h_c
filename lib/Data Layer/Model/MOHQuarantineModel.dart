class MOHQuarantineModel {
  final int? id;
  final String name;
  final String result;
  final String quarantineType;

  MOHQuarantineModel({
    this.id,
    required this.name,
    required this.result,
    required this.quarantineType,
  });

  factory MOHQuarantineModel.fromJson(Map<String, dynamic> json) {
    return MOHQuarantineModel(
      id: json["id"],
      name: json["name"],
      result: json["result"],
      quarantineType: json["quarantineType"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "result": result,
        "quarantineType": quarantineType
      };

  static map(MOHQuarantineModel Function(dynamic json) param0) {}
}
