// ignore_for_file: file_names

import 'dart:convert';

UserPhoto userPhotoFromJson(String str) => UserPhoto.fromJson(json.decode(str));

String userPhotoToJson(UserPhoto data) => json.encode(data.toJson());

class UserPhoto {
  String foto;

  UserPhoto({
    required this.foto,
  });

  factory UserPhoto.fromJson(Map<String, dynamic> json) => UserPhoto(
        foto: json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "foto": foto,
      };
}
