import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:wave_tune/components/profile_tile.dart';
import 'package:wave_tune/constants/text_style_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: subheaderTextStyle,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white70.withOpacity(0.2),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Image.asset(
              'assets/bg.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: CircleAvatar(
                        maxRadius: 50,
                        backgroundColor: Colors.white70.withOpacity(0.5),
                        child: const Icon(
                          Icons.person,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hello Kirubakaran',
                      style: primaryTextStyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...List.generate(
                      profileTitle.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ProfileTile(
                            title: profileTitle[index],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: NeoPopButton(
                        color: const Color(0xff2b65f3),
                        onTapUp: () {
                          HapticFeedback.vibrate();
                          Navigator.pop(context);
                        },
                        onTapDown: () {
                          HapticFeedback.vibrate();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, right: 20, left: 20),
                          child: Text(
                            "Logout",
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
