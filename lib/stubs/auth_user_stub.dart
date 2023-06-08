String stubAuthUser() => '''
import 'package:nylo_framework/nylo_framework.dart';

class AuthUser extends Model {
  int? id;
  String? email;
  String? createdAt;
  String? updatedAt;

  AuthUser({this.id, this.email, this.createdAt, this.updatedAt});

  AuthUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
''';
