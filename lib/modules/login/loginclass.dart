class LoginModel {
  LoginModel({
    required this.token,
    required this.check,
  });
  late final String token;
  late final bool check;

  LoginModel.fromJson(Map<String, dynamic> json){
    token = json['token'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['check'] = check;
    return _data;
  }
}