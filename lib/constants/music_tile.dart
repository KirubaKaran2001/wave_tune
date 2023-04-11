// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wave_tune/constants/text_style_constants.dart';

class MusicTile extends StatelessWidget {
  String? imageSrc;
  String? songTitle;
  String? songArtist;
  Function()? ontap;
  Widget? widget;
  MusicTile(
      {required this.ontap,
      required this.songArtist,
      required this.songTitle,
      required this.imageSrc,
      required this.widget,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap!();
      },
      child: Container(
        color: Colors.white70.withOpacity(0.2),
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
                  height: 15,
                ),
                Text(
                  songArtist!,
                  style: primaryTextStyle,
                ),
              ],
            ),
            const Spacer(),
            Center(child: widget!),
          ],
        ),
      ),
    );
  }
}
