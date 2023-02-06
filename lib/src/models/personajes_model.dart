import 'dart:convert';
import 'dart:ffi';

List<Personajes> personajesFromJson(String str) =>
    List<Personajes>.from(json.decode(str).map((x) => Personajes.fromJson(x)));

String personajesToJson(List<Personajes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Personajes {
  int? id;
  String? firstname;
  String? realname;
  String? image;

  Personajes({
    this.id,
    this.firstname,
    this.realname,
    this.image,
  });

  factory Personajes.fromJson(Map<String, dynamic> json) => Personajes(
        id: json["id"],
        firstname: json["first_name"],
        realname: json["real_name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstname,
        "real_name": realname,
        "image": image,
      };
}
