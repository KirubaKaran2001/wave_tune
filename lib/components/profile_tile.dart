// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:wave_tune/constants/text_style_constants.dart';

class ProfileTile extends StatefulWidget {
  String? title;
  ProfileTile({super.key, required this.title});

  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white70.withOpacity(0.2),
      child: Row(
        children: [
          Text(
            widget.title!,
          style: primaryTextStyle.copyWith(
            color: Colors.black
          ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_outlined)
        ],
      ),
    );
  }
}

List<String> profileTitle = [
  'Account',
  'Data Saver',
  'Languages',
  'Playback',
  'Explict Content',
  'Devices',
  'Car',
  'Privacy & Social',
  'Notification',
  'About',
];
