class UserModel{
  String? uid;
  String? email;
  String? name;
  String? roll;
  String? add;
  String? gender;
  String? year;
  String? branch;

  UserModel({this.uid, this.email, this.name, this.roll, this.add, this.gender, this.year, this.branch});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      roll: map['roll'],
      add: map['add'],
      gender: map['gender'],
      year: map['year'],
      branch: map['branch'],
    );
  }
  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'roll': roll,
      'add': add,
      'gender': gender,
      'year': year,
      'branch': branch,
    };
  }

}