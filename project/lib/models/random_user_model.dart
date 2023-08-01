import 'package:equatable/equatable.dart';

class RandomInfoModel {
  RandomInfoModel({
    this.results = const [],
    required this.info,
  });

  List<Result> results;
  Info info;

  factory RandomInfoModel.fromJson(Map<String, dynamic> json) =>
      RandomInfoModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "info": info.toJson(),
      };
}

class Info {
  Info({
    this.seed = "no-seed",
    this.results = 0,
    this.page = 0,
    this.version = "no-version",
  });

  String seed;
  int results;
  int page;
  String version;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}

class Result extends Equatable {
  Result({
    this.gender = "no-gender",
    required this.name,
    required this.location,
    this.email = "no-email",
    required this.login,
    required this.dob,
    required this.registered,
    this.phone = "no-phone",
    this.cell = "no-cell",
    required this.id,
    required this.picture,
    this.nat = "no-nat",
  });

  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Dob registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"],
        login: Login.fromJson(json["login"]),
        dob: Dob.fromJson(json["dob"]),
        registered: Dob.fromJson(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        id: Id.fromJson(json["id"]),
        picture: Picture.fromJson(json["picture"]),
        nat: json["nat"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name.toJson(),
        "location": location.toJson(),
        "email": email,
        "login": login.toJson(),
        "dob": dob.toJson(),
        "registered": registered.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id.toJson(),
        "picture": picture.toJson(),
        "nat": nat,
      };

  @override
  List<Object?> get props => [email, name, phone];
}

class Dob {
  Dob({
    required this.date,
    this.age = 0,
  });

  DateTime date;
  int age;

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "age": age,
      };
}

class Id {
  Id({
    this.name = "no-name",
    this.value = "no-value",
  });

  String name;
  String? value;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Location {
  Location({
    required this.street,
    this.city = "no-city",
    this.state = "no-state",
    this.country = "no-country",
    this.postcode = 0,
    required this.coordinates,
    required this.timezone,
  });

  Street street;
  String city;
  String state;
  String country;
  dynamic postcode;
  Coordinates coordinates;
  Timezone timezone;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates.toJson(),
        "timezone": timezone.toJson(),
      };
}

class Coordinates {
  Coordinates({
    this.latitude = "no-latitude",
    this.longitude = "no-longitude",
  });

  String latitude;
  String longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Street {
  Street({
    this.number = 0,
    this.name = "no-name",
  });

  int number;
  String name;

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
      };
}

class Timezone {
  Timezone({
    this.offset = "no-offset",
    this.description = "nodescription",
  });

  String offset;
  String description;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
      };
}

class Login {
  Login({
    this.uuid = "no-uuid",
    this.username = "no-username",
    this.password = "no-password",
    this.salt = "no-salt",
    this.md5 = "no-md5",
    this.sha1 = "no-sha1",
    this.sha256 = "no-sha256",
  });

  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
      };
}

class Name {
  Name({
    this.title = "no-title",
    this.first = "no-first",
    this.last = "no-last",
  });

  String title;
  String first;
  String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  Picture({
    this.large = "no-large",
    this.medium = "no-medium",
    this.thumbnail = "no-thumbnail",
  });

  String large;
  String medium;
  String thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
