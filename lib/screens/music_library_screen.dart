import 'package:flutter/material.dart';
import 'package:musico/constants.dart';
import 'package:musico/screens/player_screen.dart';
import 'package:musico/widgets/mywidgets.dart';

class LibScreenContent extends StatelessWidget {
  const LibScreenContent({
    Key? key,
    required this.userImage,
  }) : super(key: key);

  final String userImage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Your Library",
                  style: TextStyle(
                    color: txtColor,
                    fontSize: 20,
                  ),
                ),
              ),
              const Spacer(),
              NotificationBtn(),
              UserDetailBtn(userImage: userImage),
            ],
          ),
        ),
        Stack(
          alignment: Alignment(0.8, 0.5),
          children: [
            FeatureBox3(
              title1: "Your Music",
              title2: "On Repeat",
              featureBoxImage: "assets/img/bg_image_1.png",
              press: () {},
            ),
            CustomPlayButton(
              press: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayerScreen(
                              userImage: userImage, song_Data: ,
                            )));*/
              },
            ),
          ],
        ),
        Row(
          children: [
            FeatureBox2(
              title1: "Your Top",
              title2: "Artists",
              featureBoxImage: "assets/img/bg_image_1.png",
              press: () {},
            ),
            FeatureBox2(
              title1: "Best of",
              title2: "Pop Music",
              featureBoxImage: "assets/img/bg_image_1.png",
              press: () {},
            ),
          ],
        ),
        Row(
          children: [
            FeatureBox2(
              title1: "Your Top",
              title2: "Artists",
              featureBoxImage: "assets/img/bg_image_1.png",
              press: () {},
            ),
            FeatureBox2(
              title1: "Best of",
              title2: "Pop Music",
              featureBoxImage: "assets/img/bg_image_1.png",
              press: () {},
            ),
          ],
        ),
        Row(
          children: [
            FeatureBox2(
              title1: "Your Top",
              title2: "Artists",
              featureBoxImage: "assets/img/bg_image_1.png",
              press: () {},
            ),
            FeatureBox2(
              title1: "Best of",
              title2: "Pop Music",
              featureBoxImage: "assets/img/bg_image_1.png",
              press: () {
                print("hello");
              },
            ),
          ],
        ),
        ListTile(),
      ],
    );
  }
}
