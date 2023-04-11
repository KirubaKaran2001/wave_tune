import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wave_tune/constants/music_constants.dart';
import 'package:wave_tune/constants/music_tile.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/bg.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            ListView.builder(
              itemCount: musicList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MusicTile(
                    imageSrc: musicList[index]['imgSource'],
                    songArtist: musicList[index]['artistName'],
                    songTitle: musicList[index]['songTitle'],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
