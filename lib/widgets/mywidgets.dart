import 'package:flutter/material.dart';
import 'package:musico/constants.dart';
import 'package:musico/helper/format.dart';
import 'package:musico/screens/Home.dart';
import 'package:musico/screens/extra/calculator.dart';
import 'package:musico/screens/player_screen.dart';

class NotificationBtn extends StatelessWidget {
  const NotificationBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {},
      icon: Icon(
        Icons.notifications,
        color: Colors.white,
      ),
    );
  }
}

class UserDetailBtn extends StatelessWidget {
  const UserDetailBtn({
    Key? key,
    required this.userImage,
  }) : super(key: key);

  final String userImage;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => MyApp2(),
            ));
      },
      icon: Image(
        image: AssetImage(userImage),
      ),
    );
  }
}

class CustomPlayButton extends StatefulWidget {
  CustomPlayButton({
    Key? key,
    this.icon = Icons.play_arrow_rounded,
    required this.press,
  }) : super(key: key);
  final VoidCallback press;
  IconData icon;

  @override
  State<CustomPlayButton> createState() => _CustomPlayButtonState();
}

class _CustomPlayButtonState extends State<CustomPlayButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: playBtnColor,
      onPressed: widget.press,
      child: Icon(
        widget.icon,
        color: txtColor,
        size: 48,
      ),
    );
  }
}

class MyCustomBtn extends StatelessWidget {
  MyCustomBtn({
    Key? key,
    this.btnColor = myBtnColor,
    required this.btnName,
    required this.press,
  }) : super(key: key);
  final String btnName;
  final Function press;
  Color btnColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              decoration: BoxDecoration(
                color: btnColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () => press(),
                child: Padding(
                  padding: EdgeInsets.all(myPaddingValue * 2),
                  child: Text(
                    "$btnName",
                    style: TextStyle(
                      fontSize: 20,
                      color: txtColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "verdena",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyCustomBtn2 extends StatelessWidget {
  MyCustomBtn2({
    Key? key,
    this.btnColor = myBtnColor,
    required this.btnName,
    required this.press,
  }) : super(key: key);
  final String btnName;
  final Function press;
  Color btnColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () => press(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                btnName,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "verdena",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomText extends StatelessWidget {
  final bool isUnderline;

  const MyCustomText({
    Key? key,
    required this.mtext,
    this.mfontsize = 20,
    this.isUnderline = false,
  }) : super(key: key);
  final String mtext;
  final double mfontsize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        mtext,
        style: TextStyle(
          fontSize: mfontsize,
          color: txtColor,
          decoration:
              isUnderline ? TextDecoration.underline : TextDecoration.none,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MyHeadingText extends StatelessWidget {
  final String headingName;

  const MyHeadingText({
    Key? key,
    required this.headingName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Text(
        "$headingName",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: txtColor,
        ),
      ),
    );
  }
}

class MyCustomTxtField extends StatelessWidget {
  const MyCustomTxtField({
    Key? key,
    this.inputType,
    required this.myOnChanged,
  }) : super(key: key);
  final inputType;
  final Function myOnChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Colors.white54,
        ),
      ),
      child: TextField(
        cursorColor: txtColor,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8.0),
          hintText: inputType,
          hintStyle: TextStyle(
            color: Colors.white54,
          ),
        ),
        style: TextStyle(color: txtColor),
      ),
    );
  }
}

class FeatureBox1 extends StatelessWidget {
  const FeatureBox1(
      {Key? key,
      this.title1 = "",
      this.title2 = "",
      required this.featureBoxImage,
      required this.press})
      : super(key: key);
  final String title1;
  final String title2;
  final String featureBoxImage;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () => press(),
      child: Container(
        width: size.width * 0.275,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            opacity: 0.8,
            fit: BoxFit.fill,
            image: AssetImage(featureBoxImage),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title1,
                style: TextStyle(color: myBtnColor),
              ),
              Text(
                title2,
                style: TextStyle(
                  color: txtColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureBox2 extends StatelessWidget {
  const FeatureBox2(
      {Key? key,
      this.title1 = "",
      this.title2 = "",
      required this.featureBoxImage,
      required this.press})
      : super(key: key);
  final String title1;
  final String title2;
  final String featureBoxImage;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () => press(),
      child: Container(
        width: size.width * 0.43,
        height: size.height * 0.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            opacity: 0.8,
            fit: BoxFit.cover,
            image: AssetImage(featureBoxImage),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title1,
                style: TextStyle(color: myBtnColor),
              ),
              Text(
                title2,
                style: TextStyle(
                  color: txtColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureBox3 extends StatelessWidget {
  const FeatureBox3(
      {Key? key,
      required this.title1,
      required this.title2,
      required this.featureBoxImage,
      required this.press})
      : super(key: key);
  final String title1;
  final String title2;
  final String featureBoxImage;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () => press(),
      child: Container(
        width: double.infinity,
        height: size.height * 0.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            opacity: 0.8,
            fit: BoxFit.fill,
            image: AssetImage(featureBoxImage),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title1,
                style: TextStyle(color: myBtnColor, fontSize: 20),
              ),
              Text(
                title2,
                style: const TextStyle(
                  color: txtColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  SongTile({
    Key? key,
    required this.artists,
    required this.name,
    required this.press,
    this.songImagePath = "assets/img/bg_image_1.png",
    this.songUrl =
        "ID2ieOjCrwfgWvL5sXl4B1ImC5QfbsDyX5I87IdrNwc28ODjLeKOMB68Ith0Jxos7n\/ZlbzChEbKs5SC0x1hSBw7tS9a8Gtq",
    required this.song_data,
  }) : super(key: key);
  final String songImagePath;
  final String name;
  final Function press;
  final String artists;
  final String songUrl;
  final SongData song_data;

  bool is_asset = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        press();
      },
      dense: true,
      leading: Image.network(
        songImagePath,
        fit: BoxFit.cover,
        opacity: const AlwaysStoppedAnimation<double>(0.8),
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(songImagePath);
        },
      ),
      title: Text(
        name,
        style: TextStyle(
          color: txtColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        artists,
        style: TextStyle(
          color: txtColor2,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => PlayerScreen(
                  song_Data: song_data,
                  userImage: userImage, /*songData: songUrl*/
                ),
              ));
        },
        icon: Icon(
          Icons.play_arrow,
          color: txtColor,
        ),
      ),
    );
  }
}
