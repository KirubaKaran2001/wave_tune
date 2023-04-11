// ignore_for_file: must_be_immutable
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:wave_tune/constants/text_style_constants.dart';

class MusicTile extends StatefulWidget {
  String? imageSrc;
  String? songTitle;
  String? songArtist;
  String? path;
  Widget? widget;
  MusicTile(
      {required this.path,
      required this.songArtist,
      required this.songTitle,
      required this.imageSrc,
      required this.widget,
      super.key});

  @override
  State<MusicTile> createState() => _MusicTileState();
}

class _MusicTileState extends State<MusicTile> {
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70.withOpacity(0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.imageSrc!,
            height: 60,
            width: 50,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.songTitle!,
                style: primaryTextStyle,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.songArtist!,
                style: primaryTextStyle,
              ),
            ],
          ),
          const Spacer(),
          Center(
            child: IconButton(
              onPressed: () {
                if (isPlaying == false) {
                  setState(() {
                    isPlaying = true;
                    audioPlayer.play(AssetSource(widget.path!));
                  });
                } else {
                  setState(() {
                    isPlaying = false;
                    audioPlayer.pause();
                  });
                }
              },
              icon: Icon(
                (isPlaying == true) ? Icons.pause : Icons.play_arrow_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
