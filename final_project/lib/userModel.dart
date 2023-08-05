class userModel {
  List? proList;

  userModel({this.proList});

  Map<String, dynamic> toJson() => {"proList": proList};
  factory userModel.fromJson(Map<String, dynamic> json) =>
      userModel(proList: json["proList"]);
}
