import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class Users {
  String? gender;
  Name name;
  Location? location;
  String? email;
  Login? login;
  Dob dob;
  Dob registered;
  String? phone;
  String? cell;
  Id id;
  Picture? picture;
  String? nat;
  Users(
      {this.gender,
        required this.name,
        this.location,
        this.email,
        this.login,
        required this.dob,
        required this.registered,
        this.phone,
        this.cell,
        required this.id,
        this.picture,
        this.nat});
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}

@JsonSerializable()
class Name {
  String title;
  String first;
  String last;

  Name({required this.title,required this.first,required this.last});
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class Location {
  Street? street;
  String? city;
  String? state;
  String? country;
  int? postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  Location({this.street, this.city, this.state, this.country, this.postcode, this.coordinates, this.timezone});
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Street {
  int? number;
  String? name;

  Street({this.number, this.name});
  factory Street.fromJson(Map<String, dynamic> json) => _$StreetFromJson(json);

  Map<String, dynamic> toJson() => _$StreetToJson(this);
}

@JsonSerializable()
class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});
  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class Timezone {
  String? offset;
  String? description;

  Timezone({this.offset, this.description});
  factory Timezone.fromJson(Map<String, dynamic> json) => _$TimezoneFromJson(json);

  Map<String, dynamic> toJson() => _$TimezoneToJson(this);
}

@JsonSerializable()
class Login {
  String uuid;
  String username;
  String password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  Login({required this.uuid,required this.username,required this.password, this.salt, this.md5, this.sha1, this.sha256});
  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable()
class Dob {
  String date;
  int age;

  Dob({required this.date,required this.age});
  factory Dob.fromJson(Map<String, dynamic> json) => _$DobFromJson(json);

  Map<String, dynamic> toJson() => _$DobToJson(this);
}

@JsonSerializable()
class Id {
  String name;
  String value;

  Id({required this.name,required this.value});
  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});
  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
