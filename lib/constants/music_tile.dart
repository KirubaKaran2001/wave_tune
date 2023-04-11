// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wave_tune/constants/text_style_constants.dart';

class MusicTile extends StatelessWidget {
  String? imageSrc;
  String? songTitle;
  String? songArtist;
  MusicTile(
      {required this.songArtist, this.songTitle, this.imageSrc, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54.withOpacity(0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageSrc!,
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
                songTitle!,
                style: primaryTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                songArtist!,
                style: primaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
