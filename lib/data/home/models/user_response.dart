

class UserResponse {
  List<UserData>? data;
  int? total;
  int? page;
  int? limit;

  UserResponse.fromJsonMap(Map<String, dynamic> map) {
    data = map['data'] == null? []: List
        .from(map['data'].map((it) => UserData.fromJsonMap(it)));
    total = map['total'];
    page = map['page'];
    limit = map['limit'];
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'total': total,
    'page': page,
    'limit': limit,
  };
}

class UserData {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  UserData.fromJsonMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    picture = map['picture'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'firstName': firstName,
    'lastName': lastName,
    'picture': picture,
  };
}