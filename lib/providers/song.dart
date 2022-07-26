import 'package:flutter/foundation.dart';

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
