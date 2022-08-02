class GudgModel {
  GudgModel({
    required this.message,
    required this.check,
  });
  late final String message;
  late final bool check;

  GudgModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['check'] = check;
    return _data;
  }
}
class LinkModel {
  LinkModel({
    required this.id,
    required this.email,
    required this.specialization,
    required this.driveLink,
  });
  late final int id;
  late final String email;
  late final String specialization;
  late final String driveLink;

  LinkModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    specialization = json['specialization'];
    driveLink = json['driveLink'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['specialization'] = specialization;
    _data['driveLink'] = driveLink;
    return _data;
  }
}