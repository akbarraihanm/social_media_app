import 'package:social_media_app/core/extensions/string_extension.dart';

class UserDetailData {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;
  String? gender;
  String? email;
  String? dateOfBirth;
  String? phone;
  UserLocation? location;
  String? registerDate;
  String? updatedDate;

  UserDetailData.fromJsonMap(Map<String, dynamic> map) {
    /// Date Convert
    String dob = map['dateOfBirth'] ?? "";
    dob = dob.toDayMonthYear();
    String regDate = map['registerDate'] ?? "";
    regDate = regDate.toDayMonthYear();
    String updateDate = map['updatedDate'] ?? "";
    updateDate = updateDate.toDayMonthYear();

    id = map['id'];
    title = map['title'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    picture = map['picture'];
    gender = map['gender'];
    email = map['email'];
    dateOfBirth = dob;
    phone = map['phone'];
    location = map['location'] == null? null: UserLocation.fromJsonMap(map['location']);
    registerDate = regDate;
    updatedDate = updateDate;
  }

  Map<String, dynamic> toJson() {
   return {
     'id': id,
     'title': title,
     'firstName': firstName,
     'lastName': lastName,
     'picture': picture,
     'gender': gender,
     'email': email,
     'dateOfBirth': dateOfBirth,
     'phone': phone,
     'location': location?.toJson(),
     'registerDate': registerDate,
     'updatedDate': updatedDate,
   };
  }
}

class UserLocation {
  String? street;
  String? city;
  String? state;
  String? country;
  String? timezone;

  UserLocation.fromJsonMap(Map<String, dynamic> map) {
    street = map['street'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
    timezone = map['timezone'];
  }

  Map<String, dynamic> toJson() => {
    'street': street,
    'city': city,
    'state': state,
    'country': country,
    'timezone': timezone,
  };
}