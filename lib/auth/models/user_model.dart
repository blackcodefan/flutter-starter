import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  String? avatar;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  bool anonymous;

  UserModel({
    required this.email,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.avatar,
    required this.anonymous
  });

  /// As its name is saying, it converts user model to json string.
  String toJson() {

    Map<String, dynamic> data = {
      "id": id,
      "avatar": avatar,
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "phone": phone
    };

    return jsonEncode(data);
  }

  /// Generates full name using firstname and lastname.
  String fullName() {
    return "$firstname $lastname";
  }

  /// As its name is saying, this constructor
  /// makes class object from json string.
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        email: user.email ?? '',
        id: user.uid,
        firstname: '',
        lastname: '',
        phone: user.phoneNumber ?? '',
        anonymous: user.isAnonymous,
        avatar: user.photoURL ?? ''
    );
  }
}