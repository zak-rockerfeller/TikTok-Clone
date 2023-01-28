import 'package:nest_reels/models/models.dart';

class Images{
  int id;
  String title;
  String path;

  Images({
    required this.id,
    required this.title,
    required this.path,

  });

  //map json to comment model
  factory Images.fromJson(Map<String, dynamic> json){
    return Images(
      id: json['id'],
      title: json['title'],
      path: json['path'],
    );
  }
}