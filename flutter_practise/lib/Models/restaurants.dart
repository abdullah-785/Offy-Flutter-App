class Restaurants {
  String? uid;
  String? name;
  String? level;
  String? address;
  String? avgPrice;
  String? rating;
  String? image;
  String? restOrCoffee;
  DateTime? openingTime;
  DateTime? closingTime;

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
      this.openingTime});

  //Receiving data from server
  factory Restaurants.fromMap(map) {
    return Restaurants(
        uid: map['uid'],
        name: map['name'],
        level: map['level'],
        address: map['address'],
        avgPrice: map['avgPrice'],
        rating: map['rating'],
        image: map['images'],
        restOrCoffee: map['restOrCoffee'],
        closingTime: map['closingTime'],
        openingTime: map['openingTime']);
  }

  //send data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'restaurantLevel': level,
      'address': address,
      'avgPrice': avgPrice,
      'rating': rating,
      'images': image,
      'restOrCoffee': restOrCoffee,
      'closingTime': closingTime,
      'openingTime': openingTime,
    };
  }
}
