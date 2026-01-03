class User{
  final String id;
  final String email;
  final String name;
  final String password;
  final String phoneno;
  final String type;
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.phoneno,
    required this.type
});

  Map<String,dynamic> fromApptoDB(){
    return{
      'id':id,
      'email':email,
      'name':name,
      'password':password,
      'phoneno':phoneno,
      'type':type,

    };
  }

  factory User.fromDBtoApp(Map<String,dynamic>map){
    return User(
    id: map['id'] ?? '' ,
    email: map['email'] ?? '',
    name: map['name'] ?? '',
    password: map['password'] ?? '',
    phoneno: map['phoneno'] ?? '',
    type: map['type'] ?? '',
    );

  }

}

