class UserModel2 {
  String? name;
  String? email;
  String? phone;
  int? age;
  UserModel2({
    this.name,
    this.email,
    this.age,
    this.phone,
  });

  static fromjson(Map<String, dynamic> json) {
    return UserModel2(
        name: json["name"],
        age: json["age"],
        email: json["gmail"],
        phone: json["phone"]);
  }
}
