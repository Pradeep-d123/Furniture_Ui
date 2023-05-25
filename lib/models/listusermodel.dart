class ListUsers {
  int? page;
  int? perpage;
  int? total;
  int? totalpages;
  List<User>? data;

  ListUsers({this.page, this.perpage, this.total, this.totalpages, this.data});
  static ListUsers fromJson(Map<String, dynamic> json) {
    return ListUsers(
        page: json["page"],
        perpage: json["per_page"],
        total: json["total"],
        totalpages: json["total_pages"],
        data: json["data"]?.map<User>((user) {
          print(user);
          return User.fromJson(user);
        }).toList());
  }
}

class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? image;

  User({this.id, this.lastName, this.email, this.firstName, this.image});

  static User fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["avatar"]);
  }
}
