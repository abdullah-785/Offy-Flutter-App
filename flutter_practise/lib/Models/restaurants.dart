class Restaurants {
  String? uid;
  String? name;
  String? level;
  String? address;
  String? avgPrice;
  String? rating;
  String? image;
  String? restOrCoffee;
  String? openingTime;
  String? closingTime;
  String? noOfReviews;
  String? role;

  Restaurants(
      {this.uid,
      this.name,
      this.level,
      this.address,
      this.avgPrice,
      this.rating,
      this.image,
      this.restOrCoffee,
      this.closingTime,
      this.openingTime,
      this.noOfReviews,
      this.role});

  //Receiving data from server
  factory Restaurants.fromMap(map) {
    return Restaurants(
        uid: map['uid'],
        name: map['name'],
        level: map['level'],
        address: map['address'],
        avgPrice: map['avgPrice'],
        rating: map['rating'],
        image: map['image'],
        restOrCoffee: map['restOrCoffee'],
        closingTime: map['closingTime'],
        openingTime: map['openingTime'],
        noOfReviews: map['noOfReviews'],
        role: map['role']);
  }

  //send data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'level': level,
      'address': address,
      'avgPrice': avgPrice,
      'rating': rating,
      'image': image,
      'restOrCoffee': restOrCoffee,
      'closingTime': closingTime,
      'openingTime': openingTime,
      'noOfReviews': noOfReviews,
      'role': role
    };
  }
}
