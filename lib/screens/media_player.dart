// import 'dart:io';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';



// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   final audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//   bool isSliderDragged = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;

//   @override
//   void initState() {
//     super.initState();

//     setAudio();

//     /// Listen to states: playing, paused, stopped
//     audioPlayer.onPlayerStateChanged.listen((state) {
//       setState(() {
//         isPlaying = state == PlayerState.PLAYING;
//       });
//     });

//     /// Listen to audio duration
//     audioPlayer.onDurationChanged.listen((newDuration) {
//       setState(() {
//         duration = newDuration;
//       });
//     });

//     /// Listen to audio position
//     audioPlayer.onAudioPositionChanged.listen((newPosition) {
//       if (isSliderDragged) return;

//       setState(() {
//         position = newPosition;
//       });
//     });
//   }

//   Future setAudio() async {
//     // Repeat song when completed
//     // audioPlayer.setReleaseMode(ReleaseMode.LOOP);

//     /// 1. Load audio from URL
//     String url =
//         'https://media.chosic.com/wp-content/uploads/2022/03/Luke-Bergs-Summertimemp3.mp3';
//     audioPlayer.setUrl(url);

//     /// 2. Load audio from File
//     /*
//     final result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       final file = File(result.files.single.path!);
//       audioPlayer.setUrl(file.path, isLocal: true);
//     }
//     */

//     /// 3. Load audio from Assets (assets/audio.mp3)
//     /// See docs: https://github.com/bluefireteam/audioplayers/blob/main/packages/audioplayers/doc/audio_cache.md
//     /*
//     final player = AudioCache(prefix: 'assets/');
//     final url = await player.load('audio.mp3');
//     audioPlayer.setUrl(url.path, isLocal: true);
//     */
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image.network(
//                   'https://images.unsplash.com/photo-1541182388496-ac92a3230e4c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8d29tYW58fHx8fHwxNjQ5NDkzNzMw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
//                   width: double.infinity,
//                   height: 350,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(height: 32),
//               const Text(
//                 '💙  The Flutter Song',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               const Text(
//                 'Sarah Abs',
//                 style: TextStyle(fontSize: 20),
//               ),
//               Slider(
//                 min: 0,
//                 max: duration.inSeconds.toDouble(),
//                 value: position.inSeconds.toDouble(),
//                 onChanged: (value) async {
//                   final position = Duration(seconds: value.toInt());

//                   setState(() {
//                     isSliderDragged = true;
//                     this.position = position;
//                   });
//                 },
//                 onChangeEnd: (value) async {
//                   final position = Duration(seconds: value.toInt());
//                   await audioPlayer.seek(position);

//                   /// Optional: Play audio if was paused
//                   await audioPlayer.resume();

//                   isSliderDragged = false;
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(formatTime(position)),
//                     Text(formatTime(duration - position)),
//                   ],
//                 ),
//               ),
//               CircleAvatar(
//                 radius: 35,
//                 child: IconButton(
//                   icon: Icon(
//                     isPlaying ? Icons.pause : Icons.play_arrow,
//                   ),
//                   iconSize: 50,
//                   onPressed: () async {
//                     if (isPlaying) {
//                       await audioPlayer.pause();
//                     } else {
//                       await audioPlayer.resume();
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );

//   String formatTime(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));

//     return [
//       if (duration.inHours > 0) hours,
//       minutes,
//       seconds,
//     ].join(':');
//   }
// }