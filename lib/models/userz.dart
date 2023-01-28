class Userz{
  int? id;
  String? name;
  String? image;
  String? email;
  String? bio;
  String? tag;
  String? verified;
  String? phone;
  int? rating;
  String? token;
  int? followersCount;
  bool? selfLiked;

  Userz({
    this.id,
    this.name,
    this.image,
    this.email,
    this.bio,
    this.tag,
    this.verified,
    this.phone,
    this.followersCount,
    this.selfLiked,
    this.token,
    this.rating,});


  //function to convert json data to user model

  factory Userz.fromJson(Map<String, dynamic> json){
    return Userz(
      id: json['user']['id'],
      name: json['user']['name'],
      image: json['user']['image'],
      email: json['user']['email'],
      bio: json['user']['bio'],
      tag: json['user']['tags'],
      rating: json['user']['rating'],
      verified: json['user']['verified'],
      phone: json['user']['phone'],
      followersCount: json['followers_count'],
      token: json['token'],
    );
  }


}


