import 'dart:html';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musico/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:musico/helper/format.dart';
import 'package:musico/helper/helper.dart';
import 'package:musico/screens/firstScreen.dart';
import 'package:audio_service/audio_service.dart';
import 'package:musico/screens/player_screen.dart';

//
late AudioHandler _audioHandler;
void main() async {
  _audioHandler = await AudioService.init(
      builder: () => AudioPlayerHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: "com.ram.musico.channel.audio",
        androidNotificationChannelName: "Musico",
        androidNotificationOngoing: true,
      ));
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: 'Musico',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          onBackground: myGreyColor,
          background: myGreyColor,
          surface: Colors.white,
          onSurface: Colors.white54,
          error: Colors.red,
          onError: Colors.redAccent,
          secondary: Colors.white,
          onSecondary: Colors.white54,
          primary: myDarkColor,
          onPrimary: Colors.amber,
        ),
        primarySwatch: myDarkColor,
        primaryColor: myDarkColor,
        secondaryHeaderColor: Colors.white,
        textTheme: TextTheme(
            button: TextStyle(color: txtColor),
            bodyText1: TextStyle(color: txtColor),
            bodyText2: TextStyle(color: txtColor)),
        textSelectionColor: txtColor,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                myDarkColor.shade900,
                myDarkColor.shade800,
                myDarkColor.shade700,
                myDarkColor.shade500,
              ],
            ),
          ),
          child: FirstScreenImageCard(),
        ),
      ),
    );
  }
}

class AudioPlayerHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  String songData =
      "ID2ieOjCrwfgWvL5sXl4B1ImC5QfbsDyX5I87IdrNwc28ODjLeKOMB68Ith0Jxos7n/ZlbzChEbKs5SC0x1hSBw7tS9a8Gtq"; //url

  @override
  AudioPlayerHandler() {
    //broadcasting that we're loading and what controls are available
    playbackState.add(playbackState.value.copyWith(
      controls: [MediaControl.play],
      processingState: AudioProcessingState.loading,
    ));

    _player.setSourceUrl(decrypt_url(songData).then((_) {
      playbackState.add(playbackState.value
          .copyWith(processingState: AudioProcessingState.ready));
    }));
  }

  _playerStream() {
    final playerUrl = songData;
    var url = decrypt_url(playerUrl);
    return _player.play(UrlSource(url)); //when ready play
    //return _player.setSourceUrl(url); //get ready resources
  }

  @override
  Future<void> play() async {
    playbackState.add(playbackState.value.copyWith(
      controls: [MediaControl.pause],
      playing: true,
    ));
    await _player.resume();
  }

  @override
  Future<void> pause() async {
    playbackState.add(playbackState.value.copyWith(
      controls: [MediaControl.play],
      playing: false,
    ));
    await _player.pause();
  }

  @override
  Future<void> stop() => _player.stop();
}
