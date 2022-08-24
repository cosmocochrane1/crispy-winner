import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SongItem extends StatelessWidget {
  final String title;
  final String mp3;
  final String artist;

  SongItem(this.title, this.mp3, this.artist);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
          },
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
