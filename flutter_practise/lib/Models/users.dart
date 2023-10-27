class User {
  String? uid;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;

  User(
      {this.uid,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.address});

  factory User.fromMap(map) {
    return User(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        phone: map['phone'],
        address: map['address']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
    };
  }
}
