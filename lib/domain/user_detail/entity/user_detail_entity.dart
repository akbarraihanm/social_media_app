class UserDetailEntity {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;
  final String gender;
  final String email;
  final String dateOfBirth;
  final String phone;
  final UserLocationEntity location;
  final String registerDate;
  final String updatedDate;

  UserDetailEntity({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    required this.location,
    required this.registerDate,
    required this.updatedDate,
  });
}

class UserLocationEntity {
  final String street;
  final String city;
  final String state;
  final String country;
  final String timezone;

  UserLocationEntity({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.timezone,
  });
}
