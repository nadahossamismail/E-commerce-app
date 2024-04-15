class UserModel {
  List? proList;

  UserModel({this.proList});

  Map<String, dynamic> toJson() => {"proList": proList};
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(proList: json["proList"]);
}
