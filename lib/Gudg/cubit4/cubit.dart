
class Comp_rate_model {
  int? id;
  String? email;
  String? specialization;
  String? driveLink;

  Comp_rate_model({this.id, this.email, this.specialization, this.driveLink});

  Comp_rate_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    specialization = json['specialization'];
    driveLink = json['driveLink'];
  }
}
