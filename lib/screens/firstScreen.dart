import 'package:flutter/material.dart';

import 'package:musico/constants.dart';
import 'package:musico/screens/LoginPage.dart';

import '../widgets/mywidgets.dart';

class FirstScreenImageCard extends StatelessWidget {
  const FirstScreenImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ScreenCoverImage(),
        firstScreenBtn(),
      ],
    );
  }
}

class ScreenCoverImage extends StatelessWidget {
  const ScreenCoverImage({
    Key? key,
    this.bgImagePath = "assets/img/first_screen_img.png",
  }) : super(key: key);
  final String bgImagePath;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.8,
          fit: BoxFit.cover,
          image: AssetImage(bgImagePath),
        ),
      ),
    );
  }
}

class firstScreenBtn extends StatelessWidget {
  const firstScreenBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: myDarkColor.shade900,
        child: Column(
          children: [
            const Text(
              "MUSICO",
              style: TextStyle(
                fontSize: 40,
                color: txtColor,
                fontWeight: FontWeight.bold,
                fontFamily: "verdena",
              ),
            ),
            MyCustomText(
              mtext: "Listen to free music from your\n favorite artists",
            ),
            MyCustomBtn(
              btnName: "Get Started",
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ),
              },
            ),
            MyCustomText(
              mtext: "I already have an account",
              mfontsize: 16,
              isUnderline: true,
            )
          ],
        ),
      ),
    );
  }
}
