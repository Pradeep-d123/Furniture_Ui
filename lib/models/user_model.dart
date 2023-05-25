class UserModel {
  String? name;
  String? email;
  int? age;
  String? phone;
  UserModel({this.age, this.email, this.name, this.phone});


   static UserModel fromJson(Map<String, dynamic> json) {
   
    return UserModel(
        age: json['age'],
        email: json['email'],
        name: json['name'],
        phone: json['phone']);
  }
  
}
