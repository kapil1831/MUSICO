import 'dart:math';
import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musico/constants.dart';
import 'package:musico/helper/format.dart';
import 'package:musico/helper/helper.dart';
import 'package:musico/widgets/mywidgets.dart';
import 'package:musico/main.dart';

/*import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:rxdart/rxdart.dart';
*/

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({
    Key? key,
    required this.userImage,
    this.songData =
        "ID2ieOjCrwfgWvL5sXl4B1ImC5QfbsDyX5I87IdrNwc28ODjLeKOMB68Ith0Jxos7n/ZlbzChEbKs5SC0x1hSBw7tS9a8Gtq",
    required this.song_Data,
  }) : super(key: key);
  final String userImage;
  final String songData;
  final SongData song_Data;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AudioPlayer _player = AudioPlayer();
  Future? isReady;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero; //current position
  // IconData icon = Icons.play_arrow_rounded;
  ReleaseMode _mode = ReleaseMode.stop;

  _playerStream() {
    final playerUrl = widget.song_Data.encrypted_media_url;
    print(widget.song_Data.image);
    var url = decrypt_url(playerUrl);
    print(url);
    //_player.setReleaseMode(ReleaseMode.release);
    //_player.setReleaseMode(ReleaseMode.loop);

    //return _player.setSourceUrl(url); //get ready resources
    return _player.play(UrlSource(url)); //when ready play
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isReady = _playerStream();
    });

    _player.onPlayerComplete.listen((event) async {
      if (!mounted) return;
      setState(() {
        isPlaying = false;
      });
    });
    _player.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        isPlaying = (state == PlayerState.playing);
      });
    });
    // listen to audio duration
    _player.onDurationChanged.listen((newDuration) {
      if (!mounted) return;
      setState(() {
        duration = newDuration;
      });
    });

    // listen to audio position change
    _player.onPositionChanged.listen((newPostion) {
      if (!mounted) return;
      setState(() {
        position = newPostion;
      });
    });
  }

  @override
  void dispose() async {
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    await _player.release();
    await _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myDarkColor.shade800,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NotificationBtn(),
                UserDetailBtn(userImage: widget.userImage),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: myDarkColor.shade800),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Column(
                children: [
                  PlayerCoverImage(
                    bgImagePath: widget.song_Data.image,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            width: width * 0.7,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.song_Data.song,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: txtColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n${widget.song_Data.singers}",
                                    style: TextStyle(
                                      color: txtColor2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.download_rounded,
                              color: txtColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.favorite_border,
                              color: txtColor,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Slider(
                    min: 0.00,
                    max: duration.inSeconds.toDouble(),
                    //max: 3.5,
                    onChangeEnd: (double newValue) {
                      //print('Ended change on $newValue');
                    },
                    label: 'ok',
                    thumbColor: playBtnColor,
                    inactiveColor: myGreyColor,
                    activeColor: txtColor,
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) {
                      setState(
                        () {
                          position = Duration(seconds: value.toInt());
                          _player.seek(position);
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            formatTime(position),
                            style: TextStyle(color: txtColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            formatTime(duration),
                            style: TextStyle(color: txtColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          const Expanded(
                            child: Icon(
                              Icons.skip_previous_rounded,
                              color: txtColor,
                              size: 36,
                            ),
                          ),
                          FutureBuilder(
                            future: isReady,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Center(
                                    child: const CircularProgressIndicator());
                              }
                              return Expanded(
                                child: CustomPlayButton(
                                  icon: isPlaying
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                  press: () async {
                                    /* on-press play song and change icon to playing, 
                              if playing on click pause and change icon to paused */
                                    if (isPlaying) {
                                      await _player.pause();
                                    } else {
                                      await _player.resume();
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                          const Expanded(
                            child: Icon(
                              Icons.skip_next_rounded,
                              color: txtColor,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Display play/pause button and volume/speed sliders.
                  StreamBuilder<PlaybackState>(
                    stream: _audioHandler.playbackState,
                    builder: (context, snapshot) {
                      final playing = snapshot.data?.playing ?? false;
                      final processingState = snapshot.data?.processingState ??
                          AudioProcessingState.idle;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (playing)
                            ElevatedButton(
                                child: Text("Pause"),
                                onPressed: _audioHandler.pause)
                          else
                            ElevatedButton(
                                child: Text("Play"),
                                onPressed: _audioHandler.play),
                        ],
                      );
                    },
                  ),
                ],
              ),
              /* Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NotificationBtn(),
                      UserDetailBtn(userImage: widget.userImage),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
}

class SongSlider extends StatefulWidget {
  const SongSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<SongSlider> createState() => _SongSliderState();
}

class _SongSliderState extends State<SongSlider> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Slider(
      //max: 3.5,
      onChangeEnd: (double newValue) {
        print('Ended change on $newValue');
      },
      label: '$sliderValue',
      thumbColor: playBtnColor,
      inactiveColor: myGreyColor,
      activeColor: txtColor,
      value: sliderValue,
      onChanged: (value) {
        print(value);
        setState(
          () {
            sliderValue = value;
          },
        );
      },
    );
  }
}

class PlayerCoverImage extends StatelessWidget {
  const PlayerCoverImage(
      {Key? key,
      this.bgImagePath = "assets/img/bg_image_1.png",
      this.isNetworkImage = false})
      : super(key: key);
  final String bgImagePath;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.5,
      width: width * 0.9,
      child: Image.network(
        bgImagePath,
        fit: BoxFit.cover,
        opacity: const AlwaysStoppedAnimation<double>(0.8),
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(bgImagePath);
        },
      ),
    );
  }
}
