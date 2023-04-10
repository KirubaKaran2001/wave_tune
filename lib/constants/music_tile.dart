import 'package:flutter/material.dart';
import 'package:wave_tune/constants/text_style_constants.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54.withOpacity(0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1680695919965-06633e4c2e14?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
            height: 60,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'song title',
                style: primaryTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'song artist',
                style: primaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
