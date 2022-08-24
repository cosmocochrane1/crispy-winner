import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categories.dart';
import '../widgets/song_item.dart';

class SongGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var activeSongs = Provider.of<Categories>(context, listen: true).activeSongs;

    return GridView.builder(
        itemCount: activeSongs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
              value: activeSongs[i],
              child: SongItem(activeSongs[i].title, activeSongs[i].mp3,
                  activeSongs[i].artist),
            ));
  }
}
