class UserModel {
  String? email;
  String? password;
  String? id;
  bool? hasActiveCart;


  
  UserModel({this.email, this.password, this.id, this.hasActiveCart});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'id': id,
      'hasActiveCart': false,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      email: json['email'],
      password: json['password'],
      id: json['id'],
      hasActiveCart: false,
      
    );
  }

}