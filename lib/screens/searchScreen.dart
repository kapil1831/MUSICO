import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:musico/constants.dart';
import 'package:musico/helper/format.dart';
import 'package:musico/helper/helper.dart';
import 'package:musico/widgets/mywidgets.dart';

class SearchScreenWig extends StatefulWidget {
  const SearchScreenWig({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreenWig> createState() => _SearchScreenWigState();
  static _SearchScreenWigState? of(BuildContext context) =>
      context.findAncestorStateOfType<_SearchScreenWigState>();
}

class _SearchScreenWigState extends State<SearchScreenWig> {
  Future<bool>? isSearched;
  Future<List<SongData>> songs = Future(
    () => <SongData>[],
  );

  set getSongs(Future<List<SongData>> value) {
    setState(() {
      songs = value;
    });
  }

  List recentSearches = []; //list of recent searches
  List<Widget> searchResList = []; //list of views

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBox(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              MyHeadingText(
                headingName: "Recent Searches",
              ),
              Spacer(),
              ClearBtn(press: () {}),
            ],
          ),
        ),
        FutureBuilder(
          future: songs,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(txtColor)),
              );
            } else {
              if (!snapshot.hasData) {
                return Text("no such song");
              } else if (snapshot.hasError) {
                return Text("no such song");
              }
              return Container(
                child: Column(
                  children: snapshot.data.map<Widget>((SongData song) {
                    print("this in search screen: $song");
                    return SongTile(
                        song_data: song,
                        artists: song.singers,
                        name: song.song,
                        press: () {},
                        songImagePath: song.image,
                        songUrl: song.encrypted_media_url);
                  }).toList(),
                ),
              );
            }
          },
        ),
        /*  SongTile(song_data: song,
            name: "Cold Water",
            artists: "Justin Bieber, Major Laser",
            songImagePath: "assets/img/album_img2.png",
            press: () {},
          ),
          SongTile(
            name: "2U",
            artists: "Justin Bieber, Major Laser",
            songImagePath: "assets/img/album_img2.png",
            press: () {},
          ),*/
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: MyHeadingText(
            headingName: "Based on what you like",
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FeatureBox2(
                  featureBoxImage: "assets/img/album_img_techno_90s.png",
                  press: () {},
                ),
                FeatureBox2(
                  featureBoxImage: "assets/img/album_img_best_of_pop_music.png",
                  press: () {},
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FeatureBox2(
                  title1: "Your Top",
                  title2: "Artists",
                  featureBoxImage: "assets/img/bg_image_1.png",
                  press: () {},
                ),
                FeatureBox2(
                  featureBoxImage: "assets/img/album_img_techno_90s.png",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class SearchBtn extends StatelessWidget {
  const SearchBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: myGreyColor,
          border: Border.all(
              color: myGreyColor, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: myDarkColor,
            )
          ]),
      child: Icon(
        Icons.search,
        color: txtColor,
      ),
    );
  }
}

class SearchBox extends StatefulWidget {
  SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String searchThis = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: width * 0.80,
          child: TextField(
            cursorColor: txtColor,
            style: TextStyle(color: txtColor),
            onChanged: (value) {
              setState(() {
                searchThis = value;
              });
              print(searchThis);
            },
            onSubmitted: (value) {
              setState(() {
                searchThis = value;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: myGreyColor,
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(15),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              suffix: Container(
                height: 25,
                width: 25,
                child: IconButton(
                  onPressed: () async {
                    print(searchThis);

                    SearchScreenWig.of(context)?.getSongs =
                        search_song(searchThis);
                  },
                  icon: Icon(
                    Icons.search,
                    color: txtColor,
                    size: 20,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 20),
              hintText: "Search",
              // labelText: "search",
              //labelStyle: TextStyle(color: txtColor),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        SearchBtn(),
      ],
    );
  }
}

class ClearBtn extends StatelessWidget {
  const ClearBtn({
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
        color: myGreyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
          onPressed: () => press(),
          child: Text(
            "Clear",
            style: TextStyle(
              color: txtColor,
              fontSize: 14,
            ),
          )),
    );
  }
}
