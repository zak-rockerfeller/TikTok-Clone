import 'package:nest_reels/models/models.dart';


class Nest{
  int? id;
  String? nest;
  String? name;
  String? type;
  String? category;
  String? condition;
  int? price;
  String? description;
  String? location;
  String? tag;
  double? latitude;
  double? longitude;
  String? image;
  String? updatedAt;
  String? createdAt;
  String? bio;
  String? unique;
  int? likesCount;
  int? commentsCount;
  Userz? user;
  int? rating;
  bool? selfLiked;
  bool? selfLoved;


  Nest({
    this.id,
    this.nest,
    this.name,
    this.type,
    this.category,
    this.condition,
    this.bio,
    this.unique,
    this.price,
    this.description,
    this.location,
    this.tag,
    this.latitude,
    this.longitude,
    this.image,
    this.updatedAt,
    this.createdAt,
    this.likesCount,
    this.commentsCount,
    this.user,
    this.rating,
    this.selfLiked,
    this.selfLoved,

  });

  //map json to nest model
  factory Nest.fromJson(Map<String, dynamic> json){
    return Nest(
      id: json['id'],
      nest: json['nest'],
      name: json['name'],
      type: json['type'],
      category: json['category'],
      condition: json['condition'],
      price: json['price'],
      description: json['description'],
      location: json['location'],
      image: json['image'],
      tag: json['tag'],
      unique: json['unique'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      selfLiked: json['likes'].length > 0,
      selfLoved: json['favorites'].length > 0,
      user: Userz(
        id: json['user']['id'],
        name: json['user']['name'],
        image: json['user']['image'],
        email: json['user']['email'],
        bio: json['user']['bio'],
        tag: json['user']['tags'],
        rating: json['user']['rating'],
        verified: json['user']['verified'],
        phone: json['user']['phone'],

      ),
    );
  }


  factory Nest.fromSnapshot(Map<String, dynamic> json){
    return Nest(
      id: json['id'],
      nest: json['nest'],
      name: json['name'],
      type: json['type'],
      category: json['category'],
      condition: json['condition'],
      price: json['price'],
      description: json['description'],
      location: json['location'],
      image: json['image'],
      tag: json['tag'],
      unique: json['unique'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      selfLiked: json['likes'].length > 0,
      selfLoved: json['favorites'].length > 0,
      user: Userz(
        id: json['user']['id'],
        name: json['user']['name'],
        image: json['user']['image'],
        email: json['user']['email'],
        bio: json['user']['bio'],
        tag: json['user']['tags'],
        rating: json['user']['rating'],
        verified: json['user']['verified'],
        phone: json['user']['phone'],

      ),
    );
  }



}

