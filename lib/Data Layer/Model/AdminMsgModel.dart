class AdminMsgModel {
  final int? id;
  final String msg;
  final String zone;
  final int cluster;

  AdminMsgModel({
    this.id,
    required this.msg,
    required this.zone,
    required this.cluster,
  });

  factory AdminMsgModel.fromJson(Map<String, dynamic> json) {
    return AdminMsgModel(
      id: json["id"],
      msg: json["msg"],
      zone: json["zone"],
      cluster: json["cluster"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "msg": msg, "zone": zone, "cluster": cluster};
}
