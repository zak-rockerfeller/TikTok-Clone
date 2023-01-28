import 'package:cloud_firestore/cloud_firestore.dart';

class Video{
  String uid;
  String id;
  String username;
  List likes;
  int commentCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePhoto;

  Video({
    required this.uid,
    required this.id,
    required this.username,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePhoto,
  });


  Map<String, dynamic> toJson() => {
    "uid": uid,
    "id": id,
    "username": username,
    "likes": likes,
    "commentCount": commentCount,
    "shareCount": shareCount,
    "songName": songName,
    "caption": caption,
    "videoUrl": videoUrl,
    "thumbnail": thumbnail,
    "profilePhoto": profilePhoto,
  };


  static Video fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return Video(
        uid: snapshot['uid'],
        id: snapshot['id'],
        username: snapshot['username'],
        likes: snapshot['likes'],
        commentCount: snapshot['commentCount'],
        shareCount: snapshot['shareCount'],
        songName: snapshot['songName'],
        caption: snapshot['caption'],
        videoUrl: snapshot['videoUrl'],
        thumbnail: snapshot['thumbnail'],
        profilePhoto: snapshot['profilePhoto'],
    );

  }
}


