import 'package:flutter/foundation.dart';

class Category with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String backgroundImage;


  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.backgroundImage,

  });

  static Category fromJson(Map<String, dynamic> json){
    print("*************************************************");
    print(json);
    return Category(
        id: json['title'],
        title: json['title'],
        description: json['description'],
        backgroundImage: json['backgroundImage'],
        // songs: json['songs'].forEach((singleSong) => {
        //   Song(id: singleSong['title'], title: singleSong['title'], mp3: singleSong['mp3'], artist: singleSong['artist'])
        // })
      );
  }
}

class Song with ChangeNotifier {
  final String id;
  final String mp3;
  final String title;
  final String artist;

  Song({
    required this.id,
    required this.mp3,
    required this.title,
    required this.artist,
  });
}
