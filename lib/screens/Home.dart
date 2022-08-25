import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:musico/constants.dart';
import 'package:musico/screens/music_library_screen.dart';
import 'package:musico/screens/searchScreen.dart';
import 'package:musico/widgets/mywidgets.dart';

String userImage = "assets/img/user_img.png";

class Home extends StatefulWidget {
  Home({
    Key? key,
    this.userfirstname = "Julia",
    this.userImage = "assets/img/user_img.png",
  }) : super(key: key);
  final String userfirstname;
  final String userImage;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreenContent(
        userfirstname: widget.userfirstname,
        userImage: widget.userImage,
      ),
      SearchScreenWig(),
      LibScreenContent(userImage: "assets/img/user_img.png"),
    ];

    double height = MediaQuery.of(context).size.height;
    return Theme(
      data: ThemeData(
        accentColor: txtColor,
        primaryColor: myDarkColor,
        backgroundColor: myDarkColor,
        appBarTheme: AppBarTheme(backgroundColor: myDarkColor),
        bannerTheme: MaterialBannerThemeData(backgroundColor: myDarkColor),
      ),
      child: KeyboardDismisser(
        gestures: [
          GestureType.onTap,
          GestureType.onPanUpdateAnyDirection,
          GestureType.onVerticalDragDown,
          GestureType.onTapDown
        ],
        child: Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: height,
              color: myDarkColor,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    screens[index],
                    buildmyNavBar(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildmyNavBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: myDarkColor.shade900.withOpacity(0.5),
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
              icon: index == 0
                  ? Icon(
                      Icons.home,
                      color: playBtnColor,
                    )
                  : Icon(
                      Icons.home,
                      color: txtColor,
                    ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
              icon: index == 1
                  ? const Icon(
                      Icons.search,
                      color: playBtnColor,
                    )
                  : const Icon(
                      Icons.search,
                      color: txtColor,
                    ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
              icon: index == 2
                  ? const Icon(
                      Icons.library_music,
                      color: playBtnColor,
                    )
                  : const Icon(
                      Icons.library_music,
                      color: txtColor,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({
    Key? key,
    required this.userfirstname,
    required this.userImage,
  }) : super(key: key);

  final String userfirstname;
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Good afternoon, $userfirstname",
                  style: const TextStyle(
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
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            children: [
              MyHeadingText(
                headingName: "Pick up where you left off",
              ),
              Spacer(),
              ViewAllBtn(
                press: () {},
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FeatureBox1(
                featureBoxImage: "assets/img/album_img_chill_study_music.png",
                press: () {},
              ),
              FeatureBox1(
                featureBoxImage: "assets/img/album_img_upbeat_pop.png",
                press: () {},
              ),
              FeatureBox1(
                featureBoxImage: "assets/img/album_img_weeked_RnB.png",
                press: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            children: [
              const MyHeadingText(
                headingName: "For you",
              ),
              const Spacer(),
              ViewAllBtn(
                press: () {},
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FeatureBox2(
                featureBoxImage: "assets/img/album_img_best_of_pop_music.png",
                press: () {},
              ),
              FeatureBox2(
                featureBoxImage: "assets/img/album_img_techno_90s.png",
                press: () {},
              ),
              FeatureBox2(
                featureBoxImage: "assets/img/album_img_techno_90s.png",
                press: () {},
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: MyHeadingText(headingName: "Popular songs"),
        ),
        /* SongTile(
          name: "Cold Water",
          artists: "Justin Bieber, Major Laser",
          songImagePath: "assets/img/album_img2.png",
          press: () {},
        ),
        SongTile(
          name: "Cold Water",
          artists: "Justin Bieber, Major Laser",
          songImagePath: "assets/img/album_img2.png",
          press: () {},
        ),
        SongTile(
          name: "Cold Water",
          artists: "Justin Bieber, Major Laser",
          songImagePath: "assets/img/album_img2.png",
          press: () {},
        ),
        SongTile(
          name: "Cold Water",
          artists: "Justin Bieber, Major Laser",
          songImagePath: "assets/img/album_img2.png",
          press: () {},
        ),
        SongTile(
          name: "Cold Water",
          artists: "Justin Bieber, Major Laser",
          songImagePath: "assets/img/album_img2.png",
          press: () {},
        ),
        SongTile(
          name: "Cold Water",
          artists: "Justin Bieber, Major Laser",
          songImagePath: "assets/img/album_img2.png",
          press: () {},
        ),*/
        ListTile(),
      ],
    );
  }
}

class ViewAllBtn extends StatelessWidget {
  const ViewAllBtn({
    Key? key,
    required this.press,
  }) : super(key: key);

  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 75,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 47, 42, 48),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
          onPressed: () => press(),
          child: const Text(
            "View all",
            style: TextStyle(
              color: txtColor,
              fontSize: 14,
            ),
          )),
    );
  }
}
