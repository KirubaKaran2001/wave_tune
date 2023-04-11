import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:wave_tune/constants/music_constants.dart';
import 'package:wave_tune/constants/music_tile.dart';
import '../constants/text_style_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  String url = "https://cdn.pixabay.com/audio/2023/04/03/audio_047543feac.mp3";
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            Image.asset(
              'assets/bg.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xff2c2443).withOpacity(0.4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white70.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  style: textFormTextStyle,
                                  decoration: InputDecoration(
                                    hintText: 'search by album ,artist',
                                    hintStyle: textFormTextStyle,
                                    fillColor: Colors.white.withOpacity(0.2),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.white70.withOpacity(0.4),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.white70.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'New Albums',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/1.jpg',
                                      height: 150,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset(
                                          'assets/2.jpeg',
                                          height: 70,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset(
                                          'assets/3.jpg',
                                          height: 70,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Popular Music',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      if (isPlaying == false) {
                                        setState(() {
                                          isPlaying = true;
                                          audioPlayer.play(UrlSource(url));
                                        });
                                      } else {
                                        setState(() {
                                          isPlaying = false;
                                          audioPlayer.pause();
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount: musicList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: MusicTile(
                                    imageSrc: musicList[index]['imgSource'],
                                    songArtist: musicList[index]['artistName'],
                                    songTitle: musicList[index]['songTitle'],
                                    widget: IconButton(
                                      icon: Icon(
                                        (isPlaying == true)
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white70,
                                      ),
                                      onPressed: () {
                                        if (isPlaying == false) {
                                          setState(() {
                                            isPlaying = true;
                                            audioPlayer.play(AssetSource(
                                                musicList[index]['asset']));
                                          });
                                        } else {
                                          setState(() {
                                            isPlaying = false;
                                            audioPlayer.pause();
                                          });
                                        }
                                      },
                                    ),
                                    ontap: () {},
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
