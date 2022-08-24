import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/categories.dart';

import '../widgets/song_grid.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = '/category-detail';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(37, 30, 59, 1),
                Color.fromRGBO(56, 60, 161, 1),
              ],
            )),
            child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 8.0),
                    child: Container(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Active Category Title',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                                Text(
                                  'Sweet sounds of shit',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                  fontSize: 14, color: Color.fromRGBO(161,164,178,1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(child: SongGrid()),
                      ],
                    )),
                  )
                  )
                  );
  }
}

