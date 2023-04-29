// To parse this JSON data, do
//
//     final authenticateUser = authenticateUserFromJson(jsonString);

import 'dart:convert';

AuthenticateUser authenticateUserFromJson(String str) => AuthenticateUser.fromJson(json.decode(str));

String authenticateUserToJson(AuthenticateUser data) => json.encode(data.toJson());

class AuthenticateUser {
    AuthenticateUser({
        required this.accessToken,
        required this.tokenType,
        required this.user,
    });

    String accessToken;
    String tokenType;
    User user;

    factory AuthenticateUser.fromJson(Map<String, dynamic> json) => AuthenticateUser(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user.toJson(),
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
    }); 

    int id;
    String name;
    String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
    };
}
