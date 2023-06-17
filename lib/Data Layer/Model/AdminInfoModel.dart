class AdminInfoModel {
  final int? id;
  final String info;
  final String desc;
  final int cases;
  final int ttlCases;
  final int rec;
  final int fVac;
  final int doseAdm;

  AdminInfoModel({
    this.id,
    required this.info,
    required this.desc,
    required this.cases,
    required this.ttlCases,
    required this.rec,
    required this.fVac,
    required this.doseAdm,
  });

  factory AdminInfoModel.fromJson(Map<String, dynamic> json) {
    return AdminInfoModel(
      id: json["id"],
      info: json["info"],
      desc: json["desc"],
      cases: json["cases"],
      ttlCases: json["ttlCases"],
      rec: json["rec"],
      fVac: json["fVac"],
      doseAdm: json["doseAdm"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "info": info,
        "desc": desc,
        "cases": cases,
        "ttlCases": ttlCases,
        "rec": rec,
        "fVac": fVac,
        "doseAdm": doseAdm
      };
}
