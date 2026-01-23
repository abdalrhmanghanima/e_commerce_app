
import '../../../domain/model/auth_result.dart';
import '../../../domain/model/user_entity.dart';
import 'User_model.dart';

class SignupModel {
  SignupModel({
    this.message,
    this.user,
    this.token,
  });

  SignupModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserModel? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResult toEntity() {
    return AuthResult(
        message: message ?? "",
        token: token ?? "",
        user: user?.toEntity() ?? UserEntity(name: '', email: '', role: ''));
  }
}
